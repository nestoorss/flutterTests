void main() {
  Map persona = {
    'nombre': 'Nestor',
    'edad': 20,
    'fandroid': true
  };

  print(persona);
  print("Si, " + persona['nombre']);

  persona.addAll({1: 'Fran'});
  print(persona);

  Map<String, String> persona2 = {
    'nombre': 'Nestor',
    'edad': "20",
    'fandroid': "si"
  };
  print(persona2);
}
