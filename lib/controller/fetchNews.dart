//https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=206f286789b948488aaf24a402a307d5

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:news_app/model/newsArt.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "google-news",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-york-magazine",
    "techcrunch",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews() async {
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=9bb7bf6152d147ad8ba14cd0e7452f2f"));

    Map<dynamic, dynamic> body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
    //print(articles);
    print("*****************************");

    final _Newrandom = new Random();
    var myArticle = articles[_random.nextInt(articles.length)];
    print(myArticle);
    print("*****************************");

    return NewsArt.formAPItoApp(myArticle);
  }
}
