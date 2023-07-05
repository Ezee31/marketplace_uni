import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_uni/screens/guardado_screen.dart';
import 'package:marketplace_uni/screens/home_screen.dart';
import 'package:marketplace_uni/screens/chat_screen.dart';
import 'package:marketplace_uni/screens/profile_screen.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  PageController pageController = PageController(initialPage: 1);

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    pageController.jumpToPage((index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //Para detener la vista que de deslice
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        //Se manda a llamar las screens del menu para que sea mas comoda
        children: const [
          ProfileScreen(),
          HomeScreen(),
          GuardadoScreen(),
          ChatScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
                label: 'Perfil'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                  size: 25,
                ),
                label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.bookmark_fill,
                  size: 22,
                ),
                label: 'Guardados'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  size: 22,
                ),
                label: 'Chat'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          onTap: onTapped),
    );
  }
}

