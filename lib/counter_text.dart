import 'package:flutter/material.dart';
import 'package:minimalistic_state_managment/locator/locator.dart';
import 'package:minimalistic_state_managment/state/counter_state.dart';

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<CounterState>();
    return ValueListenableBuilder<int>(
      valueListenable: state.counter,
      builder: (context, counterValue, child) {
        TextStyle style() {
          return TextStyle(
            fontSize: counterValue >= 0 ? 30 : 20,
            fontWeight: counterValue >= 0 ? FontWeight.bold : FontWeight.normal,
            color: counterValue >= 0 ? Colors.green : Colors.red,
          );
        }

        return Text(
          '$counterValue',
          style: style(),
        );
      },
    );
  }
}
