import 'package:flutter/material.dart';

class CounterState {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
    debugPrint(counter.value.toString());
  }

  decrementCounter() {
    counter.value--;

    debugPrint(counter.value.toString());
  }

  refreshCounter() {
    counter.value = 0;

    debugPrint(counter.value.toString());
  }
}
