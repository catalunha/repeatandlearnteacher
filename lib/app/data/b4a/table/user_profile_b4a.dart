import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/user_profile_model.dart';
import '../../utils/pagination.dart';
import '../b4a_exception.dart';
import '../entity/user_profile_entity.dart';
import '../utils/parse_error_translate.dart';

class UserProfileB4a {
  Future<QueryBuilder<ParseObject>> getQueryAll(
      QueryBuilder<ParseObject> query, Pagination pagination) async {
    query.setAmountToSkip((pagination.page - 1) * pagination.limit);
    query.setLimit(pagination.limit);

    return query;
  }

  Future<List<UserProfileModel>> list(
    QueryBuilder<ParseObject> query,
    Pagination pagination,
  ) async {
    QueryBuilder<ParseObject> query2;
    query2 = await getQueryAll(query, pagination);
    ParseResponse? response;
    try {
      response = await query2.query();
      List<UserProfileModel> listTemp = <UserProfileModel>[];
      if (response.success && response.results != null) {
        for (var element in response.results!) {
          listTemp.add(UserProfileEntity().toModel(element));
        }
        return listTemp;
      } else {
        return [];
      }
    } on Exception {
      var errorTranslated = ParseErrorTranslate.translate(response!.error!);
      throw B4aException(
        errorTranslated,
        where: 'UserProfileRepositoryB4a.list',
        originalError: '${response.error!.code} -${response.error!.message}',
      );
    }
  }

  Future<UserProfileModel?> readById(String id) async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject(UserProfileEntity.className));
    query.whereEqualTo(UserProfileEntity.id, id);
    query.first();
    try {
      var response = await query.query();

      if (response.success && response.results != null) {
        return UserProfileEntity().toModel(response.results!.first);
      }
      throw B4aException(
        'Perfil do usuário não encontrado.',
        where: 'UserProfileRepositoryB4a.readById()',
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<String> update(UserProfileModel userProfileModel) async {
    final userProfileParse =
        await UserProfileEntity().toParse(userProfileModel);
    ParseResponse? response;
    try {
      response = await userProfileParse.save();

      if (response.success && response.results != null) {
        ParseObject userProfile = response.results!.first as ParseObject;
        return userProfile.objectId!;
      } else {
        throw Exception();
      }
    } on Exception {
      var errorTranslated = ParseErrorTranslate.translate(response!.error!);
      throw B4aException(
        errorTranslated,
        where: 'UserProfileRepositoryB4a.update',
        originalError: '${response.error!.code} -${response.error!.message}',
      );
    }
  }

  Future<String?> getByUserName(String value) async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject(UserProfileEntity.className));
    query.whereEqualTo(UserProfileEntity.userName, value);

    query.first();
    ParseResponse? response;
    try {
      response = await query.query();

      if (response.success && response.results != null) {
        ParseObject userProfile = response.results!.first as ParseObject;
        return userProfile.objectId!;
      } else {
        return null;
      }
    } on Exception {
      var errorTranslated = ParseErrorTranslate.translate(response!.error!);
      throw B4aException(
        errorTranslated,
        where: 'UserProfileRepositoryB4a.getByRegister',
        originalError: '${response.error!.code} -${response.error!.message}',
      );
    }
  }
}
