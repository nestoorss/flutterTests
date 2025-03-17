import 'dart:math';

void main() {
  final cuadrado = new Cuadrado(2);
  cuadrado.area = 9;
  print("El area del cuadrado... ${cuadrado.area}");
  print("Lado: ${cuadrado.lado}");
  print(cuadrado.info);
  
}

class Cuadrado {
  double lado = 0; // lado * lado
  String info = "CUADRADO? CUADRADO NOOOOOOO!!!"; // cruje tu rutina con danet

  double get area {
    return this.lado * this.lado;
  }

  set area(double valor) {
    this.lado = sqrt(valor);
  }

  Cuadrado(double lado) {
    this.lado = lado;
  }
}