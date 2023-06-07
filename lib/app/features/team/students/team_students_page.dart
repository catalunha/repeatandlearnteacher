import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearnteacher/app/features/team/students/controller/providers.dart';
import 'package:validatorless/validatorless.dart';

import '../../student/list/student_list.dart';
import '../../utils/app_mixin_loader.dart';
import '../../utils/app_mixin_messages.dart';
import '../../utils/app_textformfield.dart';
import 'controller/states.dart';

class TeamStudentsPage extends ConsumerStatefulWidget {
  const TeamStudentsPage({super.key});

  @override
  ConsumerState<TeamStudentsPage> createState() => _TeamStudentsPageState();
}

class _TeamStudentsPageState extends ConsumerState<TeamStudentsPage>
    with Loader, Messages {
  @override
  Widget build(BuildContext context) {
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
              ElevatedButton(
                  onPressed: () async {}, child: const Text('View Calcs')),
            ],
          ),
          const StudentList()
        ],
      ),
    );
  }

  Future<void> _addDialog(BuildContext context) async {
    String valueTxt = '';
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
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
          ),
        );
      },
    );
  }

  Future<void> _createDialog(BuildContext context) async {
    final formKey = GlobalKey<FormState>();
    final userNameTEC = TextEditingController();
    final emailTEC = TextEditingController();
    final passwordTEC = TextEditingController();
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topCenter,
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            label: 'UserName',
                            controller: userNameTEC,
                            validator:
                                Validatorless.required('UserName obrigatório.'),
                          ),
                          AppTextFormField(
                            label: 'E-mail',
                            controller: emailTEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('email obrigatório.'),
                              Validatorless.email('Email inválido.'),
                            ]),
                          ),
                          AppTextFormField(
                            label: 'Senha',
                            obscureText: true,
                            controller: passwordTEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória.'),
                              Validatorless.min(6, 'Minimo de 6 caracteres.'),
                            ]),
                          ),
                          AppTextFormField(
                            label: 'Confirme senha',
                            obscureText: true,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.required(
                                    'Confirmação de senha obrigatória.'),
                                Validatorless.min(6, 'Minimo de 6 caracteres.'),
                                Validatorless.compare(passwordTEC,
                                    'Senha diferente do informado anteriormente.')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar')),
                    Consumer(
                      builder: (context, ref, child) {
                        return ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(teamStudentsStateProvider.notifier)
                                  .create(
                                    userName: userNameTEC.text,
                                    email: emailTEC.text,
                                    password: passwordTEC.text,
                                  );
                              Navigator.pop(context);
                            },
                            child: const Text('ok'));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
