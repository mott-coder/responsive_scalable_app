import 'package:intl/intl.dart';

String formatCurrency(int amount, {String currency = 'KES '}) {
  final formatter = NumberFormat.currency(locale: 'en_KE', symbol: currency);
  return formatter.format(amount);
}

String formatCurrencyInput(int amount) {
  final formatter = NumberFormat.decimalPattern("en_KE");
  return formatter.format(amount);
}
