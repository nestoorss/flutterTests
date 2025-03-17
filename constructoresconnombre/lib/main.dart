void main() {
  final rawJson = {
    'nombre': 'Lucas',
    'poder': 'Huir'
  };

  final rawJson2 = {
    'nombre': 'Lucas'
  };

  final lucas = FalseHero.fromJson(rawJson);
  print(lucas);

  final lucasSinPoderes = FalseHero.fromJson(rawJson2);
  print(lucasSinPoderes);

  final FalseHero mx = new FalseHero(nombre: "MX", poder: "Perseguir a Lucas");
  print(mx);
}

class FalseHero {
  String nombre = "";
  String poder = "";

  FalseHero({required this.nombre, required this.poder});

  FalseHero.fromJson(Map<String, String> json):
    this.nombre = json['nombre'] ?? 'No tiene nombre',
    this.poder = json['poder'] ?? 'No tiene poder';

  @override
  String toString() {
    return 'Nombre: ${this.nombre}, Poder: ${this.poder}';
  }
}