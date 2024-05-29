import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{projectName}}/app/utils/log.dart';

class RiverpodObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    //logger.d('Provider $provider was added with value $value');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    //logger.d('Provider $provider was disposed');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    //logger.d('Provider $provider updated from $previousValue to $newValue');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e(
      '''
        ⛔ ERROR IN PROVIDER : $provider
        💬 MESSAGE : $error
        📜 STACKTRACE : $stackTrace
      ''',
    );
  }
}
