import 'package:DevJobs/helpers/date_formatter.dart';
import 'package:DevJobs/models/article.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class News extends ChangeNotifier {
  List<Article> _news = [];

  List<Article> get getNews {
    return [..._news];
  }

  Future<void> getJobNews() async {
    final url =
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bca60ca4665a42e3b01d791bca670476';
    var response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    List extractedData = jsonResponse['articles'];
    List<Article> _loadedItems = [];
    extractedData.forEach(
      (item) {
        if (item['title'] != null &&
            item['author'] != null &&
            item['description'] != null &&
            item['publishedAt'] != null &&
            item['url'] != null) {
          _loadedItems.add(
            Article(
              headline: item['title'],
              source: item['author'],
              description: item['description'],
              date: DateFormatter().newsDateFormatter(item['publishedAt']),
              webUrl: item['url'],
            ),
          );
        }
      },
    );
    _news = _loadedItems;
    print(_news.length);
    notifyListeners();
  }
}
