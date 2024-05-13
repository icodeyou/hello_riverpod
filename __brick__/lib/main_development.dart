import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/startup/app_startup_widget.dart';

void main() {
  runApp(const ProviderScope(child: AppStartupWidget()));
}