import 'package:flutter/material.dart';
import 'package:news_api/screens/everything.dart';
import 'package:news_api/screens/topHeadlines.dart';

import '../components/RoundedButton.dart';
import '../constants.dart';

class Landing extends StatefulWidget {
  static String id = 'Landing';

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(), //  TODO:logo and pictures

            Container(
              child: Text("Welcome Back !"),
            ), // welcome text
            SizedBox(
              height: 24,
            ),

            Container(
              // email and pass
              child: Column(
                children: [
                  TextField(
                    // email
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: "Email"),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    //password
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: "Password"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              child: Column(
                children: [
                  RoundedButton(
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, TopHeadlines.id);
                    }, // TODO: implement login functionality
                    text: 'SignIn',
                  ),
                  RoundedButton(
                    color: Colors.lightBlueAccent,
                    onPressed: () {}, // TODO: implement login functionality
                    text: 'SignUp',
                  ),
                ],
              ),
            ) // singin and singup button
          ],
        ),
      ),
    );
  }
}
