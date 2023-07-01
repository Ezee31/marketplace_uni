import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Searchbarra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(8, 7, 8, 0),
                    hintText: 'Buscar en la Tienda',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      IconlyLight.search,
                      size: 20,
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
