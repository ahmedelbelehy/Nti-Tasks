import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipit_app/feature/home/view/screen/home_screen.dart';
import 'package:recipit_app/feature/home/view_model/recipit_cubit.dart';

BlocProvider<RecipitCubit> recipitCubit() => BlocProvider(
  create: (_) => RecipitCubit()..getRecipts(),
  child: RecipeScreen(),
);
