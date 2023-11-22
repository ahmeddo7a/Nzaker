import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'notification_service.dart';

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
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    debugPrint('Handling a background message ${message.messageId}');
  }
}