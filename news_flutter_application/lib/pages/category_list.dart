import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_application/pages/news_feed.dart';

import '../services/api_service.dart';

class CategoryList extends StatelessWidget {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    // backing data
    final europeanCountries = [
      'Business','Entertainment','General','Health','Science','Sports','Technology'
    ];

    return Scaffold(
      appBar: AppBar(
          title: Text("Category", style: TextStyle(color: Colors.black)),
        backgroundColor: CupertinoColors.activeGreen
          ),
      body: ListView.builder(
        itemCount: europeanCountries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(europeanCountries[index]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
              builder: (context) => NewsFeed(category: europeanCountries[index])
              ),
              );
            }
          );
        },
      ),
    );
  }
}
