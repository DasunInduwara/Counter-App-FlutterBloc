part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;

  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counterValue: 0);
}

class CounterIncrementState extends CounterState {
  CounterIncrementState(int incresedValue) : super(counterValue: incresedValue);
}

class CounterDecrementState extends CounterState {
  CounterDecrementState(int decresedValue) : super(counterValue: decresedValue);
}
