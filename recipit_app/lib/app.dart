import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipit_app/feature/home/view/screen/home_screen.dart';
import 'package:recipit_app/feature/home/view_model/recipit_cubit.dart';

class RecipitApp extends StatelessWidget {
  const RecipitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipitCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipit',
        home: RecipeScreen(),
      ),
    );
  }
}
