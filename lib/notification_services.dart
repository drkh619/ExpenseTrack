import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
  AndroidInitializationSettings('logo');

  void initializeNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: _androidInitializationSettings
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    if (_flutterLocalNotificationsPlugin == null) {
      print('FlutterLocalNotificationsPlugin is null');
      return;
    }

    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(''),
    );

    NotificationDetails notificationDetails =
    NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        notificationDetails
    );
  }


}