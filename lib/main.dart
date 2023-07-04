import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_uni/screens/main_screen.dart';
import 'package:marketplace_uni/screens/login_screen.dart';

void main() {
  runApp(MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      routes: {
        'login': (_) => const LoginScreen(),
        //Cambie de nombre el Screen de HomeScreen a MainScreen
        'home': (_) => const MainScreen(),
      },
      initialRoute: 'login',
    );
  }
}
