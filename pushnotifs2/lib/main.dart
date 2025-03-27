import 'package:flutter/material.dart';
import 'package:pushnotifs2/screens/home_screen.dart';
import 'package:pushnotifs2/screens/message_screen.dart';
import 'package:pushnotifs2/services/push_notifications_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    // Context!
    PushNotificationsService.messagesStream.listen((message) {
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      final snackbar = SnackBar(content: Text(message));
      scaffoldKey.currentState?.showSnackBar(snackbar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "home",
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldKey,
      routes: {
        'home': (_) => HomeScreen(),
        'message': (_) => MessageScreen()
      }
    );
  }
}