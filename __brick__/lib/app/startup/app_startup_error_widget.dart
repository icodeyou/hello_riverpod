import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';

/// Widget to display if an error occurs during app startup
class AppStartupErrorWidget extends StatelessWidget {
  /// Constructor
  const AppStartupErrorWidget({
    Key? key,
    required this.message,
    required this.onRetry,
  }) : super(key: key);

  /// Error message
  final String message;

  /// Retry callback
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (kDebugMode) AppText.l(message),
          if (!kDebugMode) AppText.l(t.splash.errorTitle),
          const AppGap.xl(),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(t.splash.retryButton),
          ),
        ],
      ),
    );
  }
}
