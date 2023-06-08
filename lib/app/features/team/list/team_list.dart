import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'comp/team_card.dart';
import 'controller/providers.dart';

class TeamList extends ConsumerWidget {
  const TeamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamList = ref.watch(teamListProvider);
    return teamList.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final team = data[index];
            return TeamCard(
              model: team,
            );
          },
        );
      },
      error: (error, stackTrace) {
        //log('Erro em TasksPage build');
        //log('$error');
        //log('$stackTrace');
        return const Center(
          child: Text('Erro em buscar team'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
