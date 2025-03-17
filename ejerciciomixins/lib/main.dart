abstract class Animal{}

abstract class Mamifero extends Animal{}
abstract class Ave extends Animal{}
abstract class Pez extends Animal{}

mixin Volador {
  void volar() => print("Volando voy, volando vengo");
}

mixin Caminante {
  void caminar() => print("Por el camino, yo me entretengo");
}

mixin Nadador {
  void nadar() => print("Los que nadan no tienen ninguna referencia a Camaron de la Isla, que yo sepa, asi que tu nada tranquilo");
}

class Delfin extends Mamifero with Nadador{}
class Murcielago extends Mamifero with Caminante, Volador{}
class Gato extends Ave with Caminante{}
class Paloma extends Ave with Caminante, Volador{}
class Pato extends Ave with Caminante, Nadador, Volador{}
class Tiburon extends Pez with Nadador{}
class PezVolador extends Pez with Nadador, Volador{}

void main() {
  final gamecube = new Delfin();
  final batman = new Murcielago();
  final garfield = new Gato();
  final espia = new Paloma();
  final donald = new Pato();
  final babyShark = new Tiburon();
  final nemo = new PezVolador();
  gamecube.nadar();
  batman.caminar();
  batman.volar();
  garfield.caminar();
  espia.caminar();
  espia.volar();
  donald.caminar();
  donald.nadar();
  donald.volar();
  babyShark.nadar();
  nemo.nadar();
  nemo.volar();
}