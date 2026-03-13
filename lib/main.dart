import 'core/srevices/local/shared_pref.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/srevices/dio/dio_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();
  runApp(const MainApp());
}
