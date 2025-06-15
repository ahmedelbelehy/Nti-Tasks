import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_task/Screen/cubit/test_state.dart';


class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(MainState(
          name: 'أحمد',
          count: 0,
          color: Colors.blue,
        ));

  final List<String> names = ['Elbelehy', 'Mohamed', 'ِAli'];
  final List<Color> colors = [Colors.blue, Colors.red, Colors.green];
  int _index = 0;

  void updateValues() {
    _index = (_index + 1) % names.length;

    emit(state.copyWith(
      name: names[_index],
      count: state.count + 1,
      color: colors[_index],
    ));
  }
}
