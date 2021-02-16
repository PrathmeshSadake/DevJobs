import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

import '../helpers/launch_url.dart';
import '../models/job.dart';

class JobViewScreen extends StatelessWidget {
  final Job job;
  JobViewScreen(this.job);
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.open_in_browser,
            ),
            onPressed: () => LaunchUrl.launchUrl(''),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/screen.jpg',
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 175),
              padding: EdgeInsets.fromLTRB(
                20,
                30,
                20,
                150,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.company,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    alignment: Alignment.center,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: job.companyLogo,
                      fadeInDuration: const Duration(milliseconds: 100),
                      fadeInCurve: Curves.easeIn,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    job.title,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Html(
                    data: job.description,
                    onLinkTap: (url) => LaunchUrl.launchUrl(url),
                    style: {
                      "p": Style(
                        letterSpacing: .75,
                        fontSize: FontSize(15),
                        color: Colors.black,

                        // height: 2,
                      ),
                      "li": Style(
                        fontSize: FontSize(14),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                      "strong": Style(
                        letterSpacing: 1,
                      ),
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: deviceWidth,
              color: Color(0xFF344955),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    color: Color(
                      0xFFF9AA33,
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Color(0xFF232F34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      LaunchUrl.launchUrl(job.url);
                    },
                  ),
                  RaisedButton(
                    color: Color(0xFFF9AA33),
                    child: Text(
                      'Visit company\'s website',
                      style: TextStyle(
                        color: Color(0xFF232F34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      LaunchUrl.launchUrl(job.companyUrl);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
