import 'package:intl/intl.dart';

extension DateFormatting on String {
  String toFullDateTimeFormat() {
    try {
      DateTime date = DateTime.parse(this);
      return DateFormat('d MMMM, y').format(date);
    } catch (e) {
      return "Invalid date and time";
    }
  }
}
