// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): add documentation and remove ignore comment

import 'package:flutter/foundation.dart';

class Print {
  static void info(String message) {
    debugPrint(message);
  }

  static void debug({Object? objectOrMessage, bool stack = true}) {
    debugPrintStack(
      label: '🐼 DEBUG : ${objectOrMessage ?? ""}',
      maxFrames: stack ? 3 : 0,
    );
  }

  static void error(String description, [String? title]) {
    if (title != null && title.isNotEmpty) {
      debugPrint('❌❌❌ $title');
    }
    debugPrintStack(label: '❌ ERROR : $description', maxFrames: 6);
  }

  static void warning(String message) {
    debugPrintStack(label: '⚠️ WARNING : $message', maxFrames: 3);
  }

  static void exception(Object exception) {
    debugPrintStack(label: '🤜️ CAUGHT EXCEPTION : $exception', maxFrames: 3);
  }
}
