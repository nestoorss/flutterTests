import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singletons_project/pages/pagina1_page.dart';
import 'package:singletons_project/pages/pagina2_page.dart';
import 'package:singletons_project/services/usuario_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UsuarioService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1Page(),
          'pagina2': (_) => Pagina2Page()
        }
      ),
    );
  }
}