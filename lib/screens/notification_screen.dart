import 'package:ezy_tespen_learn/services/notification.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("Show Notifications"),
        onPressed: () {
          // NotificationService.showNotificationWithNoTitle();

          // NotificationService.showRepeatEveryWorkingDays(
          //     id: id,
          //     androidChannelId: "NOTIF_MASUK_KERJA",
          //     androidChannelName: "NOTIF_MASUK_KERJA",
          //     title: "Sudah saatnya masuk kerja",
          //     body: "Jangan lupa TAP IN ya",
          //     hour: 21,
          //     minute: 41);

          NotificationService.showNotification(
              title: "Notif bang", body: "Ada pesan dari pak bambang");
        },
      )),
    );
  }
}
