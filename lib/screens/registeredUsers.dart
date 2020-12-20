import 'package:color_bracket_task/service/networkHandler.dart';
import 'package:color_bracket_task/models/userModel.dart';
import 'package:flutter/material.dart';

class RegisteredUsers extends StatefulWidget {
  @override
  _RegisteredUsersState createState() => _RegisteredUsersState();
}

class _RegisteredUsersState extends State<RegisteredUsers> {
  NetworkHandler networkHandler = new NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ColorBracket"),
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: networkHandler.get(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Card(
                            color: Colors.white,elevation: 0,
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var currentUser = snapshot.data[index];
                                  return ListTile(
                                    autofocus: true,
                                    title: Text(currentUser.firstName +" "+ currentUser.lastName),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(currentUser.avatar),
                                    ),
                                    subtitle: Text(
                                        "Email: ${currentUser.email}"),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Center(
                          child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 82.0,
                      )),
                      Text("There is something wrong",style: new TextStyle(color: Colors.red, fontSize: 18),),
                    ],
                  ),
                );
              }
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Loading at the moment, please hold the line.")
                ],
              ));
              })),
    );
  }
}
