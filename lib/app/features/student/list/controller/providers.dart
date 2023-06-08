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
  final teamSelected = ref.read(teamSelectedProvider)!;
  // return await ref.read(teamRepositoryProvider).getById(teamSelected.id!);
  final teamNew =
      await ref.read(teamRepositoryProvider).getById(teamSelected.id!);
  ref.read(teamSelectedProvider.notifier).state = teamNew;
  return teamNew;
}

// @riverpod
// class TeamWithStudents3 extends _$TeamWithStudents3 {
//   @override
//   FutureOr<TeamModel?> build() {
//     return null;
//     // return Future.value([team]);
//   }

//   Future<void> get(TeamModel team) async {
//     state = AsyncData(team);
//   }

//   FutureOr<void> getWithStudents() async {
//     state = const AsyncLoading();

//     state = await AsyncValue.guard(() async {
//       return await ref
//           .read(teamRepositoryProvider)
//           .getById(state.requireValue!.id!);
//     });
//   }
// }

// @riverpod
// class TeamWithStudents2 extends _$TeamWithStudents2 {
//   @override
//   bool build() {
//     return true;
//   }

//   Future<void> updateStudents() async {
//     try {
//       ref.read(teamViewTaskStatusProvider.notifier).state =
//           TeamViewTaskStatus.loading;
//       final teamSelected = ref.read(teamSelectedProvider)!;
//       final teamNew =
//           await ref.read(teamRepositoryProvider).getById(teamSelected.id!);
//       ref.read(teamSelectedProvider.notifier).state = teamNew;
//       ref.read(teamViewTaskStatusProvider.notifier).state =
//           TeamViewTaskStatus.success;
//       // return ref.read(teamSelectedProvider)!;
//     } catch (e, st) {
//       print(e);
//       print(st);
//       ref.read(teamViewTaskStatusProvider.notifier).state =
//           TeamViewTaskStatus.error;
//       throw Exception();
//     }
//   }
// }

@riverpod
class TeamWithStudents2a extends _$TeamWithStudents2a {
  @override
  TeamViewTaskStatus build() {
    return TeamViewTaskStatus.initial;
  }

  Future<void> updateStudents() async {
    try {
      state = TeamViewTaskStatus.loading;
      final teamSelected = ref.read(teamSelectedProvider)!;
      final teamNew =
          await ref.read(teamRepositoryProvider).getById(teamSelected.id!);
      ref.read(teamSelectedProvider.notifier).state = teamNew;
      state = TeamViewTaskStatus.success;
    } catch (e, st) {
      print(e);
      print(st);
      state = TeamViewTaskStatus.error;
    }
  }
}
