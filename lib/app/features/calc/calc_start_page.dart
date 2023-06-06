import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../task/controller/providers.dart';
import 'comp/calc_card.dart';
import 'controller/providers.dart';

class CalcStartPage extends ConsumerWidget {
  const CalcStartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskSelected = ref.watch(taskSelectedProvider)!;

    final calcList = ref.watch(calcListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calcs of Level: ${taskSelected.level.title} - Task: ${taskSelected.title}',
        ),
      ),
      body: calcList.when(
        data: (data) {
          return Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CalcCard(
                      model: data[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          //log('Erro em CalcPage build');
          //log('$error');
          //log('$stackTrace');
          return const Center(
            child: Text('Erro'),
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
