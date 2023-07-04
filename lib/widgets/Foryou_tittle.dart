import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ForYouWidget extends StatefulWidget {
  const ForYouWidget({Key? key}) : super(key: key);

  @override
  State<ForYouWidget> createState() => ForYouWidgetState();
}

class ForYouWidgetState extends State<ForYouWidget> {
  final List<String> _categoryLabel = <String>[
    'Para Ti',
    'Consola',
    'Juegos',
    'Controles',
    'Accesorios',
    'Audifonos',
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categoryLabel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ActionChip(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        backgroundColor: _index == index
                            ? Colors.blue.shade900
                            : Colors.grey,
                        label: Text(
                          _categoryLabel[index],
                          style: TextStyle(
                              fontSize: 18,
                              color: _index == index
                                  ? Colors.white
                                  : Colors.black),
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
              IconButton(
                onPressed: () {},
                icon: const Icon(IconlyLight.arrow_down),
              )
            ],
          ),
        ),
      ),
    );
  }
}
