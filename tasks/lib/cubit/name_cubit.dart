import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/cubit/name_state.dart';
import 'package:flutter/material.dart';

class ImageTextCubit extends Cubit<ImageTextState> {
  ImageTextCubit() : super(const InitialImageTextState());

  void toggleContent() {
    if (state.text == " hello") {
      emit(
        const UpdatedImageTextState(
          text: " welcome back",
          imagePath:
              "https://i.pinimg.com/736x/55/33/5c/55335c708ac05d8f469894d08e2671fa.jpg",
          buttonColor: Color.fromARGB(255, 21, 185, 171),
        ),
      );
    } else {
      emit(const InitialImageTextState());
    }
  }
}
