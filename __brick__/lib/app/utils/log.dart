import 'package:logger/logger.dart';

/// Getter for singleton, accessible from anywhere
Logger get logger => Log();

/// This class is used to log messages into the console.
/// It is based on the package Logger.
///
/// There are several levels of logs :
/// - verbose
/// - debug
/// - info
/// - warning
/// - error
/// - wtf
/// - nothing
///
/// The class is a Singleton.
class Log extends Logger {
Log._()
    : super(
        printer: PrettyPrinter(
          dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
        ),
      );

  static final _instance = Log._();

  /// Primary public constructor, returns instance of singleton 
  // ignore: sort_unnamed_constructors_first, sort_constructors_first
  factory Log() {
    return _instance;
  }
}
