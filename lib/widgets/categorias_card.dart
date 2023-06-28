import 'package:flutter/material.dart';

class CateogoriasCard extends StatelessWidget {
  final Icon icon;
  final String name;

  CateogoriasCard(this.icon, this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.blueGrey)]),
        width: 110,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            icon,
            SizedBox(
              height: 10,
            ),
            Text(name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          ]),
        ),
      ),
    );
  }
}
