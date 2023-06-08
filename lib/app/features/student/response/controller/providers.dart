import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:repeatandlearnteacher/app/data/b4a/entity/team_entity.dart';
import 'package:repeatandlearnteacher/app/data/b4a/entity/user_profile_entity.dart';
import 'package:repeatandlearnteacher/app/data/b4a/entity/user_response_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/user_response_model.dart';
import '../../../../data/b4a/entity/level_entity.dart';
import '../../../../data/b4a/entity/task_entity.dart';
import '../../../level/controller/providers.dart';
import '../../../task/controller/providers.dart';
import '../../list/controller/providers.dart';
part 'providers.g.dart';

@riverpod
class StudentsResponse extends _$StudentsResponse {
  @override
  FutureOr<List<UserResponseModel>> build() {
    return _get();
  }

  Future<List<UserResponseModel>> _get() async {
    state = const AsyncValue.loading();
    print('+++ teste2a');
    final team = ref.read(teamSelectedProvider);

    QueryBuilder<ParseObject> queryUserProfile =
        QueryBuilder<ParseObject>(ParseObject(UserProfileEntity.className));
    queryUserProfile.whereRelatedTo(
        TeamEntity.students, TeamEntity.className, team!.id!);
    // var parseResponse1 = await queryUserProfile.query();
    // if (parseResponse1.success && parseResponse1.results != null) {
    //   for (var element in parseResponse1.results!) {
    //     print('queryUserProfile: ${element.objectId}');
    //   }
    // } else {
    //   print('queryUserProfile: []');
    // }
    QueryBuilder<ParseObject> queryUserResponse =
        QueryBuilder<ParseObject>(ParseObject(UserResponseEntity.className));
    queryUserResponse.whereMatchesKeyInQuery(
        UserResponseEntity.userProfile, 'objectId', queryUserProfile);
    final level = ref.read(levelSelectedProvider);
    queryUserResponse.whereEqualTo(UserResponseEntity.level,
        (ParseObject(LevelEntity.className)..objectId = level!.id).toPointer());
    final task = ref.read(taskSelectedProvider);
    queryUserResponse.whereEqualTo(UserResponseEntity.task,
        (ParseObject(TaskEntity.className)..objectId = task!.id).toPointer());
    queryUserResponse
        .includeObject(['userProfile', 'level', 'task', 'task.level']);
    var parseResponse = await queryUserResponse.query();
    List<UserResponseModel> listTemp = <UserResponseModel>[];

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        listTemp.add(UserResponseEntity().toModel(element));
      }
      return listTemp;
    } else {
      return [];
    }
  }
}
