import 'package:DevJobs/screens/searched_job.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final myController = TextEditingController();
  String _searchWord = "";
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: TextField(
              autocorrect: true,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                suffixIconConstraints: BoxConstraints(
                  minHeight: 32,
                  minWidth: 80,
                ),
                hintText: 'search',
                hintStyle: TextStyle(fontSize: 18),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              controller: myController,
              onSubmitted: (value) {
                setState(() {
                  _searchWord = value;
                  print(_searchWord);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            SearchedJobScreen(searchField: _searchWord),
                      ));
                });
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) =>
                        SearchedJobScreen(searchField: _searchWord),
                  ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF9AA33),
              ),
              child: Text(
                'SEARCH',
                style: TextStyle(
                  color: Color(0xFF232F34),
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
