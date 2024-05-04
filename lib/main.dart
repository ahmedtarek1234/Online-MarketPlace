import 'package:e_commerce_c10_monday/config.dart';
import 'package:e_commerce_c10_monday/core/cache/shared_pref.dart';
import 'package:e_commerce_c10_monday/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  configureDependencies();
  runApp(const MyApp());
}
