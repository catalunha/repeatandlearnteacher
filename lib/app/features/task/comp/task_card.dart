import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/task_model.dart';
import '../../utils/app_photo_show.dart';

class TaskCard extends ConsumerWidget {
  final TaskModel model;

  const TaskCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          ListTile(
            leading: AppImageShow(
              photoUrl: model.image,
            ),
            title: Text(model.title),
            subtitle: Text(model.description),
            onTap: () {
              // context.goNamed(
              //   AppPage.calcs.name,
              // );
            },
          ),
        ],
      ),
    );
  }
}
