import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repeatandlearnteacher/app/core/authentication/riverpod/auth_prov.dart';
import 'package:repeatandlearnteacher/app/core/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/team_model.dart';
import '../../../../data/b4a/entity/team_entity.dart';
import '../../../../data/b4a/utils/xfile_to_parsefile.dart';
import 'states.dart';

part 'providers.g.dart';

final xFileProvider = StateProvider<XFile?>(
  (ref) {
    return null;
  },
  name: 'xFileProvider',
);

@riverpod
class TeamSave extends _$TeamSave {
  @override
  TeamSaveState build({
    required TeamModel? teamModel,
  }) {
    return TeamSaveState(team: teamModel);
  }

  Future<void> submitForm({
    required String name,
    required String description,
  }) async {
    state = state.copyWith(status: TeamSaveStatus.loading);
    try {
      TeamModel teamTemp;
      if (state.team == null) {
        final auth = ref.read(authChNotProvider);
        teamTemp = TeamModel(
            userProfile: auth.user!.userProfile!,
            name: name,
            description: description);
      } else {
        teamTemp = state.team!.copyWith(name: name, description: description);
      }
      final repo = ref.read(teamRepositoryProvider);
      String teamSavedId = await repo.save(teamTemp);
      final xFile = ref.read(xFileProvider);
      if (xFile != null) {
        await XFileToParseFile.xFileToParseFile(
          xfile: xFile,
          className: TeamEntity.className,
          objectId: teamSavedId,
          objectAttribute: 'image',
        );
      }
      state = state.copyWith(status: TeamSaveStatus.success);
    } catch (e, st) {
      log('$e');
      log('$st');
      state = state.copyWith(
          status: TeamSaveStatus.error, error: 'Erro ao salvar Team');
    }
  }
}
