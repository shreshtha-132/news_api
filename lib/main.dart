import 'package:flutter/material.dart';
import 'package:news_api/screens/everything.dart';
import 'package:news_api/screens/landingPage.dart';
import 'package:news_api/screens/topHeadlines.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: Landing.id,
      routes: {
        Landing.id: (context) => Landing(),
        Everything.id: (context) => Everything(),
        TopHeadlines.id: (context) => TopHeadlines(),
      },
    );
  }
}
