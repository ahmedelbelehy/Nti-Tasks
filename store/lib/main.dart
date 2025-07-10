import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:store/core/helper/cash_helper.dart';
import 'package:store/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CashSharedHelper.init();

  runApp(
    DevicePreview(enabled: true, builder: (context) => const SplashScreen()),
  );
}
