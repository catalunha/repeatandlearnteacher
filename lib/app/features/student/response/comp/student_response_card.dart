import 'package:flutter/material.dart';
import 'package:repeatandlearnteacher/app/core/models/user_response_model.dart';

class StudentResponseCard extends StatelessWidget {
  final UserResponseModel model;
  const StudentResponseCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${model.id}'),
    );
  }
}
