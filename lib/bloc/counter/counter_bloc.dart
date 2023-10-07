import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:counter_app_with_bloc/bloc/bloc_imports.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementState(state.counterValue + 1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState(state.counterValue - 1));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
