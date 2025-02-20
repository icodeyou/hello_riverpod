import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

class AppNotif {
  static void showNotImplementedToast(BuildContext context) {
    Notif.showToast(
      title: 'En cours de travail',
      message: "Ce bouton n'est pas encore développé.",
      context: context,
    );
  }
}
