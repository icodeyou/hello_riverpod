import 'dart:developer';

import 'package:logger/logger.dart';

/// Getter for singleton, accessible from anywhere
Logger get logger => Log();

/// This class is used to log messages into the console.
/// It is based on the package Logger.
///
/// The class is a Singleton.
class Log extends Logger {
  /// Primary public constructor, returns instance of singleton
  factory Log() {
    return _instance;
  }

  Log._()
      : super(
          output: DeveloperConsoleOutput(),
          printer: PrettyPrinter(
            dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
            stackTraceBeginIndex: 5,
            errorMethodCount: 10,
            lineLength: 200,
            printEmojis: false,
            noBoxingByDefault: true,
            methodCount: 5,
            levelColors: {
              /*
                https://github.com/flutter/flutter/issues/64491#issuecomment-1873673674
                0:  Black,      8:  Grey
                1:  Red,        9:  Red Ascend
                2:  Green,      10: Green Ascend
                3:  Yellow      11: Yellow Ascend
                4:  Blue        12: Blue Ascend
                5:  Purple      13: Purple Ascend
                6:  Turquoise   14: Turquoise Ascend
                7:  White       15: Bright White 
              */
              Level.trace: const AnsiColor.fg(6),
              Level.debug: const AnsiColor.fg(8),
              Level.info: const AnsiColor.fg(14),
              Level.warning: const AnsiColor.fg(5),
              Level.error: const AnsiColor.fg(9),
              Level.fatal: const AnsiColor.fg(1),
            },
          ),
        );

  static final _instance = Log._();
}

/// This is where we output the logs to the console.
class DeveloperConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln();
    event.lines.forEach(buffer.writeln);
    log(
      buffer.toString(),
      name: DateFormat('MM.dd').format(DateTime.now()),
    );
  }
}
