import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singletons_project/pages/pagina1_page.dart';
import 'package:singletons_project/pages/pagina2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      getPages: [
        GetPage(name: '/pagina1', page: () => Pagina1Page()),
        GetPage(name: '/pagina2', page: () => Pagina2Page())
      ],
      theme: ThemeData.light()
    );
  }
}