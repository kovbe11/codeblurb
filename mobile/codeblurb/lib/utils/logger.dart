import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  const Logger();

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue: $previousValue,
  "newValue": "$newValue"
}''');
  }
}
