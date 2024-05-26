import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/startup/app_startup_widget.dart';
import 'package:{{projectName}}/shared/providers/riverpod_observer.dart';

/// Root widget to handle splash screen while loading config
class AppStartupScope extends ConsumerWidget {
  /// Constructor
  const AppStartupScope({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      observers: [
        RiverpodObserver(),
      ],
      child: const AppStartupWidget(),
    );
  }
}
