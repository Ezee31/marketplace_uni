import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:marketplace_uni/screens/login_screen.dart';
import 'package:marketplace_uni/widgets/input_decoration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegristroProfileScreen extends StatelessWidget {
  RegristroProfileScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: const Text(
          "Editar Perfil",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
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
                          color: Colors.yellow),
                      child: const Icon(
                        LineAwesomeIcons.camera,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    //TextFormField de Actualizar usuario
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue)),
                          label: Text("Correo Electronico"),
                          prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue)),
                          label: Text("Contraseña"),
                          prefixIcon: Icon(LineAwesomeIcons.lock)),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          Get.to(LoginScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            side: BorderSide.none,
                            shape: const LinearBorder()),
                        child: const Text(
                          "Editar Perfil",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
