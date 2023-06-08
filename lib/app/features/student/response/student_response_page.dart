import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:repeatandlearnteacher/app/features/student/response/controller/providers.dart';

import '../../level/controller/providers.dart';
import '../../task/controller/providers.dart';
import '../list/controller/providers.dart';

class StudentResponsePage extends ConsumerWidget {
  const StudentResponsePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.read(teamSelectedProvider);
    final level = ref.read(levelSelectedProvider);
    final task = ref.read(taskSelectedProvider);
    final responses = ref.watch(studentsResponseProvider);
    final dateFormat = DateFormat('dd/MM/y HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students responses'),
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
          return Column(
            children: [
              Text('Team: ${team!.name}'),
              Text('Level: ${level!.title}'),
              Text('Task: ${task!.title}'),
              Flexible(
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const {
                    0: IntrinsicColumnWidth(),
                    1: IntrinsicColumnWidth(),
                    2: IntrinsicColumnWidth(),
                    3: IntrinsicColumnWidth(),
                  },
                  children: [
                    const TableRow(
                      children: [
                        Text('Student'),
                        Text('StartIn'),
                        Text('Minutes'),
                        Text('Rating'),
                      ],
                    ),
                    for (var item in data)
                      TableRow(
                        children: [
                          Text(item.userProfile.userName,
                              textAlign: TextAlign.center),
                          Text(dateFormat.format(item.startIn),
                              textAlign: TextAlign.center),
                          Text('${item.minutes}', textAlign: TextAlign.center),
                          Text(item.rating, textAlign: TextAlign.center),
                        ],
                      )
                  ],
                ),
              ),
            ],
          );

          // return ListView.builder(
          //   itemCount: data.length,
          //   itemBuilder: (context, index) {
          //     final task = data[index];
          //     return StudentResponseCard(
          //       model: task,
          //     );
          //   },
          // );
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
