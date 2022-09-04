import 'package:intl/intl.dart';
import 'package:shifts_offers/resources/constants.dart';

extension DateHelper on String? {
  String formatDate() {
    String format = '';

    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(this!);

    format = DateFormat('EEEE d MMMM').format(tempDate);

    return format;
  }

  String? todayText() {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(this!);
    if (tempDate == DateTime.now()) {
      return today;
    } else {
      return null;
    }
  }

  String formatTime() {
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(this!);

    String formattedTime = DateFormat.Hm().format(tempDate);

    return formattedTime;
  }
}
