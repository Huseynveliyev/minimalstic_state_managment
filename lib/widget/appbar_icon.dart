import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:minimalistic_state_managment/locator/locator.dart';
import 'package:minimalistic_state_managment/state/counter_state.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<CounterState>();
    return ValueListenableBuilder<int>(
        valueListenable: state.counter,
        builder: (context, counterValue, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              counterValue > 0 ? Icons.mood : Icons.mood_bad,
              color: counterValue > 0 ? Colors.green : Colors.red,
            ),
          );
        });
  }
}
