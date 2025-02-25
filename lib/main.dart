import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Home building");
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Column(children: const [WidgetA(), WidgetB()]),
    );
  }
}

class WidgetA extends StatefulWidget {
  const WidgetA({super.key});

  @override
  State<WidgetA> createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetA building");
    return Container(
      color: Colors.purple[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Widget A', style: TextStyle(fontSize: 24.0)),
            const SizedBox(height: 20.0),
            WidgetC(counter: counter, increment: increment),
            const SizedBox(height: 20.0),
            WidgetD(counter: counter),
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
  const WidgetC({required this.counter, required this.increment, super.key});

  final int counter;
  final void Function() increment;

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetC building");
    return Container(
      color: Colors.teal,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('C', style: TextStyle(fontSize: 24.0, color: Colors.white)),
          Text('$counter', style: const TextStyle(fontSize: 48.0)),
          ElevatedButton(
            onPressed: increment,
            child: const Text('Action', style: TextStyle(fontSize: 20.0)),
          ),
        ],
      ),
    );
  }
}

class WidgetD extends StatelessWidget {
  const WidgetD({required this.counter, super.key});

  final int counter;

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetD building");
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('D  ', style: TextStyle(fontSize: 24.0)),
          WidgetE(counter: counter),
          const SizedBox(width: 20.0),
          const WidgetF(),
        ],
      ),
    );
  }
}

class WidgetE extends StatelessWidget {
  const WidgetE({required this.counter, super.key});

  final int counter;

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
        child: Text('$counter', style: const TextStyle(fontSize: 24.0)),
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
