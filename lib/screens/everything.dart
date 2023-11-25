import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Everything extends StatefulWidget {
  static String id = 'Everything';

  @override
  _EverythingState createState() => _EverythingState();
}

class _EverythingState extends State<Everything> {
  var response;
  late Uri url;
  late Map<String, dynamic> data = {};

  Future<void> getData() async {
    try {
      url = Uri.parse(" "); // TODO: add the url.
      response = await http.get(url);

      if (response.statusCode == 200) {
        data = json.decode(response.body);
      } else {
        print('Error: ${response.statusCode}');
        data = {};
      }
    } catch (e) {
      print('Error fetching data: $e');
      data = {};
    }
  }

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
