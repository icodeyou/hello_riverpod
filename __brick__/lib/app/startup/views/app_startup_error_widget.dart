import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:{{projectName}}/app/i18n/translations.g.dart';

/// Widget to display if an error occurs during app startup
class AppStartupErrorWidget extends StatelessWidget {
  /// Constructor
  const AppStartupErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

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
          if (kDebugMode) Text(message),
          if (!kDebugMode) Text(t.splash.errorTitle),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(t.splash.retryButton),
          ),
        ],
      ),
    );
  }
}
