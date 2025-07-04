import 'package:e_commerce/features/notifications/view/page/notifications_view.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications'), centerTitle: true),
      body: NotificationsView(
        list: [
          {
            'message':
                "Gilbert, Thank you for shopping with us we have canceled order #24568.",
            "isActive": true,
          },
          {
            'message':
                "Gilbert, Thank you for shopping with us we have canceled order #24568.",
            "isActive": false,
          },
          {
            'message':
                "Gilbert, Thank you for shopping with us we have canceled order #24568.",
            "isActive": false,
          },
          {
            'message':
                "Gilbert, Thank you for shopping with us we have canceled order #24568.",
            "isActive": true,
          },
          {
            'message':
                "Gilbert, Thank you for shopping with us we have canceled order #24568.",
            "isActive": true,
          },
        ],
      ),
    );
  }
}
