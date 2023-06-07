import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
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

  Future<void> create({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      ref.read(teamStudentsStatusProvider.notifier).state =
          TeamStudentsStatus.loading;
      // final repository = ref.read(userRepositoryProvider);
      final user = ParseUser.createUser(userName, password, email);
      ParseResponse? parseResponse;

      parseResponse = await user.signUp();

      if (parseResponse.success && parseResponse.results != null) {
        final ParseUser parseUser = parseResponse.results!.first;
        parseUser.objectId;
        //+++ setando e
        final ParseCloudFunction function =
            ParseCloudFunction('setEmailVerification');
        final Map<String, dynamic> params = <String, dynamic>{
          'userId': parseUser.objectId,
        };
        final ParseResponse parseResponses =
            await function.execute(parameters: params);
        if (parseResponses.success) {
          print(parseResponses.result);
        } else {
          throw Exception();
        }

        //---
        //+++ adicionando userProfile a lista de students
        await add(studentUserName: userName);
        //---
        ref.invalidate(teamWithStudentsProvider);

        ref.read(teamStudentsStatusProvider.notifier).state =
            TeamStudentsStatus.success;
      } else {
        throw Exception();
      }
      // UserModel? user = await repository.register(
      //     userName: userName, email: email, password: password);
      //     user.
      print(user.toString());
      // ref.invalidate(teamWithStudentsProvider);
      ref.read(teamStudentsStatusProvider.notifier).state =
          TeamStudentsStatus.success;
    } catch (e, st) {
      print(e);
      print(st);
      ref.read(teamStudentsErrorProvider.notifier).state =
          'Problemas ao criar um estudante';

      ref.read(teamStudentsStatusProvider.notifier).state =
          TeamStudentsStatus.error;
    }
  }
}
