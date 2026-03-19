import 'package:flutter/material.dart';

import 'app.dart';
import 'core/services/dio/dio_provider.dart';
import 'core/services/local/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();
  runApp(const MainApp());
}
