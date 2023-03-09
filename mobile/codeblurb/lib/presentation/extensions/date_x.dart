import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get monthAndYear => DateFormat.yMMM().format(this);
}
