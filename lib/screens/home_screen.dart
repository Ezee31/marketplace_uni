import 'package:flutter/material.dart';
import 'package:marketplace_uni/widgets/Foryou_tittle.dart';
import 'package:marketplace_uni/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'MarketPlace',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
      ),
      body: Column(
        children: <Widget>[
          // Barra de búsqueda
          Searchbarra(),
          const Expanded(
            child: ForYouWidget(),
          ),
        ],
      ),
    );
  }
}
