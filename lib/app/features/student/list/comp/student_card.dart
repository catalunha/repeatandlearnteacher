import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/user_profile_model.dart';
import '../../../team/students/controller/providers.dart';

class StudentCard extends ConsumerWidget {
  final UserProfileModel model;

  const StudentCard({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text('${model.userName} - ${model.name}'),
      subtitle: Text(model.email),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever),
        onPressed: () {
          ref
              .read(teamStudentsStateProvider.notifier)
              .delete(userProfileId: model.id);
        },
      ),
    );
  }
}
