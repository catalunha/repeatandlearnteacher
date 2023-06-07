import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearnteacher/app/features/student/list/controller/providers.dart';

import 'comp/student_card.dart';

class StudentList extends ConsumerWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.watch(teamWithStudentsProvider);
    return team.when(
      data: (data) {
        return SingleChildScrollView(
          child: Column(children: [
            for (var i = 0; i < data.students.length; i++) ...[
              StudentCard(
                model: data.students[i],
              )
            ],
          ]),
        );
        /*
        return ListView.builder(
          itemCount: data.students.length,
          itemBuilder: (context, index) {
            final student = data.students[index];
            return StudentCard(
              model: student,
            );
          },
        );
        */
      },
      error: (error, stackTrace) {
        //log('Erro em TasksPage build');
        //log('$error');
        //log('$stackTrace');
        return const Center(
          child: Text('Erro em buscar students'),
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
