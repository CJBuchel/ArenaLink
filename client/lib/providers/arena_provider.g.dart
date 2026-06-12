// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arena_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ArenaNotifier)
final arenaProvider = ArenaNotifierProvider._();

final class ArenaNotifierProvider
    extends $NotifierProvider<ArenaNotifier, Arena> {
  ArenaNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'arenaProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$arenaNotifierHash();

  @$internal
  @override
  ArenaNotifier create() => ArenaNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Arena value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Arena>(value),
    );
  }
}

String _$arenaNotifierHash() => r'754028b69c31faabea8e4fec8ae8269d2d87d85d';

abstract class _$ArenaNotifier extends $Notifier<Arena> {
  Arena build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Arena, Arena>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Arena, Arena>,
              Arena,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
