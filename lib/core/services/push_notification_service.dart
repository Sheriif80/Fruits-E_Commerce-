import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

// To handle background messages or push notifications
// while the app is in the background or terminated ,
// we need to create a top-level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("Handling a background message: ${message.messageId}");
}

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  // enable push notification
  Future<void> init() async {
    // request notification permission
    final NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');

    // Enable push notification in the background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Listen to incoming notifications while the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log(
          'Message also contained a notification: ${message.notification?.title}',
        );
        //
      }
    });
  }

  // get FCM token to send notifications to the user
  Future<String?> getToken() async {
    try {
      final String? token = await _fcm.getToken();
      log("FCM Token: $token");
      return token;
    } catch (e) {
      log("Error getting FCM token: $e");
      return null;
    }
  }
}
