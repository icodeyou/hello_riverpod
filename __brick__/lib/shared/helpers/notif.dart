import 'package:bot_toast/bot_toast.dart';
import 'package:everywear_theme/common/constants/colors.dart';
import 'package:everywear_theme/common/views/text.dart';
import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

enum ToastType {
  basic,
  success,
  error,
}

class Notif {
  static void showToast(
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
                : ThemeColors.onStatusInfo,
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
