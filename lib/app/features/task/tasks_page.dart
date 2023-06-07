import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../level/controller/providers.dart';
import 'comp/task_card.dart';
import 'controller/providers.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelSelected = ref.watch(levelSelectedProvider)!;
    final taskList = ref.watch(taskListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasks of Level: ${levelSelected.title}',
        ),
      ),
      body: taskList.when(
        data: (dataTasks) {
          return ListView.builder(
            itemCount: dataTasks.length,
            itemBuilder: (context, index) {
              final task = dataTasks[index];
              return TaskCard(
                model: task,
              );
            },
          );
        },
        error: (error, stackTrace) {
          //log('Erro em TasksPage build');
          //log('$error');
          //log('$stackTrace');
          return const Center(
            child: Text('Erro em buscar tasks'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
