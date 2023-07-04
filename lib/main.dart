import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_uni/screens/Main_screen.dart';
import 'package:marketplace_uni/screens/login_screen.dart';
import 'package:marketplace_uni/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      routes: {
        'splash_screen': (_) => const SplashScreen(),
        'home': (_) => StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const MainScreen();
                } else {
                  return LoginScreen();
                }
              },
            ),
        'main': (_) => const MainScreen(),
      },
      initialRoute: 'splash_screen',
    );
  }
}
