import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// 상태를 관리할 ChangeNotifier 클래스
class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MaterialApp(
        title: 'Counter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

// Home은 이제 StatelessWidget으로 변경
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Home building");
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Column(children: const [WidgetA(), WidgetB()]),
    );
  }
}

// WidgetA도 StatelessWidget으로 변경
class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetA building");
    return Container(
      color: Colors.purple[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Widget A', style: TextStyle(fontSize: 24.0)),
            SizedBox(height: 20.0),
            WidgetC(),
            SizedBox(height: 20.0),
            WidgetD(),
          ],
        ),
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetB building");
    return Container(
      color: Colors.green[50],
      child: Center(child: Text('Widget B', style: TextStyle(fontSize: 24.0))),
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetC building");
    return Container(
      color: Colors.teal,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('C', style: TextStyle(fontSize: 24.0, color: Colors.white)),
          Consumer<CounterProvider>(
            builder:
                (context, counter, child) => Text(
                  '${counter.counter}',
                  style: const TextStyle(fontSize: 48.0),
                ),
          ),
          ElevatedButton(
            onPressed: () => context.read<CounterProvider>().increment(),
            child: const Text('Action', style: TextStyle(fontSize: 20.0)),
          ),
        ],
      ),
    );
  }
}

class WidgetD extends StatelessWidget {
  const WidgetD({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetD building");
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('D  ', style: TextStyle(fontSize: 24.0)),
          WidgetE(),
          SizedBox(width: 20.0),
          WidgetF(),
        ],
      ),
    );
  }
}

class WidgetE extends StatelessWidget {
  const WidgetE({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetE building");
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.yellow[100],
      ),
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Consumer<CounterProvider>(
          builder:
              (context, counter, child) => Text(
                '${counter.counter}',
                style: const TextStyle(fontSize: 24.0),
              ),
        ),
      ),
    );
  }
}

class WidgetF extends StatelessWidget {
  const WidgetF({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetF building");
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.orange[100],
      ),
      child: Center(child: const Text('F', style: TextStyle(fontSize: 24.0))),
    );
  }
}
