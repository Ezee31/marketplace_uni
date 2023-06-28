import 'package:flutter/material.dart';
import 'package:marketplace_uni/widgets/categorias_card.dart';

class CategoriasFormato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CateogoriasCard(Icon(Icons.videogame_asset,size: 40,),'Consola'),
          CateogoriasCard(Icon(Icons.games,size: 40,),'Juegos'),
          CateogoriasCard(Icon(Icons.videogame_asset,size: 40,),'Controles'),
          CateogoriasCard(Icon(Icons.headphones,size: 40,),'Accesorios'),
          CateogoriasCard(Icon(Icons.book,size: 40,),'Consola'),
          CateogoriasCard(Icon(Icons.book,size: 40,),'Consola'),
          CateogoriasCard(Icon(Icons.book,size: 40,),'Consola'),
          CateogoriasCard(Icon(Icons.book,size: 40,),'Consola'),
        ],
      ),
    );
  }
}
