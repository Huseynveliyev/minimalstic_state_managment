import 'package:flutter/material.dart';
import 'package:minimalistic_state_managment/counter_text.dart';
import 'package:minimalistic_state_managment/locator/locator.dart';
import 'package:minimalistic_state_managment/model/post.dart';
import 'package:minimalistic_state_managment/state/counter_state.dart';
import 'package:minimalistic_state_managment/state/list_view_state.dart';
import 'package:minimalistic_state_managment/widget/appbar_icon.dart';
import 'package:minimalistic_state_managment/widget/list_view_container.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Post postToAdd = Post(
    1,
    99,
    "Huseyn Veliyev",
    "magni doloribus qui repudiandae vero nisi sit quos veniam quod sed accusamus veritatis error",
  );

  @override
  void initState() {
    super.initState();
    final state = getIt.get<CounterState>();
    state.counter.addListener(() {
      if (state.counter.value % 10 == 0 && state.counter.value > 0) {
        _showMyDialog();
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Reset Counter'),
              onPressed: () {
                Navigator.of(context).pop();
                final state = getIt.get<CounterState>();
                state.refreshCounter();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [AppBarIcon()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // '$_counter'
            const CounterText(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final state = getIt.get<CounterState>();
                    state.incrementCounter();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final state = getIt.get<CounterState>();
                    state.decrementCounter();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final state = getIt.get<CounterState>();
                state.refreshCounter();
              },
              child: const Icon(Icons.refresh),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              height: 400,
              child: ListViewContainer(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final state = getIt.get<ListViewState>();
          state.addPostTapped(postToAdd);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
