import 'package:flutter/material.dart';

enum MutationState { idle, loading }

Future<void> mutate(
  Future<void> Function() mutation, {
  VoidCallback? onSuccess,
  VoidCallback? onError,
}) async {
  try {
    await mutation();
    onSuccess?.call();
  } catch (e) {
    onError?.call();
  }
}
