// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$teamSaveHash() => r'8cbcb2aedee355c6842e9892473525f32bc00f73';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TeamSave extends BuildlessAutoDisposeNotifier<TeamSaveState> {
  late final TeamModel? teamModel;

  TeamSaveState build({
    required TeamModel? teamModel,
  });
}

/// See also [TeamSave].
@ProviderFor(TeamSave)
const teamSaveProvider = TeamSaveFamily();

/// See also [TeamSave].
class TeamSaveFamily extends Family<TeamSaveState> {
  /// See also [TeamSave].
  const TeamSaveFamily();

  /// See also [TeamSave].
  TeamSaveProvider call({
    required TeamModel? teamModel,
  }) {
    return TeamSaveProvider(
      teamModel: teamModel,
    );
  }

  @override
  TeamSaveProvider getProviderOverride(
    covariant TeamSaveProvider provider,
  ) {
    return call(
      teamModel: provider.teamModel,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'teamSaveProvider';
}

/// See also [TeamSave].
class TeamSaveProvider
    extends AutoDisposeNotifierProviderImpl<TeamSave, TeamSaveState> {
  /// See also [TeamSave].
  TeamSaveProvider({
    required this.teamModel,
  }) : super.internal(
          () => TeamSave()..teamModel = teamModel,
          from: teamSaveProvider,
          name: r'teamSaveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$teamSaveHash,
          dependencies: TeamSaveFamily._dependencies,
          allTransitiveDependencies: TeamSaveFamily._allTransitiveDependencies,
        );

  final TeamModel? teamModel;

  @override
  bool operator ==(Object other) {
    return other is TeamSaveProvider && other.teamModel == teamModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamModel.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  TeamSaveState runNotifierBuild(
    covariant TeamSave notifier,
  ) {
    return notifier.build(
      teamModel: teamModel,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
