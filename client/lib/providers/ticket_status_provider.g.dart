// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TicketStatusNotifier)
final ticketStatusProvider = TicketStatusNotifierProvider._();

final class TicketStatusNotifierProvider
    extends $NotifierProvider<TicketStatusNotifier, void> {
  TicketStatusNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketStatusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketStatusNotifierHash();

  @$internal
  @override
  TicketStatusNotifier create() => TicketStatusNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$ticketStatusNotifierHash() =>
    r'eca0307ea5ec8c64f787b19b3713b0bb0b923109';

abstract class _$TicketStatusNotifier extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
