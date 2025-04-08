import 'package:custom_transition_route/pages/pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "page1",
      routes: {
        "page1": (_) => Page1(),
        "page2": (_) => Page2()
      },
    );
  }
}