import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repeatandlearnteacher/app/core/models/user_profile_model.dart';

part 'team_model.freezed.dart';

@freezed
abstract class TeamModel with _$TeamModel {
  factory TeamModel({
    String? id,
    required UserProfileModel userProfile,
    String? image,
    required String name,
    required String description,
    @Default([]) List<UserProfileModel> students,
  }) = _TeamModel;
}
