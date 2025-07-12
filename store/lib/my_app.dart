import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/auth/cubit/cubit/auth_cubit.dart';
import 'package:store/feature/cart_page/cubit/cart_cubit.dart';
import 'package:store/feature/favorite_page/cubit/favorite_cubit.dart';
import 'package:store/feature/laptop_page/cubit/laptop_cubit.dart';
import 'package:store/feature/profile/cubit/cubit/profile_cubit.dart'; // ✅ Import ProfileCubit
import 'package:device_preview/device_preview.dart';
import 'package:store/splash_screen.dart';

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
        BlocProvider(
          create: (_) => ProfileCubit(),
        ), // ✅ Add ProfileCubit globally
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Laptops Store',
        home: const SplashScreen(),
      ),
    );
  }
}
