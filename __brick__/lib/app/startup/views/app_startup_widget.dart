import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/app.dart';
import 'package:{{projectName}}/app/startup/providers/app_startup_provider.dart';
import 'package:{{projectName}}/app/startup/views/app_startup_error_widget.dart';

/// Root widget to handle splash screen while loading config
class AppStartupWidget extends ConsumerWidget {
  /// Constructor
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      error: (e, st) {
        return AppStartupErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(appStartupProvider),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      data: (data) {
        return const App();
      },
    );
  }
}
