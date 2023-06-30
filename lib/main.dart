import 'package:flutter/material.dart';
import 'package:marketplace_uni/screens/home_screen.dart';
import 'package:marketplace_uni/screens/login_screen.dart';
import 'package:marketplace_uni/screens/splash_screen.dart';

void main() {
  runApp(MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      title: 'Material app',
      routes: {
        'splash_screen': (_) => const SplashScreen(),
        'login': (_) => const LoginScreen(),
       'home' : (_) => const HomeScreen(), 
      },
      initialRoute: 'splash_screen',
    );
  }
} 
