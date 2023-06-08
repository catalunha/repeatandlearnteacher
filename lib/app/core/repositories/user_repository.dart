import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../data/b4a/table/user_b4a.dart';
import '../models/user_model.dart';
import '../models/user_profile_model.dart';

class UserRepository {
  final UserB4a userB4a;

  UserRepository({required this.userB4a});
  Future<UserModel?> register(
          {required String userName,
          required String email,
          required String password}) =>
      userB4a.register(userName: userName, email: email, password: password);

  Future<UserModel?> hasUserLogged() => userB4a.hasUserLogged();
  Future<UserModel?> readByEmail(String email) => userB4a.readByEmail(email);

  Future<UserModel?> login({required String email, required String password}) =>
      userB4a.login(email: email, password: password);
  Future<bool> logout() => userB4a.logout();
  Future<void> requestPasswordReset(String email) =>
      userB4a.requestPasswordReset(email);
  Future<UserProfileModel?> readUserProfile(ParseUser parseUser) =>
      userB4a.readUserProfile(parseUser);
}
