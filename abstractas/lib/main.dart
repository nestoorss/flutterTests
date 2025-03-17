void main() {
  final rata = new NinoRata();
  final raton = new Raton();
  sonidoAnimal(rata);
  sonidoAnimal(raton);
}

void sonidoAnimal(Animal animal) {
  animal.emitirSonido();
}

abstract class Animal {
  int? patas;
  void emitirSonido();
}

class NinoRata implements Animal {
  int? patas;
  void emitirSonido() {
    print("FUAAAAAAAAAAAAAA");
  }
}

class Raton implements Animal {
  int? patas;
  String puerto = "Tipo C"; // La UE me ha obligado a que sea Tipo C :(
  void emitirSonido() {
    print("(Sonido de insercion de hardware)");
  }
}