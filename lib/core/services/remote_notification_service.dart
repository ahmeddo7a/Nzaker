
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../basics/screen_arguments_class.dart';
import '../components/resources/route_manager.dart';
import 'notification_service.dart';
/*
class RemoteNotificationService {
  RemoteNotificationService() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    initNotificationSettings(messaging);
  }

  Future<void> initNotificationSettings(FirebaseMessaging messaging) async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    // Store FCM Token if you want it, here it's used for testing purpose
    final fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint(
        '----------------------------------------------------------------------------');
    debugPrint(fcmToken);
    debugPrint(
        '----------------------------------------------------------------------------');
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      notificationService.showForegroundNotifications(
        message.notification?.title,
        message.notification?.body,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async{
      print('message data : ${message.data}');
      Map<String, dynamic> messageMap = remoteMessageToMap(message);
      Map<String,dynamic> dataMap = messageMap['data'];
      if (dataMap == null || dataMap['city'] == null) {
        print('null Data is found');
        print(dataMap);
        return;
      }else {
        print('Something wrong !!!!!! in if condition');
        print(dataMap);
        print(dataMap['city'].runtimeType);
        print(dataMap['city']);
        try {
          while(navigatorKey.currentState == null){
            Future.delayed(const Duration(milliseconds: 100));
          }
          await Navigator.of(navigatorKey.currentContext!).pushNamed(
            Routes.countryDetailsRoute,
            arguments: ScreenArguments<String>(data: dataMap['city']),
          );
        } catch (e) {
          print('Navigation error: $e');
        }
      }

    });
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    debugPrint('Handling a background message ${message.messageId}');
  }
}

Map<String, dynamic> remoteMessageToMap(RemoteMessage remoteMessage) {
  final Map<String, dynamic> messageMap = {
    'messageId': remoteMessage.messageId,
    'data': remoteMessage.data,
    'notification': {
      'title': remoteMessage.notification?.title,
      'body': remoteMessage.notification?.body,
    },
  };

  return messageMap;
}


 */