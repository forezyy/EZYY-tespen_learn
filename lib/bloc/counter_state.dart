part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({this.counter = 1});

  @override
  List<Object> get props => [counter];
}
