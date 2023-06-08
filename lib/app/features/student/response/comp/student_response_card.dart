import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:repeatandlearnteacher/app/core/models/user_response_model.dart';

class StudentResponseCard extends StatelessWidget {
  final UserResponseModel model;
  const StudentResponseCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/y HH:mm');

    return Card(
      child: Column(
        children: [
          Text('id: ${model.id}'),
          // Text('Level: ${model.level.title}'),
          // Text('Task: ${model.task.title}'),
          Text('UserName: ${model.userProfile.userName}'),
          Text('StartIn: ${dateFormat.format(model.startIn)}'),
          Text('Minutes: ${model.minutes}'),
          Text('Rating: ${model.rating}'),
        ],
      ),
    );
  }
}
