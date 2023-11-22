import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nzaker/core/services/remote_notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../main.dart';
import '../basics/screen_arguments_class.dart';
import '../components/resources/route_manager.dart';


NotificationService notificationService = NotificationService();

class NotificationService {
  //NotificationService a singleton object
  int i = 0;
  static final NotificationService _notificationService =
  NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = 'high_importance_channel';
  static const channelName = 'High Importance Notifications';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    RemoteNotificationService();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: null,
    );

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse:
      onDidReceiveBackgroundNotificationResponse,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  final AndroidNotificationDetails _androidNotificationDetails =
  const AndroidNotificationDetails(
    channelId,
    channelName,
    channelDescription: 'This channel is used for important notification',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  Future<void> showNotifications() async {
    await flutterLocalNotificationsPlugin.show(
      i++,
      "Notification Title",
      "This is the Notification Body!",
      NotificationDetails(android: _androidNotificationDetails),
    );
  }

  Future<void> showForegroundNotifications(String? title, String? body) async {
    await flutterLocalNotificationsPlugin.show(
      i++,
      title,
      body,
      NotificationDetails(android: _androidNotificationDetails),
    );
  }

  Future<void> scheduleNotifications() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      i++,
      "Notification Title",
      "This is the Notification Body!",
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      NotificationDetails(android: _androidNotificationDetails),
      androidScheduleMode: AndroidScheduleMode.exact,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      // ignore: deprecated_member_use
      androidAllowWhileIdle: true,
    );
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

void onDidReceiveBackgroundNotificationResponse(NotificationResponse details) {
  print("Backgroud notification !!!!");
  print(details.id);
  print(details.notificationResponseType);
  print(details.payload);
  final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
  handleMessage(message);
  //handle your logic here
}

void onDidReceiveNotificationResponse(NotificationResponse details) {
  print(details.notificationResponseType);
  print(details.id);
  print(details.payload);
  final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
   handleMessage(message);
}

void handleMessage(RemoteMessage? message) async{
  print('Hello i am handling message !!');
  print(message);
if (message == null || message.data['city'] == null) return;
await navigatorKey.currentState?.pushNamed(Routes.countryDetailsRoute,
arguments: ScreenArguments(data: message.data['city']));
}

