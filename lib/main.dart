import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/jobs.dart';
import './providers/news.dart';
import './screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Jobs(),
        ),
        ChangeNotifierProvider.value(
          value: News(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF101010),
          accentColor: Color(0xFFF9AA33),
          backgroundColor: Color(0xFFF9FAFE),
        ),
        home: Homepage(),
      ),
    );
  }
}
