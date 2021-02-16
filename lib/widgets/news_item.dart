import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/launch_url.dart';


class NewsItem extends StatelessWidget {
  final String headline;
  final String description;
  final String source;
  final String webUrl;
  final String date;

  NewsItem({
    this.headline,
    this.description,
    this.source,
    this.webUrl,
    this.date,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LaunchUrl.launchUrl(webUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[200],
            width: 2,
          ),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(
          bottom: 5,
          top: 3,
        ),
        padding: EdgeInsets.all(5),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.open_in_new)],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    headline,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            source,
                            softWrap: true,
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                letterSpacing: .75,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        // Spacer(),
                        Expanded(
                          flex: 1,
                          child: Text(
                            date,
                            softWrap: true,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                letterSpacing: .75,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
