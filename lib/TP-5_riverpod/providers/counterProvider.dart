import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 42;
  }

  void increment() => state = state + 1;
  void decrement() => state = state - 1;
  void reset() => state = 0;
}

final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(
  () => CounterNotifier(),
);
