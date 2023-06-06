import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/b4a/b4a_exception.dart';
import '../../../data/b4a/init_back4app.dart';
import '../../repositories/repositories_providers.dart';
import 'auth_state.dart';

part 'auth_prov.g.dart';

final authChNotProvider = Provider<AuthChNot>((ref) {
  return AuthChNot();
});

@riverpod
void logout(LogoutRef ref) {
  final repository = ref.read(userRepositoryProvider);
  repository.logout();
  final authChNot = ref.read(authChNotProvider);
  authChNot.logout();
}

// final authStatusStProv = StateProvider<AuthStatus>((ref) => AuthStatus.unknown);
// final authErrorMsgProv = StateProvider<String>((ref) => '');
// final currentUser = Provider<UserModel>((ref) => throw UnimplementedError());

final authCheckFutProvider = FutureProvider<void>((ref) async {
  final authChNotProvIR = ref.read(authChNotProvider);
  final userRepositoryProvIR = ref.read(userRepositoryProvider);
  final InitBack4app initBack4app = InitBack4app();
  try {
    final bool initParse = await initBack4app.init();

    ////log('+++ AuthenticationEventInitial 1');
    if (initParse) {
      ////log('+++ AuthenticationEventInitial 2');
      final user = await userRepositoryProvIR.hasUserLogged();

      ////log('+++ AuthenticationEventInitial 3');
      if (user != null) {
        ////log('+++ AuthenticationEventInitial 4');
        if (user.userProfile?.isActive == true) {
          ////log('+++ AuthenticationEventInitial 5');
          authChNotProvIR.user = user;

          ////log('Já logado ${user.email}');
        } else {
          ////log('+++ AuthenticationEventInitial 7');
          await userRepositoryProvIR.logout();
          authChNotProvIR.logout();
        }
      } else {
        ////log('+++ AuthenticationEventInitial 6');
        authChNotProvIR.logout();
      }
    }
  } on B4aException catch (e) {
    print('+++ _onAuthenticationEventInitial 8');
    print(e);
    authChNotProvIR.status = AuthStatus.databaseError;
  } catch (e) {
    print('+++ _onAuthenticationEventInitial 9');
    print(e);
    authChNotProvIR.status = AuthStatus.unauthenticated;
  }
});
