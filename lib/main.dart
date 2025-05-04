import 'package:evently/auth/screens/login_screen.dart';
import 'package:evently/auth/screens/signup_screen.dart';
import 'package:evently/common/app_theme.dart';
import 'package:evently/home/main_layer_screen.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('XXXXX');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightThem,
      darkTheme: AppTheme.darkThem,
      themeMode: context.watch<ThemeProvider>().themeMode,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        MainLayerScreen.routeName: (_) => MainLayerScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
