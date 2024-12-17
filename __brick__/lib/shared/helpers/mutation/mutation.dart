import 'package:flutter/material.dart';

enum MutationState { idle, loading }

Future<void> mutate(
  VoidCallback mutation, {
  VoidCallback? onSuccess,
  VoidCallback? onError,
}) async {
  try {
    mutation();
    onSuccess?.call();
  } catch (e) {
    onError?.call();
  }
}
