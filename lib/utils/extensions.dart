import 'package:intl/intl.dart';

///Extension For String
extension StringExtension on DateTime {
  /// Date Extension with Time Zone
  String get dateWithZeroTime =>
      DateTime(year, month, day, hour, minute, second)
          .toUtc()
          .toIso8601String();

  /// e.g == 03-05-01 8:30  AM
  String get dateExtensionWithTime =>
      DateFormat('MMM , d (hh:mm a)').format(this);
}
