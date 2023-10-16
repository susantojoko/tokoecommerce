import 'package:flutter/material.dart';
import 'Screens/onboarding.dart';

import 'Screens/splash.dart';

void main() { 
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  runApp(MyApp(navigatorKey: navigatorKey));
}

class MyApp extends StatefulWidget {

  final GlobalKey<NavigatorState> navigatorKey;

  MyApp({required this.navigatorKey});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      title: "Toko Online",
      initialRoute: '/',
      routes: {
        '/onboarding': (context) => OnboardingPage(),


        
      },
      home: SplashScreen(navigatorKey: widget.navigatorKey),
    );
  }
}



