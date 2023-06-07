import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/team_model.dart';
import '../../../../routes.dart';
import '../../../utils/app_photo_show.dart';

class TeamCard extends ConsumerWidget {
  final TeamModel model;

  const TeamCard({
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
            title: Text(model.name),
            subtitle: Text(model.description),
            onTap: () {
              context.goNamed(AppPage.teamSave.name, extra: model);
            },
          ),
        ],
      ),
    );
  }
}
