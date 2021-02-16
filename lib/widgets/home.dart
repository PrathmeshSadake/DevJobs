import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/job.dart';
import '../providers/jobs.dart';
import '../widgets/job_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Jobs>(context).getAllJobs().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    _isLoading = false;
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
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Consumer<Jobs>(
              builder: (ctx, jobs, child) {
                List<Job> jobsData = jobs.allJobs;
                return ListView.builder(
                  itemCount: jobsData.length,
                  itemBuilder: (ctx, index) => JobCard(
                    job: Job(
                      id: jobsData[index].id,
                      type: jobsData[index].type,
                      url: jobsData[index].url,
                      createdAt: jobsData[index].createdAt,
                      company: jobsData[index].company,
                      companyUrl: jobsData[index].companyUrl,
                      location: jobsData[index].location,
                      title: jobsData[index].title,
                      description: jobsData[index].description,
                      howToApply: jobsData[index].howToApply,
                      companyLogo: jobsData[index].companyLogo,
                    ),
                  ),
                );
              },
            ),
          );
  }
}
