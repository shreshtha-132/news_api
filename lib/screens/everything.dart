import 'package:flutter/material.dart';

class Everything extends StatefulWidget {
  static String id = 'Everything';

  @override
  _EverythingState createState() => _EverythingState();
}

class _EverythingState extends State<Everything> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //search and filters

              children: [
                Icon(Icons.search),
                Icon(Icons.menu),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Text("Ask Me Anything"),
            ),
            SizedBox(
              height: 12,
            ),
            Container(), // TODO:categories
            SizedBox(
              height: 12,
            ),
            Container(), // TODO:tabs for selected categories
          ],
        ),
      ),
    );
  }
}
