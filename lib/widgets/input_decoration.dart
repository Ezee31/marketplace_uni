import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration( 
    {required String hintText,
    required String labelText,
    required Icon icono}) {
    return  InputDecoration(
      enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.cyan),
      ),
      focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
      color:Colors.black, width: 2 ),
      ),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: icono,
    );   
  }
}