import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counter = 0;

  bool loadingProgress = false;

  CounterCubit() : super(CounterInitial());

  static CounterCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  changeCounter() {
    counter++;
    emit(CounterInitial());
  }

  changeCounter2() {
    counter--;
    emit(CounterInitial());
  }

  login() {
    loadingProgress = true;
    emit(CounterInitial());

    Future.delayed(const Duration(seconds: 3), () {
      loadingProgress = false;
      emit(CounterInitial());
    });
  }
}
