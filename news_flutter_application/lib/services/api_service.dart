import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
// import 'package:news_api_app/model/article_model.dart';

import '../model/article_model.dart';
class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
Future<List<Article>> getArticle() async {
    
    final queryParameters = {
      'country': 'us',
      'category': 'technology',
      'apiKey': 'ad34a042ba9d4775a4c0aa8c18fc708c'
    };
final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    log(uri.toString());
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}