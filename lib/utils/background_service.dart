import 'dart:isolate';
import 'dart:math';
import 'dart:ui';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/main.dart';
import 'package:foodpad/utils/notification_helper.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    final NotificationHelper _notificationHelper = NotificationHelper();

    var result = await ApiService().recipeList();
    var randomIndex = Random().nextInt(result.recipes.length);
    var data = result.recipes[randomIndex];

    await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, data);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
