import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/team_model.dart';
import '../../../core/models/user_profile_model.dart';
import 'user_profile_entity.dart';

class TeamEntity {
  static const String className = 'Team';
  // Nome do campo local =  no Database
  static const String id = 'objectId';
  static const String userProfile = 'userProfile';
  static const String image = 'image';
  static const String name = 'name';
  static const String description = 'description';
  static const String students = 'students';

  Future<TeamModel> toModel(ParseObject parseObject) async {
    //+++ get students
    List<UserProfileModel> studentsList = [];
    QueryBuilder<ParseObject> queryUserProfile =
        QueryBuilder<ParseObject>(ParseObject(UserProfileEntity.className));
    queryUserProfile.whereRelatedTo(
        TeamEntity.students, TeamEntity.className, parseObject.objectId!);

    final ParseResponse parseResponse = await queryUserProfile.query();
    if (parseResponse.success && parseResponse.results != null) {
      for (var e in parseResponse.results!) {
        studentsList.add(UserProfileEntity().toModel(e as ParseObject));
      }
    }
    //--- get students

    TeamModel model = TeamModel(
      id: parseObject.objectId!,
      userProfile:
          UserProfileEntity().toModel(parseObject.get(TeamEntity.userProfile)),
      image: parseObject.get(TeamEntity.image)?.get('url'),
      name: parseObject.get(TeamEntity.name),
      description: parseObject.get(TeamEntity.description),
      students: studentsList,
    );
    return model;
  }

  Future<ParseObject> toParse(TeamModel model) async {
    final parseObject = ParseObject(TeamEntity.className);
    parseObject.objectId = model.id;

    parseObject.set(
        TeamEntity.userProfile,
        (ParseObject(UserProfileEntity.className)
              ..objectId = model.userProfile.id)
            .toPointer());

    parseObject.set(TeamEntity.name, model.name);
    parseObject.set(TeamEntity.description, model.description);

    return parseObject;
  }

  ParseObject? toParseRelationStudents({
    required String objectId,
    required List<String> ids,
    required bool add,
  }) {
    final parseObject = ParseObject(TeamEntity.className);
    parseObject.objectId = objectId;
    if (ids.isEmpty) {
      parseObject.unset(TeamEntity.students);
      return parseObject;
    }
    if (add) {
      parseObject.addRelation(
        TeamEntity.students,
        ids
            .map(
              (element) =>
                  ParseObject(UserProfileEntity.className)..objectId = element,
            )
            .toList(),
      );
    } else {
      parseObject.removeRelation(
          TeamEntity.students,
          ids
              .map((element) =>
                  ParseObject(UserProfileEntity.className)..objectId = element)
              .toList());
    }
    return parseObject;
  }
}
