import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearnteacher/app/core/models/team_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/repositories/repositories_providers.dart';
import 'states.dart';

part 'providers.g.dart';

final teamSelectedProvider = StateProvider<TeamModel?>(
  (ref) {
    return null;
  },
  name: 'teamSelectedProvider',
);

final teamViewTaskStatusProvider = StateProvider<TeamViewTaskStatus>(
  (ref) {
    return TeamViewTaskStatus.initial;
  },
  name: 'teamViewTaskStatusProvider',
);
final teamViewTaskErrorProvider = StateProvider<String>(
  (ref) {
    return '';
  },
  name: 'teamViewTaskErrorProvider',
);

@riverpod
FutureOr<TeamModel> teamWithStudents(TeamWithStudentsRef ref) async {
  try {
    ref.read(teamViewTaskStatusProvider.notifier).state =
        TeamViewTaskStatus.loading;
    final teamSelected = ref.read(teamSelectedProvider)!;
    final teamNew =
        await ref.read(teamRepositoryProvider).getById(teamSelected.id!);
    ref.read(teamSelectedProvider.notifier).state = teamNew;
    ref.read(teamViewTaskStatusProvider.notifier).state =
        TeamViewTaskStatus.success;
    return ref.read(teamSelectedProvider)!;
  } catch (e, st) {
    print(e);
    print(st);
    ref.read(teamViewTaskStatusProvider.notifier).state =
        TeamViewTaskStatus.error;
    throw Exception();
  }
}

@riverpod
class TeamWithStudents2 extends _$TeamWithStudents2 {
  @override
  bool build() {
    return true;
  }

  Future<void> updateStudents() async {
    try {
      ref.read(teamViewTaskStatusProvider.notifier).state =
          TeamViewTaskStatus.loading;
      final teamSelected = ref.read(teamSelectedProvider)!;
      final teamNew =
          await ref.read(teamRepositoryProvider).getById(teamSelected.id!);
      ref.read(teamSelectedProvider.notifier).state = teamNew;
      ref.read(teamViewTaskStatusProvider.notifier).state =
          TeamViewTaskStatus.success;
      return ref.read(teamSelectedProvider)!;
    } catch (e, st) {
      print(e);
      print(st);
      ref.read(teamViewTaskStatusProvider.notifier).state =
          TeamViewTaskStatus.error;
      throw Exception();
    }
  }
}
