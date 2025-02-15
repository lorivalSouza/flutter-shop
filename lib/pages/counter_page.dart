import 'package:flutter/material.dart';

import '../providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Page Couter'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Counter: ${Counter.of(context).state.counter}',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Counter.of(context).state.incrementCounter();
                });
              },
              child: Text('Increment'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Counter.of(context).state.decrementCounter();
                });
              },
              child: Text('Decrement'),
            ),
          ),
        ],
      ),
    );
  }
}
