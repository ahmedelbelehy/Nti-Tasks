import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackgroundState {
  final int currentIndex;
  final String appBarTitle;
  final Color appBarColor;

  BackgroundState({
    required this.currentIndex,
    required this.appBarTitle,
    required this.appBarColor,
  });

  BackgroundState copyWith({
    int? currentIndex,
    String? appBarTitle,
    Color? appBarColor,
  }) {
    return BackgroundState(
      currentIndex: currentIndex ?? this.currentIndex,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      appBarColor: appBarColor ?? this.appBarColor,
    );
  }
}

class BackgroundCubit extends Cubit<BackgroundState> {
  BackgroundCubit()
    : super(
        BackgroundState(
          currentIndex: 0,
          appBarTitle: 'لا إله إلا الله',
          appBarColor: Colors.teal,
        ),
      );

  void changeBackground(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void changeAppBar(String title, Color color) {
    emit(state.copyWith(appBarTitle: title, appBarColor: color));
  }
}
