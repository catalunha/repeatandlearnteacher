import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearnteacher/app/features/student/response/controller/providers.dart';

import '../../level/controller/providers.dart';
import '../../task/controller/providers.dart';
import '../list/controller/providers.dart';
import 'comp/student_response_card.dart';

class StudentResponsePage extends ConsumerWidget {
  const StudentResponsePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.read(teamSelectedProvider);
    final level = ref.read(levelSelectedProvider);
    final task = ref.read(taskSelectedProvider);
    final responses = ref.watch(studentsResponseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Response'),
      ),
      // body: Column(
      //   children: [
      //     ListTile(
      //       leading: AppImageShow(
      //         photoUrl: team!.image,
      //       ),
      //       title: Text(team.name),
      //       subtitle: Text(team.description),
      //     ),
      //     ListTile(
      //       leading: AppImageShow(
      //         photoUrl: level!.image,
      //       ),
      //       title: Text(level.title),
      //       subtitle: Text(level.description),
      //     ),
      //     ListTile(
      //       leading: AppImageShow(
      //         photoUrl: task!.image,
      //       ),
      //       title: Text(task.title),
      //       subtitle: Text(task.description),
      //     ),
      //   ],
      // ),
      body: responses.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final task = data[index];
              return StudentResponseCard(
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
            child: Text('Erro em buscar responses'),
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
