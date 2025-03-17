void main() async {
  print("Antes de la peticion");
  final nombre = await getNombre("11");
  print(nombre);
  print("Despues de la peticion");
  print( await httpGet("https://api.gob.ns/secretos") );
  print("Fin del programa");
}

Future<String> getNombre(String id) async {
  return '$id - Nestor';
}

Future<String> httpGet(String url) {
  return Future.delayed(Duration(seconds: 3), () => 'Hola mundo - 3 segundos');
}