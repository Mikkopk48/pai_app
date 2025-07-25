// **************************************************
// *** git checkout --. *** PARA VOLVER AL COMMIT ANTERIOR
// **************************************************

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pai/config/router/app_router.dart';
import 'package:pai/config/theme/app_theme.dart';

void main() async{
  runApp(const ProviderScope(child: MainApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
  ]);

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}


