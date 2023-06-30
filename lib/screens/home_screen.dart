import 'package:flutter/material.dart';
import 'package:marketplace_uni/widgets/categorias.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage((index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MarketPlace'),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: [
          ListView(
            //Vista para el Home 

            children: <Widget>[
              const Center(
                  child: Text(
                'Categorias',
                style: TextStyle(fontSize: 20),
              )),
              const SizedBox(
                height: 10,
              ),
              CategoriasFormato(),
              const Center(
                  child: Text(
                'Productos',
                style: TextStyle(fontSize: 20),
              )),
              const SizedBox(
                height: 10,
              ),
              //AllProducts(),
            ],
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop_two), label: 'Tienda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'Mensajes'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: onTapped),
    );
  }
}
