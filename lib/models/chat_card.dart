import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final String messageText;
  final String senderName;
  final String messageTimestamp;

  ChatCard({
    required this.messageText,
    required this.senderName,
    required this.messageTimestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      elevation: 2,
      shadowColor: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              senderName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              messageText,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              messageTimestamp,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
