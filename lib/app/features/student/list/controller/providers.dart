import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearnteacher/app/core/models/team_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/repositories/repositories_providers.dart';

part 'providers.g.dart';

final teamSelectedProvider = StateProvider<TeamModel?>(
  (ref) {
    return null;
  },
  name: 'teamSelectedProvider',
);

@riverpod
FutureOr<TeamModel> teamWithStudents(TeamWithStudentsRef ref) async {
  final teamSelected = ref.read(teamSelectedProvider)!;
  final teamNew =
      await ref.read(teamRepositoryProvider).getById(teamSelected.id!);
  ref.read(teamSelectedProvider.notifier).state = teamNew;
  return ref.read(teamSelectedProvider)!;
}
