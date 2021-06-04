import 'file:///D:/Flutter_WorkSpace/clock_app/lib/constant/homepage.dart';
import 'package:clock_app/enums.dart';
import 'file:///D:/Flutter_WorkSpace/clock_app/lib/model/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid = AndroidInitializationSettings('logo');
  var initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (int id, String title, String body, String payload) async{}
  );

  var initializationSettings = InitializationSettings(
    initializationSettingsAndroid, initializationSettingsIOS
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String payload) async{
    if (payload != null){
      debugPrint('notification payload'+payload);
    }
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock),
          child: HomePage()),
    );
  }
}


