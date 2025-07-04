import 'package:e_commerce/features/notifications/view/widgets/notification_tile.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  final List list;

  const NotificationsView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        String message = list[index]['message'];
        bool isActive = list[index]['isActive'];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: NotificationTile(message, isActive: isActive, location: ''),
        );
      },
    );
  }
}
