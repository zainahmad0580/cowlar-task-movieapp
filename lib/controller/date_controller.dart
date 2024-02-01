import 'dart:developer';

import 'package:intl/intl.dart';

class DateController {
  static String getDateFormatMDY(String? date) {
    try {
      if (date == null) return '';
      // Parse the input string into a DateTime object
      DateTime parsedDate = DateTime.parse(date);

      // Format the DateTime object into the desired format
      String formattedDate = DateFormat('MMMM dd, yyyy').format(parsedDate);
      return formattedDate;
    } catch (e) {
      log('Exception caught in getDateFormat: $e');
      return '';
    }
  }
}
