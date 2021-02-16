import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/article.dart';
import './news_item.dart';
import '../providers/news.dart' as proNews;

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<proNews.News>(context).getJobNews().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: SpinKitRotatingCircle(
              color: Color(0xFFF9AA33),
              size: 50.0,
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Consumer<proNews.News>(
              builder: (ctx, news, child) {
                List<Article> newsData = news.getNews;
                return ListView.builder(
                  itemCount: newsData.length,
                  itemBuilder: (ctx, index) => NewsItem(
                    headline: newsData[index].headline,
                    description: newsData[index].description,
                    source: newsData[index].source,
                    webUrl: newsData[index].webUrl,
                    date: newsData[index].date,
                  ),
                );
              },
            ),
          );
  }
}
