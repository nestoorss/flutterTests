void main() {
  String nombre = "nestorss";
  saludar(nombre);
  saludarV2(nombre);
  saludarV2();
  saludarV3(nombre);
  saludoDesorden(nombre: nombre);
  saludoDesordenObligatorio(msg:"XD", nombre:nombre);
}

void saludar(String nombre) {
  print("Hoal $nombre");
}

void saludarV2([String nombre = "FEO"]) {
  print("Hoal $nombre");
}

void saludarV3(String nombre, [String msg = "FEO"]) {
  print("$msg $nombre");
}

void saludoDesorden({String nombre = "FEO", String msg = "AAAAAAAAAAA UN"}) {
  print("$msg $nombre");
}

void saludoDesordenObligatorio({required String nombre, required String msg}) {
  print("$msg $nombre");
}