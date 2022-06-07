import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_application/model/news_feed_model.dart';

import '../components/customListTile.dart';
import '../model/article_model.dart';
import '../services/api_service.dart';

class NewsFeed extends StatelessWidget {
  ApiService client = ApiService();
  

  String category = 'technology';
    
    NewsFeed({required this.category});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Feed", style: TextStyle(color: Colors.white)),
        backgroundColor: CupertinoColors.activeBlue
      ),
      body: FutureBuilder(future: client.getArticle(category), builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if(snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(itemCount: articles!.length, itemBuilder: (context, index) => customListTile(articles[index], context));
        }
      return Center(child: CircularProgressIndicator());
      })
    );
  }
}