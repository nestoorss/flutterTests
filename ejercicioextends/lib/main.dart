void main() {
  final spidercerdo = new DonComedia("Cerdo 48-C", false);
  final jesucristo = new Joker("Robot del futuro");
  print(spidercerdo);
  print(jesucristo);
}

abstract class Personaje {
  String? poder;
  String nombre;
  

  Personaje(this.nombre);

  @override
  String toString() {
    return '$nombre - $poder';
  }
  
}

class DonComedia extends Personaje {
  bool esDonComedia;

  DonComedia(String nombre, this.esDonComedia): super(nombre);

  String checkDonComedia() {
    String res = "";
    if (!esDonComedia) {
      res = "Se cree chistoso (no lo es)";
    } else {
      res = "Ostras, pues me hace mucha gracia el nota";
    }
    return res;
  }

  @override
  String toString() {
    String res = super.toString();
    res += ' - ' + checkDonComedia();
    return res;
  }
}

class Joker extends Personaje {
  int porcentajeChistoso = 100;
  Joker(String nombre): super(nombre);
}