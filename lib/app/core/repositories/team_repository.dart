import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../data/b4a/table/team_b4a.dart';
import '../../data/utils/pagination.dart';
import '../models/team_model.dart';

class TeamRepository {
  final TeamB4a teamB4a = TeamB4a();

  Future<List<TeamModel>> list({
    required QueryBuilder<ParseObject> query,
    Pagination pagination = const Pagination(),
  }) =>
      teamB4a.list(query: query, pagination: pagination);
  Future<String> save(TeamModel model) => teamB4a.save(model);
  Future<TeamModel> getById(String teamId) => teamB4a.getById(teamId);
  Future<bool> delete(String modelId) => teamB4a.delete(modelId);
  Future<void> updateRelationStudents(
          {required String objectId,
          required List<String> ids,
          required bool add}) =>
      teamB4a.updateRelationStudents(objectId: objectId, ids: ids, add: add);
}
