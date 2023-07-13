import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  
  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
    
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        // obscuringCharacter used to hide passwords when wwriting password 
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 220, 218, 218),
            ),
          ),
          fillColor: Color.fromARGB(255, 233, 230, 230),
          filled: true,
          hintText: hintText
        ),
      ),
    );;
  }
}