import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 1),
      () => Navigator.pushReplacementNamed(context, 'home'),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text(
          'AceStore',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        //child: Image.asset('assets/images/logo.jpeg'),
      ),
    );
  }
}
