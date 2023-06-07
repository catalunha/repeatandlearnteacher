// @riverpod
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:repeatandlearnteacher/app/core/authentication/riverpod/auth_prov.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/authentication/riverpod/auth_state.dart';
import '../../../../core/models/team_model.dart';
import '../../../../core/repositories/repositories_providers.dart';
import '../../../../data/b4a/entity/team_entity.dart';
import '../../../../data/b4a/entity/user_profile_entity.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<TeamModel>> teamList(
  TeamListRef ref,
) async {
  AuthChNot auth = ref.read(authChNotProvider);
  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject(TeamEntity.className));
  query.whereEqualTo(
      TeamEntity.userProfile,
      (ParseObject(UserProfileEntity.className)
            ..objectId = auth.user!.userProfile!.id)
          .toPointer());
  return await ref.read(teamRepositoryProvider).list(query: query);
}
