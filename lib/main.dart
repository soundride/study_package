import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:study_package/page/home_page.dart';
import 'package:study_package/page/user_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initHive();

  _initNotiSetting();
  runApp(const MyApp());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox('darkModeBox');
}

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void _initNotiSetting() async {
  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  final result = await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  print(result);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: Hive.box('darkModeBox').listenable(),
      builder: (context,Box box, widget) {
      final darkMode = box.get('darkMode', defaultValue: false);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const UserListPage(),
        );
      }
    );
  }
}