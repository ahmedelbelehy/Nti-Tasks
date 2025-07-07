import 'package:flutter/material.dart';
import 'package:store/core/helper/cash_helper.dart';
import 'package:store/my_app.dart';

void main() async {
  final CashSharedHelper cashHelper = CashSharedHelper();
  WidgetsFlutterBinding.ensureInitialized();

  await cashHelper.init();

  runApp(const MyApp());
}
