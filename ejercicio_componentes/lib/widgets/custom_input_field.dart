import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final TextInputType? teclado;
  final bool isPassword;

  final String formProperty;
  final Map<String, dynamic> formValues;

  const CustomInputField({
    super.key, 
    this.hintText, 
    this.labelText, 
    this.helperText, 
    this.icon, 
    this.teclado, 
    this.isPassword = false, 
    required this.formProperty, 
    required this.formValues,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: teclado,
      obscureText: isPassword,
      onChanged: (value) => formValues[formProperty] = value,
      validator:(value) {
        if (value == null || value == "") return "Este campo es requerido";
        return value.length < 3 ? "Minimo de 3 letras": null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}