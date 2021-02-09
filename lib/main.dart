
import 'package:DevJobs/providers/categories.dart';
import 'package:DevJobs/providers/jobs.dart';
import 'package:DevJobs/providers/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          accentColor: Color(0xFF111111),
          backgroundColor: Color(0xFFF9FAFE),
        ),
        home: Homepage(),
      ),
    );
  }
}
