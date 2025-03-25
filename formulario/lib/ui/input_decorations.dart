import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText, 
    required String labelText, 
    required IconData prefixIcon
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple
        )
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2
        )
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.grey
      ),
      // ignore: unnecessary_null_comparison
      prefixIcon: prefixIcon != null
        ? Icon(prefixIcon, color: Colors.deepPurple)
        : null
    );
  }
}