import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_uni/screens/Main_screen.dart';
import 'package:marketplace_uni/screens/registro_screen.dart';
import 'package:marketplace_uni/widgets/input_decoration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            cajaSuperior(size),
            iconoPerfil(),
            loginForm(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView loginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 350),
          Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.symmetric(horizontal: 60),
            width: double.infinity,
            //height: 420,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Column(
              children: [
                Text('Login',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 40),
                Container(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: InputDecorations.inputDecoration(
                              hintText: 'ejemplo@hotmail.com',
                              labelText: 'Correo electronico',
                              icono: const Icon(Icons.alternate_email_rounded)),
                          validator: (value) {
                            String pattern =
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                            RegExp regExp = new RegExp(pattern);
                            return regExp.hasMatch(value ?? '')
                                ? null
                                : 'el valor ingresado no es un correo';
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: passwordController,
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecorations.inputDecoration(
                              hintText: '*******',
                              labelText: 'Contraseña',
                              icono: Icon(Icons.lock_outline)),
                          validator: (value) {
                            return (value != null && value.length >= 6)
                                ? null
                                : 'la contraseña debe contener almenos 6 caracteres';
                          },
                        ),
                        const SizedBox(height: 30),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Colors.grey,
                          color: Colors.black,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: const Text(
                              'ingresar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () async {
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                              User? user = userCredential.user;
                              print('Iniciando sesion: ${user!.uid}');
                              Navigator.pushReplacementNamed(context, 'main');
                            } catch (e) {
                              print('Error al iniciar sesion');
                            }
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              color: Colors.black,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: const Text(
                  'Registrar una cuenta',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              //sirve para Navegar
              onPressed: () => Get.to(RegristroProfileScreen())),
        ],
      ),
    );
  }

  SafeArea iconoPerfil() {
    return SafeArea(
        child: Container(
      //perfil
      margin: const EdgeInsets.only(top: 60),
      width: double.infinity,
      child: const Icon(
        Icons.person_pin,
        color: Colors.white,
        size: 170,
      ),
    ));
  }

  Container cajaSuperior(size) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(0, 0, 0, 1),
        Color.fromRGBO(0, 139, 139, 1),
      ])),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(
            top: 120,
            left: 30,
            child: burbujas(),
          ),
          Positioned(
            top: -30,
            left: -30,
            child: burbujas(),
          ),
          Positioned(
            top: -20,
            right: -20,
            child: burbujas(),
          ),
          Positioned(
            bottom: -50,
            left: 10,
            child: burbujas(),
          ),
          Positioned(
            bottom: 80,
            right: 20,
            child: burbujas(),
          )
        ],
      ),
    );
  }

  Container burbujas() {
    return Container(
      width: 135,
      height: 135,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
