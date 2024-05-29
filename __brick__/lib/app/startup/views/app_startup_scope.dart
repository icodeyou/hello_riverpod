import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/init/riverpod/riverpod_observer.dart';
import 'package:{{projectName}}/app/startup/views/app_startup_widget.dart';

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
