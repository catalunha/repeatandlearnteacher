import 'package:flutter/material.dart';

import '../../../../core/models/user_profile_model.dart';

class StudentCard extends StatelessWidget {
  final UserProfileModel model;

  const StudentCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${model.name}'),
      subtitle: Text(model.email),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever),
        onPressed: () {},
      ),
    );
  }
}
