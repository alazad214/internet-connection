import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Comment on your Post',
      'timestamp': '2 minutes ago',
      'status': 'unread'
    },
    {
      'title': 'You have a new follower',
      'timestamp': '5 minutes ago',
      'status': 'read'
    },
    {
      'title': 'Your post was liked by Sarah',
      'timestamp': '10 minutes ago',
      'status': 'unread'
    },
    {
      'title': 'Reminder: Meeting at 3 PM',
      'timestamp': '1 hour ago',
      'status': 'read'
    },
    {
      'title': 'New Message from John',
      'timestamp': '3 hours ago',
      'status': 'unread'
    },
  ];

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return _buildNotificationItem(context, notifications[index]);
        },
      ),
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, Map<String, String> notification) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(
          notification['status'] == 'unread'
              ? Icons.notifications_active
              : Icons.notifications_none,
          color: notification['status'] == 'unread'
              ? Colors.blueAccent
              : Colors.grey,
        ),
        title: Text(
          notification['title']!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          notification['timestamp']!,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        trailing: notification['status'] == 'unread'
            ? const Icon(Icons.mark_as_unread, color: Colors.blueAccent)
            : const Icon(Icons.done, color: Colors.green),
        onTap: () {
          _onNotificationTap(context, notification);
        },
      ),
    );
  }

  void _onNotificationTap(
      BuildContext context, Map<String, String> notification) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(notification['title']!),
          content: Text(
            'Timestamp: ${notification['timestamp']!}\nStatus: ${notification['status']!}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
