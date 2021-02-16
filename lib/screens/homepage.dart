import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/launch_url.dart';
import '../widgets/category-jobs.dart';
import '../widgets/news.dart';
import '../widgets/search.dart';
import '../widgets/home.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you a Developer?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to contribute to this project?'),
                Text('Also please give it a star.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                LaunchUrl.launchUrl(
                    'https://www.github.com/PrathmeshSadake/DevJobs');
              },
            ),
          ],
        );
      },
    );
  }

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Search(),
    CategoryJobsWidget(),
    News(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'DEVJOBS',
            style: GoogleFonts.bioRhyme(
              fontSize: 23,
              fontWeight: FontWeight.w900,
              letterSpacing: 5,
              color: Color(0xFFF9AA33),
            ),
          ),
          iconTheme: IconThemeData(
            color: Color(0xFFF9AA33),
          ),
          actions: [
            GestureDetector(
              onTap: _showMyDialog,
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/icons/github.png',
                  height: 5,
                ),
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Color(0xFF344955),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: .5,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: Color(0xFF344955),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Color(0xFFF9AA33),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
                color: Color(0xFFF9AA33),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                size: 30,
                color: Color(0xFFF9AA33),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.article,
                size: 30,
                color: Color(0xFFF9AA33),
              ),
              label: 'News',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
