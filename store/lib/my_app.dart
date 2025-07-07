import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/auth/cubit/cubit/auth_cubit.dart';
import 'package:store/feature/auth/view/screens/register_page.dart';
import 'package:store/feature/cart_page/cubit/cart_cubit.dart';
import 'package:store/feature/favorite_page/cubit/favorite_cubit.dart';
import 'package:store/feature/laptop_page/cubit/laptop_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => LaptopCubit()..getLaptops()),
        BlocProvider(create: (_) => FavoriteCubit()..getFavorites()),
        BlocProvider(create: (_) => AuthCubit()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Laptops Store',
        home: RegisterPage(),
      ),
    );
  }
}
