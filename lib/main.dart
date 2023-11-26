import 'package:chat_flutter_firebase/app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  await PushNotification();

  runApp(const MyApp());
}

Future<void> PushNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final fcmToken = await messaging.getToken();

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //print('Recebi uma mensagem enquanto estava em primeiro plano!');
    //print('Dados da mensagem: ${message.data}');

    if (message.notification != null) {
      //print('A mensagem também continha uma notificação: ${message.notification}');
    }
  });

  if (fcmToken != null) {
    //print("fcmToken: " + fcmToken);
  }

  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    //print("Obtendo novamente: fcmToken: " + fcmToken);
  }).onError((err) {
    // Error adquirir token.
  });
}
