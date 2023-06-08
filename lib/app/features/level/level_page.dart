import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'comp/level_card.dart';
import 'controller/providers.dart';

class LevelPage extends ConsumerWidget {
  const LevelPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelList = ref.watch(levelListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Levels',
        ),
      ),
      body: levelList.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final level = data[index];
              return LevelCard(
                model: level,
              );
            },
          );
        },
        error: (error, stackTrace) {
          //log('Erro em LevelsPage build');
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
