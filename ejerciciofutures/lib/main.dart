void main() {
  print("Antes de la peticion");
  httpGet("https://api.dbgob.ns/free")
    .then( (data) {
      print(data.toUpperCase());
    });
  print("Fin del programa");
}

Future<String> httpGet(String url) {
  return Future.delayed(Duration(seconds: 3), () => 'Hola mundo - 3 segundos');
}