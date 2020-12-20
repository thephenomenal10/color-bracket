import 'package:color_bracket_task/widgets/dialogWidget.dart';
import 'package:color_bracket_task/screens/landingPage.dart';
import 'package:color_bracket_task/service/networkHandler.dart';
import 'package:color_bracket_task/screens/registeredUsers.dart';
import 'package:color_bracket_task/screens/signupPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  NetworkHandler networkHandler = new NetworkHandler();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  var loading = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "LOGIN",
          style: new TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => LandingPage()))),
        backgroundColor: Colors.blue.shade900,
        brightness: Brightness.dark,
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: ListView(
                children: [
                  Container(
                    color: Colors.lightBlue.shade50,
                    height: 90,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Enter to the App",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Text(
                          "Please add a Email and password to login",
                          style: new TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border:
                                    Border.all(color: Colors.grey, width: 2.0)),
                            margin: EdgeInsets.only(top: 20, bottom: 5),
                            height: 60,
                            width: 330,
                            child: TextFormField(
                              validator: validateEmail,
                              controller: emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15.0),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border:
                                    Border.all(color: Colors.grey, width: 2.0)),
                            margin: EdgeInsets.only(top: 20, bottom: 5),
                            height: 60,
                            width: 330,
                            child: TextFormField(
                              validator: (val) {
                                if (val.isEmpty) return "password is not empty";
                              },
                              controller: passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15.0),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width / 1.3,
                            height: 50,
                            child: RaisedButton(
                                child: new Text(
                                  "Log In",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                color: Colors.lightBlueAccent,
                                splashColor: Colors.lightBlue,
                                elevation: 2.0,
                                onPressed: () {
                                  onSubmit(context);
                                }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                              onPressed: () => AlertDialog(
                                    content: Text("Forgot password"),
                                  ),
                              child: new Text(
                                "Forgot Password? ",
                                style: new TextStyle(color: Colors.blue),
                              )),
                          FlatButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage())),
                              child: new Text(
                                "Don't have account? signup",
                                style: new TextStyle(color: Colors.blue),
                              )),
                        ],
                      ))
                ],
              ),
            ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  void onSubmit(context) async {
    try {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        setState(() {
          loading = true;
        });
        Map<String, String> data = {
          "email": emailController.text,
          "password": passController.text
        };
        var status = await networkHandler.post("/login", data);
        setState(() {
          loading = false;
        });

        if (status == 400) {
          showDialog(
              context: context,
              builder: (BuildContext context) => dialogBox(context));
          emailController.clear();
          passController.clear();
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisteredUsers()));
        }
      }
    } catch (e) {
      print("error........ " + e);
    }
  }
}
