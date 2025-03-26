import 'package:flutter/material.dart';
import 'package:formulario/providers/auth_provider.dart';
import 'package:formulario/screens/screens.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authProvider.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData)
              return CircularProgressIndicator();
            if (snapshot.data == '') {
              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_, __, ___) => LoginScreen(),
                  transitionDuration: Duration(seconds: 0)
                ));
                
              });
            } else {
              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_, __, ___) => HomeScreen(),
                  transitionDuration: Duration(seconds: 0)
                ));
                
              });
            }
            
            return Container();
          },
        )
      ),
    );
  }
}