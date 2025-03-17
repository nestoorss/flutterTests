void main() {
  final FalseHero mx = new FalseHero(nombre: "MX", poder: "Perseguir a Lucas");
  print(mx);
}

class FalseHero {
  String nombre = "";
  String poder = "";

  FalseHero({required this.nombre, required this.poder});

  @override
  String toString() {
    return 'Nombre: ${this.nombre}, Poder: ${this.poder}';
  }
}