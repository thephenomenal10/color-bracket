import 'dart:convert';

import 'package:color_bracket_task/models/userModel.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  String baseUrl = "https://reqres.in/api";

  Future<List<User>> get() async {
    // url = appendUrl(url);
    http.Response response = await http.get("https://reqres.in/api/users?page=2");

    if (response.statusCode == 200) {
      Map userData = jsonDecode(response.body);
      List<dynamic> users = userData["data"];
      return users.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("something goes wrong, ${response.statusCode}");
    }
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = appendUrl(url);
    var response = await http.post(url, body: body);
    if (response.statusCode == 200 || response.statusCode == 200) {
      // print(response.statusCode);
      return response.statusCode;
    }
    return response.statusCode;
  }

  String appendUrl(String url) {
    return baseUrl + url;
  }
}
