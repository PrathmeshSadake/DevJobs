import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/job.dart';
import '../providers/jobs.dart';
import '../widgets/job_card.dart';

class SearchedJobScreen extends StatefulWidget {
  final String searchField;
  SearchedJobScreen({this.searchField});

  @override
  _SearchedJobScreenState createState() => _SearchedJobScreenState();
}

class _SearchedJobScreenState extends State<SearchedJobScreen> {
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Jobs>(context).searchJobs(widget.searchField).then((_) {
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFF9AA33)),
        backgroundColor: Color(0xFF344955),
        elevation: 0,
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
      ),
      body: _isLoading
          ? Center(
              child: SpinKitRotatingCircle(
                color: Color(0xFFF9AA33),
                size: 50.0,
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<Jobs>(
                builder: (ctx, jobs, child) {
                  List<Job> searchedJobs = jobs.searchedJobs;
                  return ListView.builder(
                    itemCount: searchedJobs.length,
                    itemBuilder: (ctx, index) => JobCard(
                      job: searchedJobs[index],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
