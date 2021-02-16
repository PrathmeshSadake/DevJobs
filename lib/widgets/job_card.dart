import 'package:flutter/material.dart';

import '../models/job.dart';
import '../screens/job_view.dart';
import '../styles/text_styles.dart';

class JobCard extends StatelessWidget {
  final Job job;
  JobCard({this.job});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => JobViewScreen(job),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        margin: EdgeInsets.only(
          bottom: 5,
          top: 3,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200],
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                job.title.toUpperCase().trim(),
                softWrap: true,
                style: jobCardTitleStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Image.network(
                      job.companyLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 3,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.company.toUpperCase(),
                          style: jobCardCompanyNameStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Location: ${job.location}',
                            softWrap: true,
                            style: jobCardLocationStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: 5,
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFFF9AA33),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                job.type,
                style: jobCardTypeStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
