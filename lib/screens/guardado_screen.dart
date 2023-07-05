import 'package:flutter/material.dart';

class GuardadoScreen extends StatelessWidget {
  const GuardadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(       
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('Guardado', style: TextStyle(color: Colors.black)),
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
