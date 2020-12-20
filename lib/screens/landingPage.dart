import 'package:color_bracket_task/widgets/customButton.dart';
import 'package:color_bracket_task/screens/loginPage.dart';
import 'package:color_bracket_task/screens/signupPage.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: new ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/loader.png",
                        scale: 1.0,
                      ),
                      Text(
                        "CURE MANTRA",
                        style: new TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 35,
                            letterSpacing: 1.4),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.asset(
                    "assets/img.png",
                    fit: BoxFit.cover,
                    height: 180,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "A Healthcare app for family.",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "The unique platform where people and doctors comes under same umbrella. Search and book a doctor with a tap of button.",
                    style: new TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                customButton(context, "LOG IN", LoginPage()),
                SizedBox(
                  height: 30,
                ),
                customButton(context, "CREATE ACCOUNT", SignupPage()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
