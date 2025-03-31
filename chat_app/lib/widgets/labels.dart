import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String ruta;
  final bool esLogin;

  const Labels({
    super.key, 
    required this.ruta,
    this.esLogin = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column (
        children: <Widget> [
          Text(
            esLogin ? "¿No tienes cuenta?" : "¿Ya tienes cuenta?", 
            style: TextStyle(
              color: Colors.black54, 
              fontSize: 15, 
              fontWeight: FontWeight.w300
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
            child: Text(
              esLogin ? "Crea una ahora!" : "Inicia sesión con tu cuenta", 
              style: TextStyle(
                color: Colors.blue[600], 
                fontSize: 18, 
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}