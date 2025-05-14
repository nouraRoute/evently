import 'package:evently/auth/provider/auth_provider.dart';
import 'package:evently/auth/screens/login_screen.dart';
import 'package:evently/auth/screens/signup_screen.dart';
import 'package:evently/common/app_theme.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/home/main_layer_screen.dart';
import 'package:evently/events/create_event_page.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppSettingsProvider>(
      create: (_) => AppSettingsProvider(),
    ),
    ChangeNotifierProvider<UserAuthProvider>(
      create: (_) => UserAuthProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('XXXXX');
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(context.watch<AppSettingsProvider>().appLocal),
      title: 'Flutter Demo',
      theme: AppTheme.lightThem,
      darkTheme: AppTheme.darkThem,
      themeMode: context.watch<AppSettingsProvider>().themeMode,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        MainLayerScreen.routeName: (_) => MainLayerScreen(),
        CreateEventPage.routeName: (_) => CreateEventPage(),
      },
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? LoginScreen.routeName
          : MainLayerScreen.routeName,
    );
  }
}
