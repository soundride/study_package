import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study_package/main.dart';

class Homepage extends StatefulWidget {
  const Homepage ({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "안녕 여기가 토스트 메세지여",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            }, 
            child: const Text('btn'),
          ),
          ElevatedButton(
            onPressed: () async {
              final notification = FlutterLocalNotificationsPlugin();

              const android = AndroidNotificationDetails(
              '0',
              '알림테스트',
              channelDescription: '알림 테스트 바디 부분',
              importance: Importance.max,
              priority: Priority.max,
              );
              const ios = IOSNotificationDetails();
              const detail = NotificationDetails(
                android: android,
                iOS: ios,
              );

              final permission = Platform.isAndroid
                    ? true
                    : await notification
                            .resolvePlatformSpecificImplementation<
                              IOSFlutterLocalNotificationsPlugin>()
                          ?.requestPermissions(alert: true, badge: true, sound: true) ??
                        false;
                        print('permission ');
            }, 
            child: const Text('add alarm'),
          ),
          const Center(child: Text('hi')),
        ],
      )
    );
  }
}

class _showToast {
}