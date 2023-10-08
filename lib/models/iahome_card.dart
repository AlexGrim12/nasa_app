import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final String sop;
  final String content;

  const ContentCard({Key? key, required this.content, required this.sop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (sop == 'Problem') ? Colors.red[900] : Colors.green[900],
      elevation: 2,
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sop,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  content,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
