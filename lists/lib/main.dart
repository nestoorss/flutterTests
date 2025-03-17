void main() {
  List<int> numeros = [1,2,3,4,5,6,7,8,9,10];
  numeros.add(11);
  numeros.add(15);
  numeros.add(14);
  print(numeros);
  print(numeros[3]);
  numeros.shuffle();
  print(numeros);

  final pedro = List.generate(100, (int i) => "Peter Parker");
  print (pedro);
}