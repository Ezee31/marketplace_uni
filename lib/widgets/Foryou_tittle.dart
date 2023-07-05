import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ForYouWidget extends StatefulWidget {
  const ForYouWidget({Key? key}) : super(key: key);

  @override
  State<ForYouWidget> createState() => ForYouWidgetState();
}

class ForYouWidgetState extends State<ForYouWidget> {
  final List<String> _categoryLabel = <String>[
    'Consola',
    'Juegos',
    'Controles',
    'Accesorios',
    'Audifonos',
  ];
  final List<Icon> _Iconlabel = <Icon>[
    Icon(Icons.videogame_asset),
    Icon(Icons.games),
    Icon(Icons.sports_esports),
    Icon(Icons.cases_sharp),
    Icon(Icons.headphones)
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categoryLabel.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ActionChip(
                    avatar: _Iconlabel[index],
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    backgroundColor:
                        _index == index ? Colors.blue.shade900 : Colors.grey,
                    label: Text(
                      _categoryLabel[index],
                      style: TextStyle(
                        fontSize: 20,
                        color: _index == index ? Colors.white : Colors.black,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _index = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('Productos')
                  .where('categoria', isEqualTo: _categoryLabel[_index])
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error al obtener los productos');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                    documents = snapshot.data!.docs;

                return buildProductList(documents);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProductList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> documents) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int index) {
        final product = documents[index].data();
        final String nombre = product['nombre'];
        final int precio = product['precio'];
        final String imagen = product['imagen'];

        return ListTile(
          title: Text(nombre),
          subtitle: Text('Precio: \$${precio.toStringAsFixed(2)}'),
          leading: Image.network(imagen),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(LineAwesomeIcons.angle_right),
          ),
        );
      },
    );
  }
}
