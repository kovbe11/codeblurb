// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_editing_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$codeEditingNotifierHash() =>
    r'683eb287e72e4a84594d91627b792d335979f24e';

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

abstract class _$CodeEditingNotifier
    extends BuildlessAutoDisposeNotifier<CodeEditingState> {
  late final String starterCode;

  CodeEditingState build(
    String starterCode,
  );
}

/// See also [CodeEditingNotifier].
@ProviderFor(CodeEditingNotifier)
const codeEditingNotifierProvider = CodeEditingNotifierFamily();

/// See also [CodeEditingNotifier].
class CodeEditingNotifierFamily extends Family<CodeEditingState> {
  /// See also [CodeEditingNotifier].
  const CodeEditingNotifierFamily();

  /// See also [CodeEditingNotifier].
  CodeEditingNotifierProvider call(
    String starterCode,
  ) {
    return CodeEditingNotifierProvider(
      starterCode,
    );
  }

  @override
  CodeEditingNotifierProvider getProviderOverride(
    covariant CodeEditingNotifierProvider provider,
  ) {
    return call(
      provider.starterCode,
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
  String? get name => r'codeEditingNotifierProvider';
}

/// See also [CodeEditingNotifier].
class CodeEditingNotifierProvider extends AutoDisposeNotifierProviderImpl<
    CodeEditingNotifier, CodeEditingState> {
  /// See also [CodeEditingNotifier].
  CodeEditingNotifierProvider(
    this.starterCode,
  ) : super.internal(
          () => CodeEditingNotifier()..starterCode = starterCode,
          from: codeEditingNotifierProvider,
          name: r'codeEditingNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$codeEditingNotifierHash,
          dependencies: CodeEditingNotifierFamily._dependencies,
          allTransitiveDependencies:
              CodeEditingNotifierFamily._allTransitiveDependencies,
        );

  final String starterCode;

  @override
  bool operator ==(Object other) {
    return other is CodeEditingNotifierProvider &&
        other.starterCode == starterCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, starterCode.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  CodeEditingState runNotifierBuild(
    covariant CodeEditingNotifier notifier,
  ) {
    return notifier.build(
      starterCode,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
