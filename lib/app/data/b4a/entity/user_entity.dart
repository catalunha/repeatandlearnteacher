import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/user_model.dart';
import 'user_profile_entity.dart';

class UserEntity {
  static const String className = '_User';
  // Nome do campo local = no Database
  static const String id = 'objectId';
  static const String email = 'username';
  static const String userProfile = 'userProfile';

  Future<UserModel> fromParse(ParseObject parseUser) async {
    return UserModel(
      id: parseUser.objectId!,
      email: parseUser.get(UserEntity.email),
      userProfile: parseUser.get(UserEntity.userProfile) != null
          ? UserProfileEntity().toModel(parseUser.get(UserEntity.userProfile))
          : null,
    );
  }
}
