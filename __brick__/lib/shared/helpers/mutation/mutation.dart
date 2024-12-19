import 'package:flutter/material.dart';
import 'package:{{projectName}}/app/utils/log.dart';

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
    logger.e('Mutation failed : $e');
    onError?.call();
  }
}
