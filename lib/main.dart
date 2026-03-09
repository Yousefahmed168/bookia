import 'package:flutter/material.dart';

import 'app.dart';
import 'core/srevices/dio/dio_provider.dart';

void main() {
  DioProvider.init();
  runApp(const MainApp());
}
