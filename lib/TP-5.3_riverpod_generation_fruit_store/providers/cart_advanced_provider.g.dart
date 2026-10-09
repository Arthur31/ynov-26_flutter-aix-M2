// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_advanced_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CartAdvancedNotifier)
final cartAdvancedProvider = CartAdvancedNotifierProvider._();

final class CartAdvancedNotifierProvider
    extends $NotifierProvider<CartAdvancedNotifier, List<CartItem>> {
  CartAdvancedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartAdvancedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartAdvancedNotifierHash();

  @$internal
  @override
  CartAdvancedNotifier create() => CartAdvancedNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CartItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CartItem>>(value),
    );
  }
}

String _$cartAdvancedNotifierHash() =>
    r'6ec0147afc7bdba118b28ba66bdf44036bbd81e1';

abstract class _$CartAdvancedNotifier extends $Notifier<List<CartItem>> {
  List<CartItem> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<CartItem>, List<CartItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CartItem>, List<CartItem>>,
              List<CartItem>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(cartItemCountProvider)
final cartItemCountProviderProvider = CartItemCountProviderProvider._();

final class CartItemCountProviderProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  CartItemCountProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartItemCountProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartItemCountProviderHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return cartItemCountProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cartItemCountProviderHash() =>
    r'fd3a3ec587a7f3cc26dc97cbe8eb2aea8adcff8c';

@ProviderFor(cartAdvancedTotal)
final cartAdvancedTotalProvider = CartAdvancedTotalProvider._();

final class CartAdvancedTotalProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  CartAdvancedTotalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartAdvancedTotalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartAdvancedTotalHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return cartAdvancedTotal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$cartAdvancedTotalHash() => r'ce10f667153fe5d89219656ce4a3c1b2f00b6a6f';

@ProviderFor(productQuantityInCart)
final productQuantityInCartProvider = ProductQuantityInCartFamily._();

final class ProductQuantityInCartProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  ProductQuantityInCartProvider._({
    required ProductQuantityInCartFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'productQuantityInCartProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productQuantityInCartHash();

  @override
  String toString() {
    return r'productQuantityInCartProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as int;
    return productQuantityInCart(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProductQuantityInCartProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productQuantityInCartHash() =>
    r'a9c80aa71e239787c844dd1b061094418f4996c2';

final class ProductQuantityInCartFamily extends $Family
    with $FunctionalFamilyOverride<int, int> {
  ProductQuantityInCartFamily._()
    : super(
        retry: null,
        name: r'productQuantityInCartProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductQuantityInCartProvider call(int productId) =>
      ProductQuantityInCartProvider._(argument: productId, from: this);

  @override
  String toString() => r'productQuantityInCartProvider';
}
