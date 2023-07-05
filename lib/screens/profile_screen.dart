import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketplace_uni/screens/login_screen.dart';
import 'package:marketplace_uni/screens/profilescreens/ajustes_screen.dart';
import 'package:marketplace_uni/screens/profilescreens/update_profile_screen.dart';
import 'package:marketplace_uni/widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text(
            'Perfil',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(9),
          child: Column(
            children: [
              // Parte de Arriba, foto de perfil, nombre y boton de editar
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        //Aqui debe de ser agrega la imagen
                        child: const Icon(Icons.person_3)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        size: 20,
                        color: Colors.cyan,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              // nombre de perfil
              const Text("Nombre del perfil",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  //sirve para Navegar
                  onPressed: () => Get.to(const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, side: BorderSide.none),
                  child: const Text("Editar Perfil",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
              //Division de seccion segunda parte
              const Divider(),
              // Parte de los ajustes
              const SizedBox(height: 10),

              //Menu
              profilemenu_settings(
                title: "Ajustes",
                icon: LineAwesomeIcons.cog,
                onPress: () => Get.to(const AjustesProfileScreen()),
              ),
              profilemenu_settings(
                title: "En Venta",
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              profilemenu_settings(
                title: "Manejo de cuenta",
                icon: LineAwesomeIcons.user_check,
                onPress: () {},
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              profilemenu_settings(
                title: "Informacion",
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              profilemenu_settings(
                title: "Cerrar sesion",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red.withOpacity(0.8),
                endIcon: false,
                onPress: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
