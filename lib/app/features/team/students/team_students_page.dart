import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearnteacher/app/features/team/students/controller/providers.dart';

import '../../student/list/student_list.dart';
import '../../utils/app_mixin_loader.dart';
import '../../utils/app_mixin_messages.dart';
import 'controller/states.dart';

class TeamStudentsPage extends ConsumerWidget with Loader, Messages {
  TeamStudentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<TeamStudentsStatus>(
      teamStudentsStatusProvider,
      (previous, next) {
        if (next == TeamStudentsStatus.error) {
          final error = ref.read(teamStudentsErrorProvider);

          hideLoader(context);
          showMessageError(context, error);
        }
        if (next == TeamStudentsStatus.notFound) {
          final error = ref.read(teamStudentsErrorProvider);
          hideLoader(context);
          showMessageError(context, error);
        }
        if (next == TeamStudentsStatus.loading) {
          showLoader(context);
        }
        if (next == TeamStudentsStatus.success) {
          // ref.invalidate(teamListProvider);
          hideLoader(context);
          // context.pop();
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: Column(
        children: [
          Wrap(
            children: [
              ElevatedButton(
                  onPressed: () => _addDialog(context),
                  child: const Text('Add')),
              ElevatedButton(
                  onPressed: () => _createDialog(context),
                  child: const Text('Create')),
              ElevatedButton(onPressed: () {}, child: const Text('View Calcs')),
            ],
          ),
          const StudentList()
        ],
      ),
    );
  }

  Future<void> _addDialog(BuildContext context) async {
    String valueTxt = '';
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Adicionando um estudante'),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) => valueTxt = value,
                      decoration: const InputDecoration(
                          hintText: 'Informe o username do estudante'),
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton(
                        onPressed: () {
                          ref
                              .read(teamStudentsStateProvider.notifier)
                              .add(studentUserName: valueTxt);
                          Navigator.pop(context);
                        },
                        child: const Text('ok'));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _createDialog(BuildContext context) async {
    String valueTxt = '';
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Criar um estudante'),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) => valueTxt = value,
                          decoration: const InputDecoration(
                              hintText: 'Informe o username do estudante'),
                        ),
                        TextField(
                          onChanged: (value) => valueTxt = value,
                          decoration: const InputDecoration(
                              hintText: 'Informe o email do estudante'),
                        ),
                        TextField(
                          onChanged: (value) => valueTxt = value,
                          decoration: const InputDecoration(
                              hintText: 'Informe a senha'),
                        ),
                        TextField(
                          onChanged: (value) => valueTxt = value,
                          decoration:
                              const InputDecoration(hintText: 'Repita a senha'),
                        ),
                      ],
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton(
                        onPressed: () {
                          ref
                              .read(teamStudentsStateProvider.notifier)
                              .add(studentUserName: valueTxt);
                          Navigator.pop(context);
                        },
                        child: const Text('ok'));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
