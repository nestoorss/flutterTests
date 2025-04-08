import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoadingMessage(BuildContext context) {

  if (Platform.isAndroid) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Espere por favor"),
        content: Container(
          width: 100,
          height: 100,
          child: Column(
            children: [
              Text("Calculando ruta"),
              SizedBox(height: 15),
              CircularProgressIndicator(strokeWidth: 3, color: Colors.black)
            ],
          ),
        ),
      )
    );
    return;
  }
  
  showCupertinoDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text("Espere por favor"),
      content: Container(
        width: 100,
        height: 100,
        child: Column(
          children: [
            Text("Calculando ruta"),
            SizedBox(height: 15),
            CupertinoActivityIndicator(color: Colors.black)
          ],
        ),
      ),
    )
  );
  return;

}