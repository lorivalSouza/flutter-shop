import 'package:flutter/material.dart';

class CounterState {
  int _counter = 0;

  void incrementCounter() => _counter++;
  void decrementCounter() => _counter--;

  int get counter => _counter;
  bool diff(CounterState old) {
    return old._counter != _counter;
  }
}

class Counter extends InheritedWidget {
  final CounterState state = CounterState();

  Counter({
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant Counter oldWidget) {
    return oldWidget.state.diff(state);
  }

  static Counter of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Counter>()!;
  }
}
