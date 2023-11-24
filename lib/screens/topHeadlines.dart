import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopHeadlines extends StatefulWidget {
  static String id = 'TopHeadlines';

  @override
  _TopHeadlinesState createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  final List<String> countryNames = [
    "United Arab Emirates",
    "Argentina",
    "Austria",
    "Australia",
    "Belgium",
    "Bulgaria",
    "Brazil",
    "Canada",
    "Switzerland",
    "China",
    "Colombia",
    "Cuba",
    "Czech Republic",
    "Germany",
    "Egypt",
    "France",
    "United Kingdom",
    "Greece",
    "Hong Kong",
    "Hungary",
    "Indonesia",
    "Ireland",
    "Israel",
    "India",
    "Italy",
    "Japan",
    "South Korea",
    "Lithuania",
    "Latvia",
    "Morocco",
    "Mexico",
    "Malaysia",
    "Nigeria",
    "Netherlands",
    "New Zealand",
    "Philippines",
    "Poland",
    "Portugal",
    "Romania",
    "Serbia",
    "Russia",
    "Saudi Arabia",
    "Sweden",
    "Singapore",
    "Slovakia",
    "Thailand",
    "Turkey",
    "Taiwan",
    "Ukraine",
    "United States",
    "Venezuela",
    "South Africa"
  ];

  List<String> countryCodes = [
    "ae",
    "ar",
    "at",
    "au",
    "be",
    "bg",
    "br",
    "ca",
    "ch",
    "cn",
    "co",
    "cu",
    "cz",
    "de",
    "eg",
    "fr",
    "gb",
    "gr",
    "hk",
    "hu",
    "id",
    "ie",
    "il",
    "in",
    "it",
    "jp",
    "kr",
    "lt",
    "lv",
    "ma",
    "mx",
    "my",
    "ng",
    "nl",
    "nz",
    "ph",
    "pl",
    "pt",
    "ro",
    "rs",
    "ru",
    "sa",
    "se",
    "sg",
    "sk",
    "th",
    "tr",
    "tw",
    "ua",
    "us",
    "ve",
    "za",
  ];

  String selectedCountryCode = 'ae';

  var response;
  late Uri url;
  late Map<String, dynamic> data = {};

  Future<void> getData() async {
    try {
      url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=$selectedCountryCode&apiKey=fa34d1abef02480bba3fffc3f7393729');
      response = await http.get(url);

      if (response.statusCode == 200) {
        data = json.decode(response.body);
        if (data['articles'] == null) {
          // Handle the case where 'articles' is not present in the response
          print('Error: Articles not found in the response');
          data =
              {}; // Set data to an empty map or handle it differently based on your requirements
        }
      } else {
        print('Error: ${response.statusCode}');
        data =
            {}; // Set data to an empty map or handle it differently based on your requirements
      }
    } catch (error) {
      print('Error fetching data: $error');
      data =
          {}; // Set data to an empty map or handle it differently based on your requirements
    }
  }

  @override
  void initState() {
    // this enables that when the app loads it shows the tabs for the initiallly
    // selected country i.e. uae.
    super.initState();
    getData();
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
              child: Text("Top Headlines"),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: countryNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildButton(countryNames[index], index);
                  }),
            ), // TODO:categories
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data['totalResults']?.toInt() ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return buildTab(index); // TODO: BUILD TABS
                },
              ),
            ), // TODO:tabs for selected categories
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text, int index) {
    // to build horizontal country options
    return Container(
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () async {
          setState(() {
            selectedCountryCode = countryCodes[index];
          });
          // print("country " + selectedCountryCode);
          await getData();

          // refresh the vertical tabs according to the new country selected
        },
        child: Text(text),
      ),
    );
  }

  Widget buildTab(int index) {
    if (index >= 0 && index < data['articles'].length) {
      String imageUrl = data['articles'][index]['urlToImage']?.toString() ?? '';
      String title = data['articles'][index]['title'].toString();

      return Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    width: 100.0,
                    height: 180.0,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.grey, // Placeholder color or other content
                    width: 100.0,
                    height: 180.0,
                    child: Center(
                      child: Text('No Image'),
                    ),
                  ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onTap: () {
            // Handle tap
            print("Tapped on tab");
            print(imageUrl);
          },
        ),
      );
    } else {
      return Container(); // Return an empty container or handle the case
    }
  }
}
