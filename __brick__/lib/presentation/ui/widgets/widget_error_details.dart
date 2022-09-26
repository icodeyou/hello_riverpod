import 'package:flutter/material.dart';
import 'package:hello_riverpod/presentation/ui/styles/app_colors.dart';

import '../constants/strings.dart';
import '../constants/ui.dart';
import 'widget_main_button.dart';

class ErrorDetailsWidget extends StatelessWidget {
  const ErrorDetailsWidget(
      {required this.errorDebugMessage, Key? key, this.retryCallback})
      : super(key: key);

  final String errorDebugMessage;
  final VoidCallback? retryCallback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(UI.defaultPadding),
          child: Column(
            children: [
              const Text(Strings.errorDefault),
              Text(
                errorDebugMessage,
                style: const TextStyle(color: AppColors.error),
              ),
              const SizedBox(height: UI.defaultPadding),
              if (retryCallback != null)
                MainButtonWidget(
                  message: Strings.retryButton,
                  onPressed: retryCallback,
                )
            ],
          )),
    );
  }
}
