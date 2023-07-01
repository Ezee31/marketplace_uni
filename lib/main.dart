import 'package:flutter/material.dart';
import 'package:marketplace_uni/screens/main_screen.dart';
import 'package:marketplace_uni/screens/login_screen.dart';

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
        'login': (_) => const LoginScreen(),
        'home': (_) => const MainScreen(),
      },
      initialRoute: 'login',
    );
  }
}
