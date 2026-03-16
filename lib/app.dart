import 'package:flutter/material.dart';

import 'core/routes/routes.dart';
import 'core/styles/themes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
    );
  }
}
