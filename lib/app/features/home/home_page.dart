import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/authentication/riverpod/auth_prov.dart';
import 'comp/home_card_module.dart';
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
        body: Center(
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                HomeCardModule(
                  title: 'Levels',
                  // access: const ['admin'],
                  onAction: () {
                    Navigator.of(context).pushNamed('/userProfile/search');
                  },
                  icon: Icons.people,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ));
  }
}
