// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheesy_arena_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheesyArena)
final cheesyArenaProvider = CheesyArenaProvider._();

final class CheesyArenaProvider
    extends $NotifierProvider<CheesyArena, CheesyArenaState> {
  CheesyArenaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cheesyArenaProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cheesyArenaHash();

  @$internal
  @override
  CheesyArena create() => CheesyArena();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheesyArenaState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheesyArenaState>(value),
    );
  }
}

String _$cheesyArenaHash() => r'8f4368bbd069c6f3903ce937e33dd879ae10785d';

abstract class _$CheesyArena extends $Notifier<CheesyArenaState> {
  CheesyArenaState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CheesyArenaState, CheesyArenaState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CheesyArenaState, CheesyArenaState>,
              CheesyArenaState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
