import 'package:flutter/material.dart';
import 'package:news_api/screens/everything.dart';
import 'package:news_api/screens/topHeadlines.dart';

class Navigation extends StatelessWidget {
  static String id = 'Navigation';
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center buttons vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Everything.id);
                },
                child: Text("Everything You Wanna Know"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, TopHeadlines.id);
                },
                child: Text("Top Headlines"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
