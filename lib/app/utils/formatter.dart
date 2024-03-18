import 'package:intl/intl.dart';

abstract class Formatter<T, D> {
  T format(D value);
}

class TemperatureFormatter implements Formatter<String, double> {
  @override
  String format(double value) {
    return value.toStringAsFixed(0) + '°';
  }
}

class WindFormatter implements Formatter<String, double> {
  @override
  String format(double value) {
    return value.toStringAsFixed(0) + ' km/h';
  }
}

class DateFormatter implements Formatter<String, DateTime> {
  @override
  String format(DateTime value) {
    return DateFormat('dd/MM/yyyy').format(value);
  }
}

class DayMonthFormatter implements Formatter<String, DateTime> {
  @override
  String format(DateTime value) {
    return DateFormat('dd/MM').format(value);
  }
}

class DayOfWeekFormatter implements Formatter<String, DateTime> {
  @override
  String format(DateTime value) {
    return DateFormat('EEEE').format(value);
  }
}