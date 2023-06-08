import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/team_model.dart';

part 'states.freezed.dart';

enum TeamSaveStatus { initial, loading, success, error }

@freezed
abstract class TeamSaveState with _$TeamSaveState {
  factory TeamSaveState({
    @Default(TeamSaveStatus.initial) TeamSaveStatus status,
    @Default('') String error,
    TeamModel? team,
  }) = _TeamSaveState;
}
