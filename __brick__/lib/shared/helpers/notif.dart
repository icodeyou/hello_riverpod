import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// The type of toast to show
enum ToastType {
  /// Basic messages
  basic,
  /// Success messages
  success,
  /// Error messages
  error,
}

/// A class that contains all the methods to show notifications
class Notif {

  /// Show a toast message
  static void showToast(
    BuildContext context,
    String message, {
    ToastType? type,
    Duration? duration,
  }) {
    BotToast.showText(
      text: message,
      textStyle: TextStyle(
        color: type == ToastType.error
            ? ThemeColors.onStatusError
            : type == ToastType.success
                ? ThemeColors.onStatusSuccess
                : ThemeColors.onStatusInfo(context),
        fontSize: ThemeSizes.xl,
        fontWeight: FontWeight.bold,
      ),
      align: Alignment.center,
      crossPage: true,
      contentColor: type == ToastType.error
          ? ThemeColors.statusError
          : type == ToastType.success
              ? ThemeColors.statusSuccess
              : ThemeColors.statusInfo,
    );
  }
}
