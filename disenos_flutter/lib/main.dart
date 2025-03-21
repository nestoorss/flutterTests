import 'package:disenos_flutter/screens/diseno_basico.dart';
import 'package:disenos_flutter/screens/home_screen.dart';
import 'package:disenos_flutter/screens/scroll_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (_) => HomeScreen(),
        'diseno_basico': (_) => DisenoBasico(),
        'scroll_screen': (_) => ScrollScreen(),
      },
    );
  }
}