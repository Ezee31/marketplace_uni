import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_uni/screens/Main_screen.dart';
import 'package:marketplace_uni/screens/login_screen.dart';
import 'package:marketplace_uni/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MarketplaceApp());

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MarketplaceApp extends StatelessWidget { 
  @override
  
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
    
      title: 'Material app',
      routes: {
        'splash_screen': (_) => const SplashScreen(),
        'login': (_) => const LoginScreen(),
       'home' : (_) => const MainScreen(), 
      },
      initialRoute: 'splash_screen',
    );
  }
} 
