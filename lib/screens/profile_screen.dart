import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          title: const Text('MarketPlace'),
          centerTitle: true,
        ),
      ),
      body: Container(
        child: Center(
          child: Text('a'),
        ),
      ),
    );
  }
}
