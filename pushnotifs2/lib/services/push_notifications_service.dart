import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {

  static FirebaseMessaging messaginggg = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = new StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    print(message.data);
    _messageStream.sink.add( message.data['product'] ?? 'No data' );
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print(message.data);
    _messageStream.sink.add( message.data['product'] ?? 'No data' );
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print(message.data);
    _messageStream.sink.add( message.data['product'] ?? 'No data' );
  }

  static Future initializeApp() async {

    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // Local notifications

  }

  static closeStreams() {
    _messageStream.close();
  }

}