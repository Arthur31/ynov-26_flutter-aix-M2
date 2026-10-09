// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUsers)
final getUsersProvider = GetUsersProvider._();

final class GetUsersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<User>>,
          List<User>,
          FutureOr<List<User>>
        >
    with $FutureModifier<List<User>>, $FutureProvider<List<User>> {
  GetUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUsersHash();

  @$internal
  @override
  $FutureProviderElement<List<User>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<User>> create(Ref ref) {
    return getUsers(ref);
  }
}

String _$getUsersHash() => r'2bdbf6562563014952316f0cb627fa191efac2f8';

@ProviderFor(getUserAmount)
final getUserAmountProvider = GetUserAmountProvider._();

final class GetUserAmountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  GetUserAmountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserAmountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserAmountHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return getUserAmount(ref);
  }
}

String _$getUserAmountHash() => r'81e3d053c02f371c6e05ff9df812b23b23d1d1c3';

@ProviderFor(getUser)
final getUserProvider = GetUserFamily._();

final class GetUserProvider
    extends $FunctionalProvider<AsyncValue<User>, User, FutureOr<User>>
    with $FutureModifier<User>, $FutureProvider<User> {
  GetUserProvider._({
    required GetUserFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getUserProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUserHash();

  @override
  String toString() {
    return r'getUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<User> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<User> create(Ref ref) {
    final argument = this.argument as String;
    return getUser(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserHash() => r'3b99a7319640764ea3f310700c61b02603ec6196';

final class GetUserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<User>, String> {
  GetUserFamily._()
    : super(
        retry: null,
        name: r'getUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUserProvider call(String id) =>
      GetUserProvider._(argument: id, from: this);

  @override
  String toString() => r'getUserProvider';
}
