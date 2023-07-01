import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketplace_uni/widgets/categorias.dart';
import 'package:marketplace_uni/widgets/highlights.dart';
import 'package:marketplace_uni/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'MarketPlace',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
      ),
      body: ListView(
        children: <Widget>[
          //Barra de busqueda
          Searchbarra(),
          const SizedBox(
            height: 5,
          ),
          CategoriasFormato(),
          const SizedBox(
            height: 15,
          ),
          BrandHighlights(),
        ],
      ),
    );
  }
}
