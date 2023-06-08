import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:repeatandlearnteacher/app/features/utils/app_mixin_messages.dart';

import '../../../../core/models/team_model.dart';
import '../../../../routes.dart';
import '../../../student/list/controller/providers.dart';
import '../../../student/list/controller/states.dart';
import '../../../utils/app_mixin_loader.dart';
import '../../../utils/app_photo_show.dart';

class TeamCard extends ConsumerWidget with Loader, Messages {
  final TeamModel model;

  TeamCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<TeamViewTaskStatus>(
      teamViewTaskStatusProvider,
      (previous, next) {
        if (next == TeamViewTaskStatus.error) {
          hideLoader(context);
          showMessageError(context, 'Problemas ao buscar team com students');
        }
        if (next == TeamViewTaskStatus.loading) {
          showLoader(context);
        }
        if (next == TeamViewTaskStatus.success) {
          // ref.invalidate(teamListProvider);
          hideLoader(context);
          context.goNamed(AppPage.level.name, extra: model);
        }
      },
    );
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
            trailing: IconButton(
              icon: const Icon(Icons.person_add),
              onPressed: () {
                ref.read(teamSelectedProvider.notifier).state = model;
                context.goNamed(AppPage.teamStudents.name);
              },
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                ref.read(teamSelectedProvider.notifier).state = model;
                ref.read(teamWithStudents2Provider.notifier).updateStudents();
                // teamWithStudents.when(
                //   data: (data) {
                //     hideLoader(context);
                //     context.goNamed(AppPage.level.name, extra: model);
                //   },
                //   error: (error, stackTrace) {},
                //   loading: () {
                //     showLoader(context);
                //   },
                // );
              },
              child: const Text('View Tasks')),
        ],
      ),
    );
  }
}
