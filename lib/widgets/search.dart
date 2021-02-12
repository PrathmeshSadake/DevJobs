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
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(),
            child: Center(child: Text('Search for Jobs')),
          ),
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
                    Radius.circular(50),
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
                borderRadius: BorderRadius.circular(30),
                color: Colors.amber,
              ),
              child: Text(
                'SEARCH',
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
