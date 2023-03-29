import 'package:get_it/get_it.dart';
import 'package:minimalistic_state_managment/state/list_view_state.dart';

import '../state/counter_state.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerSingleton<CounterState>(CounterState());
  getIt.registerSingleton<ListViewState>(ListViewState());
}
