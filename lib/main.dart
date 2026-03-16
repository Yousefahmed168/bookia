import 'package:flutter/material.dart';

import 'app.dart';
import 'core/srevices/dio/dio_provider.dart';
import 'core/srevices/local/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();
  runApp(const MainApp());
}
