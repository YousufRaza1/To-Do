import 'package:flutter/material.dart';


class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.task_alt, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No tasks available',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}
