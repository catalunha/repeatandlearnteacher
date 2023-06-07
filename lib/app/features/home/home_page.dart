import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/authentication/riverpod/auth_prov.dart';
import '../../routes.dart';
import '../team/list/team_list.dart';
import 'comp/home_popmenu.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authChNotProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Olá ${auth.user?.userProfile?.name ?? auth.user?.email}',
        ),
        actions: const [
          HomePopMenu(),
        ],
      ),
      body: const TeamList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.goNamed(AppPage.teamSave.name, extra: null);
        },
      ),
    );
  }
}
