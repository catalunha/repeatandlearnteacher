// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeamModel {
  String? get id => throw _privateConstructorUsedError;
  UserProfileModel get userProfile => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<UserProfileModel> get students => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamModelCopyWith<TeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamModelCopyWith<$Res> {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) then) =
      _$TeamModelCopyWithImpl<$Res, TeamModel>;
  @useResult
  $Res call(
      {String? id,
      UserProfileModel userProfile,
      String? image,
      String name,
      String description,
      List<UserProfileModel> students});
}

/// @nodoc
class _$TeamModelCopyWithImpl<$Res, $Val extends TeamModel>
    implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfile = null,
    Object? image = freezed,
    Object? name = null,
    Object? description = null,
    Object? students = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeamModelCopyWith<$Res> implements $TeamModelCopyWith<$Res> {
  factory _$$_TeamModelCopyWith(
          _$_TeamModel value, $Res Function(_$_TeamModel) then) =
      __$$_TeamModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      UserProfileModel userProfile,
      String? image,
      String name,
      String description,
      List<UserProfileModel> students});
}

/// @nodoc
class __$$_TeamModelCopyWithImpl<$Res>
    extends _$TeamModelCopyWithImpl<$Res, _$_TeamModel>
    implements _$$_TeamModelCopyWith<$Res> {
  __$$_TeamModelCopyWithImpl(
      _$_TeamModel _value, $Res Function(_$_TeamModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfile = null,
    Object? image = freezed,
    Object? name = null,
    Object? description = null,
    Object? students = null,
  }) {
    return _then(_$_TeamModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      students: null == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
    ));
  }
}

/// @nodoc

class _$_TeamModel implements _TeamModel {
  _$_TeamModel(
      {this.id,
      required this.userProfile,
      this.image,
      required this.name,
      required this.description,
      final List<UserProfileModel> students = const []})
      : _students = students;

  @override
  final String? id;
  @override
  final UserProfileModel userProfile;
  @override
  final String? image;
  @override
  final String name;
  @override
  final String description;
  final List<UserProfileModel> _students;
  @override
  @JsonKey()
  List<UserProfileModel> get students {
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  @override
  String toString() {
    return 'TeamModel(id: $id, userProfile: $userProfile, image: $image, name: $name, description: $description, students: $students)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userProfile, image, name,
      description, const DeepCollectionEquality().hash(_students));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamModelCopyWith<_$_TeamModel> get copyWith =>
      __$$_TeamModelCopyWithImpl<_$_TeamModel>(this, _$identity);
}

abstract class _TeamModel implements TeamModel {
  factory _TeamModel(
      {final String? id,
      required final UserProfileModel userProfile,
      final String? image,
      required final String name,
      required final String description,
      final List<UserProfileModel> students}) = _$_TeamModel;

  @override
  String? get id;
  @override
  UserProfileModel get userProfile;
  @override
  String? get image;
  @override
  String get name;
  @override
  String get description;
  @override
  List<UserProfileModel> get students;
  @override
  @JsonKey(ignore: true)
  _$$_TeamModelCopyWith<_$_TeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}
