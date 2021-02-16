import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/job.dart';
import '../providers/jobs.dart';
import '../widgets/job_card.dart';

class CategoryJobsScreen extends StatefulWidget {
  final String category;
  CategoryJobsScreen({this.category});

  @override
  _CategoryJobsScreenState createState() => _CategoryJobsScreenState();
}

class _CategoryJobsScreenState extends State<CategoryJobsScreen> {
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Jobs>(context).categorizedJobs(widget.category).then((_) {
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
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<Jobs>(
                builder: (ctx, jobs, child) {
                  List<Job> categoryJobs = jobs.categoryJobs;
                  return ListView.builder(
                    itemCount: categoryJobs.length,
                    itemBuilder: (ctx, index) => JobCard(
                      job: categoryJobs[index],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
