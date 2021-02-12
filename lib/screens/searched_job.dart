import 'package:DevJobs/models/job.dart';
import 'package:DevJobs/providers/jobs.dart';
import 'package:DevJobs/providers/news.dart';
import 'package:DevJobs/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(),
      body: _isLoading
          ? Center(
              child: SpinKitRotatingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            )
          : Container(
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
