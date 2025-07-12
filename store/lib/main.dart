import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:store/core/helper/cash_helper.dart';
import 'my_app.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashSharedHelper.init();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(), 
    ),
  );
}
