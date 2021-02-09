import 'package:intl/intl.dart';

class DateFormatter {
  String formatter(String date) {
    var formattedDate;
    if (date != null && date.length >= 18) {
      formattedDate = date.substring(0, date.length - 18);
    }
    return formattedDate;
  }

  String newsDateFormatter(String date) {
    DateTime parsedDate = DateTime.parse(date);
    var formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return formattedDate;
  }
}
