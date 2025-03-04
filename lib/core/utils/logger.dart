import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// Global logger instance
class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      // Customize printer for better output
      methodCount: 2, // Shows the number of method calls in the stack trace
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );
  static Future<void> saveLog(String log) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/app_logs.txt');
      final timestamp = DateTime.now().toIso8601String();
      await file.writeAsString('$timestamp: $log\n', mode: FileMode.append);
    } catch (e) {
      debugPrint("Error saving log: $e");
    }
  }

  // Methods to use across the app
  static void info(String message) => _logger.i(message);
  static void debug(String message) => {
        _logger.d(message),
        saveLog(message),
      };
  static void warning(String message) => _logger.w(message);
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
