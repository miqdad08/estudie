import 'package:logger/logger.dart';

class LoggerUtils {
  static final _logger = Logger(
    printer: PrettyPrinter(
      stackTraceBeginIndex: 0,
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 70,
      colors: true,
      printEmojis: false,
      printTime: true,
    ),
  );

  static void loggerRequest(
      String method,
      String url, [
        String? param,
        String? data,
      ]) {
    _logger.i('$method - $url');
    if (param != null) {
      _logger.v('Query Param : $param');
    }
    if (data != null) {
      _logger.v('Form Data : $data');
    }
  }

  static void loggerResponse(log) {
    _logger.w(log);
  }

  static void loggerError(log) {
    _logger.e(log);
  }

  static void logger(log) {
    _logger.wtf(log);
  }
}
