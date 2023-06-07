import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/repositories/repositories_providers.dart';
import '../../../student/list/controller/providers.dart';
import 'states.dart';

part 'providers.g.dart';

final teamStudentsStatusProvider = StateProvider<TeamStudentsStatus>(
  (ref) {
    return TeamStudentsStatus.initial;
  },
  name: 'teamStudentsStatusProvider',
);
final teamStudentsErrorProvider = StateProvider<String>(
  (ref) {
    return '';
  },
  name: 'teamStudentsStatusProvider',
);

@riverpod
class TeamStudentsState extends _$TeamStudentsState {
  @override
  bool build() {
    return true;
  }

  Future<void> add({required String studentUserName}) async {
    try {
      ref.read(teamStudentsStatusProvider.notifier).state =
          TeamStudentsStatus.loading;
      final userProfileId = await ref
          .read(userProfileRepositoryProvider)
          .getByUserName(studentUserName);
      if (userProfileId != null) {
        final teamSelected = ref.read(teamSelectedProvider)!;

        ref.read(teamRepositoryProvider).updateRelationStudents(
              objectId: teamSelected.id!,
              ids: [userProfileId],
              add: true,
            );
        ref.refresh(teamWithStudentsProvider);
        ref.read(teamStudentsStatusProvider.notifier).state =
            TeamStudentsStatus.success;
      } else {
        ref.read(teamStudentsErrorProvider.notifier).state =
            'Não encontrei este estudante';
        ref.read(teamStudentsStatusProvider.notifier).state =
            TeamStudentsStatus.notFound;
      }
    } catch (e, st) {
      print(e);
      print(st);
      ref.read(teamStudentsErrorProvider.notifier).state =
          'Problemas ao adicionar este estudante';

      ref.read(teamStudentsStatusProvider.notifier).state =
          TeamStudentsStatus.error;
    }
  }

  Future<void> delete({required String userProfileId}) async {
    try {
      ref.read(teamStudentsStatusProvider.notifier).state =
          TeamStudentsStatus.loading;
      final teamSelected = ref.read(teamSelectedProvider)!;

      await ref.read(teamRepositoryProvider).updateRelationStudents(
            objectId: teamSelected.id!,
            ids: [userProfileId],
            add: false,
          );
      ref.invalidate(teamWithStudentsProvider);
      ref.read(teamStudentsStatusProvider.notifier).state =
          TeamStudentsStatus.success;
    } catch (e, st) {
      print(e);
      print(st);
      ref.read(teamStudentsErrorProvider.notifier).state =
          'Problemas ao adicionar este estudante';

      ref.read(teamStudentsStatusProvider.notifier).state =
          TeamStudentsStatus.error;
    }
  }
}
