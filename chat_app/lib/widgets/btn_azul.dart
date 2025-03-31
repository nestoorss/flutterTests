import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;

  const BotonAzul({
    super.key, 
    required this.text, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shadowColor: Colors.black,
        backgroundColor: Colors.blue,
        shape: StadiumBorder(),
        minimumSize: Size(double.infinity, 55),
      ),
      onPressed: this.onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
