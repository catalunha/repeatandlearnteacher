// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeamSaveState {
  TeamSaveStatus get status => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  TeamModel? get team => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamSaveStateCopyWith<TeamSaveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamSaveStateCopyWith<$Res> {
  factory $TeamSaveStateCopyWith(
          TeamSaveState value, $Res Function(TeamSaveState) then) =
      _$TeamSaveStateCopyWithImpl<$Res, TeamSaveState>;
  @useResult
  $Res call({TeamSaveStatus status, String error, TeamModel? team});

  $TeamModelCopyWith<$Res>? get team;
}

/// @nodoc
class _$TeamSaveStateCopyWithImpl<$Res, $Val extends TeamSaveState>
    implements $TeamSaveStateCopyWith<$Res> {
  _$TeamSaveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = null,
    Object? team = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TeamSaveStatus,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamModelCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $TeamModelCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TeamSaveStateCopyWith<$Res>
    implements $TeamSaveStateCopyWith<$Res> {
  factory _$$_TeamSaveStateCopyWith(
          _$_TeamSaveState value, $Res Function(_$_TeamSaveState) then) =
      __$$_TeamSaveStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TeamSaveStatus status, String error, TeamModel? team});

  @override
  $TeamModelCopyWith<$Res>? get team;
}

/// @nodoc
class __$$_TeamSaveStateCopyWithImpl<$Res>
    extends _$TeamSaveStateCopyWithImpl<$Res, _$_TeamSaveState>
    implements _$$_TeamSaveStateCopyWith<$Res> {
  __$$_TeamSaveStateCopyWithImpl(
      _$_TeamSaveState _value, $Res Function(_$_TeamSaveState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = null,
    Object? team = freezed,
  }) {
    return _then(_$_TeamSaveState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TeamSaveStatus,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamModel?,
    ));
  }
}

/// @nodoc

class _$_TeamSaveState implements _TeamSaveState {
  _$_TeamSaveState(
      {this.status = TeamSaveStatus.initial, this.error = '', this.team});

  @override
  @JsonKey()
  final TeamSaveStatus status;
  @override
  @JsonKey()
  final String error;
  @override
  final TeamModel? team;

  @override
  String toString() {
    return 'TeamSaveState(status: $status, error: $error, team: $team)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamSaveState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.team, team) || other.team == team));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, team);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamSaveStateCopyWith<_$_TeamSaveState> get copyWith =>
      __$$_TeamSaveStateCopyWithImpl<_$_TeamSaveState>(this, _$identity);
}

abstract class _TeamSaveState implements TeamSaveState {
  factory _TeamSaveState(
      {final TeamSaveStatus status,
      final String error,
      final TeamModel? team}) = _$_TeamSaveState;

  @override
  TeamSaveStatus get status;
  @override
  String get error;
  @override
  TeamModel? get team;
  @override
  @JsonKey(ignore: true)
  _$$_TeamSaveStateCopyWith<_$_TeamSaveState> get copyWith =>
      throw _privateConstructorUsedError;
}
