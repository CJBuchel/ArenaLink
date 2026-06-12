// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cheesy_arena_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArenaMessage {

@JsonKey(name: 'type') String get type;@JsonKey(name: 'data') dynamic get data;
/// Create a copy of ArenaMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArenaMessageCopyWith<ArenaMessage> get copyWith => _$ArenaMessageCopyWithImpl<ArenaMessage>(this as ArenaMessage, _$identity);

  /// Serializes this ArenaMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArenaMessage&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ArenaMessage(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class $ArenaMessageCopyWith<$Res>  {
  factory $ArenaMessageCopyWith(ArenaMessage value, $Res Function(ArenaMessage) _then) = _$ArenaMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'type') String type,@JsonKey(name: 'data') dynamic data
});




}
/// @nodoc
class _$ArenaMessageCopyWithImpl<$Res>
    implements $ArenaMessageCopyWith<$Res> {
  _$ArenaMessageCopyWithImpl(this._self, this._then);

  final ArenaMessage _self;
  final $Res Function(ArenaMessage) _then;

/// Create a copy of ArenaMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [ArenaMessage].
extension ArenaMessagePatterns on ArenaMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArenaMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArenaMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArenaMessage value)  $default,){
final _that = this;
switch (_that) {
case _ArenaMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArenaMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ArenaMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  String type, @JsonKey(name: 'data')  dynamic data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArenaMessage() when $default != null:
return $default(_that.type,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  String type, @JsonKey(name: 'data')  dynamic data)  $default,) {final _that = this;
switch (_that) {
case _ArenaMessage():
return $default(_that.type,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'type')  String type, @JsonKey(name: 'data')  dynamic data)?  $default,) {final _that = this;
switch (_that) {
case _ArenaMessage() when $default != null:
return $default(_that.type,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArenaMessage implements ArenaMessage {
  const _ArenaMessage({@JsonKey(name: 'type') required this.type, @JsonKey(name: 'data') required this.data});
  factory _ArenaMessage.fromJson(Map<String, dynamic> json) => _$ArenaMessageFromJson(json);

@override@JsonKey(name: 'type') final  String type;
@override@JsonKey(name: 'data') final  dynamic data;

/// Create a copy of ArenaMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArenaMessageCopyWith<_ArenaMessage> get copyWith => __$ArenaMessageCopyWithImpl<_ArenaMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArenaMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArenaMessage&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ArenaMessage(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ArenaMessageCopyWith<$Res> implements $ArenaMessageCopyWith<$Res> {
  factory _$ArenaMessageCopyWith(_ArenaMessage value, $Res Function(_ArenaMessage) _then) = __$ArenaMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'type') String type,@JsonKey(name: 'data') dynamic data
});




}
/// @nodoc
class __$ArenaMessageCopyWithImpl<$Res>
    implements _$ArenaMessageCopyWith<$Res> {
  __$ArenaMessageCopyWithImpl(this._self, this._then);

  final _ArenaMessage _self;
  final $Res Function(_ArenaMessage) _then;

/// Create a copy of ArenaMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? data = freezed,}) {
  return _then(_ArenaMessage(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$CheesyArenaStatus {

@JsonKey(name: 'MatchId') int get matchId;@JsonKey(name: 'AllianceStations') Map<String, CheesyAllianceStation> get allianceStations;@JsonKey(name: 'MatchState') int get matchState;@JsonKey(name: 'CanStartMatch') bool get canStartMatch;@JsonKey(name: 'PlcIsHealthy') bool get plcIsHealthy;@JsonKey(name: 'FieldEStop') bool get fieldEStop;@JsonKey(name: 'AccessPointStatus') String get accessPointStatus;@JsonKey(name: 'SwitchStatus') String get switchStatus;@JsonKey(name: 'RedSCCStatus') String get redSccStatus;@JsonKey(name: 'BlueSCCStatus') String get blueSccStatus;@JsonKey(name: 'PlcArmorBlockStatuses') Map<String, bool>? get plcArmorBlockStatuses;
/// Create a copy of CheesyArenaStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyArenaStatusCopyWith<CheesyArenaStatus> get copyWith => _$CheesyArenaStatusCopyWithImpl<CheesyArenaStatus>(this as CheesyArenaStatus, _$identity);

  /// Serializes this CheesyArenaStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyArenaStatus&&(identical(other.matchId, matchId) || other.matchId == matchId)&&const DeepCollectionEquality().equals(other.allianceStations, allianceStations)&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.canStartMatch, canStartMatch) || other.canStartMatch == canStartMatch)&&(identical(other.plcIsHealthy, plcIsHealthy) || other.plcIsHealthy == plcIsHealthy)&&(identical(other.fieldEStop, fieldEStop) || other.fieldEStop == fieldEStop)&&(identical(other.accessPointStatus, accessPointStatus) || other.accessPointStatus == accessPointStatus)&&(identical(other.switchStatus, switchStatus) || other.switchStatus == switchStatus)&&(identical(other.redSccStatus, redSccStatus) || other.redSccStatus == redSccStatus)&&(identical(other.blueSccStatus, blueSccStatus) || other.blueSccStatus == blueSccStatus)&&const DeepCollectionEquality().equals(other.plcArmorBlockStatuses, plcArmorBlockStatuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,const DeepCollectionEquality().hash(allianceStations),matchState,canStartMatch,plcIsHealthy,fieldEStop,accessPointStatus,switchStatus,redSccStatus,blueSccStatus,const DeepCollectionEquality().hash(plcArmorBlockStatuses));

@override
String toString() {
  return 'CheesyArenaStatus(matchId: $matchId, allianceStations: $allianceStations, matchState: $matchState, canStartMatch: $canStartMatch, plcIsHealthy: $plcIsHealthy, fieldEStop: $fieldEStop, accessPointStatus: $accessPointStatus, switchStatus: $switchStatus, redSccStatus: $redSccStatus, blueSccStatus: $blueSccStatus, plcArmorBlockStatuses: $plcArmorBlockStatuses)';
}


}

/// @nodoc
abstract mixin class $CheesyArenaStatusCopyWith<$Res>  {
  factory $CheesyArenaStatusCopyWith(CheesyArenaStatus value, $Res Function(CheesyArenaStatus) _then) = _$CheesyArenaStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MatchId') int matchId,@JsonKey(name: 'AllianceStations') Map<String, CheesyAllianceStation> allianceStations,@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'CanStartMatch') bool canStartMatch,@JsonKey(name: 'PlcIsHealthy') bool plcIsHealthy,@JsonKey(name: 'FieldEStop') bool fieldEStop,@JsonKey(name: 'AccessPointStatus') String accessPointStatus,@JsonKey(name: 'SwitchStatus') String switchStatus,@JsonKey(name: 'RedSCCStatus') String redSccStatus,@JsonKey(name: 'BlueSCCStatus') String blueSccStatus,@JsonKey(name: 'PlcArmorBlockStatuses') Map<String, bool>? plcArmorBlockStatuses
});




}
/// @nodoc
class _$CheesyArenaStatusCopyWithImpl<$Res>
    implements $CheesyArenaStatusCopyWith<$Res> {
  _$CheesyArenaStatusCopyWithImpl(this._self, this._then);

  final CheesyArenaStatus _self;
  final $Res Function(CheesyArenaStatus) _then;

/// Create a copy of CheesyArenaStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchId = null,Object? allianceStations = null,Object? matchState = null,Object? canStartMatch = null,Object? plcIsHealthy = null,Object? fieldEStop = null,Object? accessPointStatus = null,Object? switchStatus = null,Object? redSccStatus = null,Object? blueSccStatus = null,Object? plcArmorBlockStatuses = freezed,}) {
  return _then(_self.copyWith(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,allianceStations: null == allianceStations ? _self.allianceStations : allianceStations // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyAllianceStation>,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,canStartMatch: null == canStartMatch ? _self.canStartMatch : canStartMatch // ignore: cast_nullable_to_non_nullable
as bool,plcIsHealthy: null == plcIsHealthy ? _self.plcIsHealthy : plcIsHealthy // ignore: cast_nullable_to_non_nullable
as bool,fieldEStop: null == fieldEStop ? _self.fieldEStop : fieldEStop // ignore: cast_nullable_to_non_nullable
as bool,accessPointStatus: null == accessPointStatus ? _self.accessPointStatus : accessPointStatus // ignore: cast_nullable_to_non_nullable
as String,switchStatus: null == switchStatus ? _self.switchStatus : switchStatus // ignore: cast_nullable_to_non_nullable
as String,redSccStatus: null == redSccStatus ? _self.redSccStatus : redSccStatus // ignore: cast_nullable_to_non_nullable
as String,blueSccStatus: null == blueSccStatus ? _self.blueSccStatus : blueSccStatus // ignore: cast_nullable_to_non_nullable
as String,plcArmorBlockStatuses: freezed == plcArmorBlockStatuses ? _self.plcArmorBlockStatuses : plcArmorBlockStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, bool>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyArenaStatus].
extension CheesyArenaStatusPatterns on CheesyArenaStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyArenaStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyArenaStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyArenaStatus value)  $default,){
final _that = this;
switch (_that) {
case _CheesyArenaStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyArenaStatus value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyArenaStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'MatchId')  int matchId, @JsonKey(name: 'AllianceStations')  Map<String, CheesyAllianceStation> allianceStations, @JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'CanStartMatch')  bool canStartMatch, @JsonKey(name: 'PlcIsHealthy')  bool plcIsHealthy, @JsonKey(name: 'FieldEStop')  bool fieldEStop, @JsonKey(name: 'AccessPointStatus')  String accessPointStatus, @JsonKey(name: 'SwitchStatus')  String switchStatus, @JsonKey(name: 'RedSCCStatus')  String redSccStatus, @JsonKey(name: 'BlueSCCStatus')  String blueSccStatus, @JsonKey(name: 'PlcArmorBlockStatuses')  Map<String, bool>? plcArmorBlockStatuses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyArenaStatus() when $default != null:
return $default(_that.matchId,_that.allianceStations,_that.matchState,_that.canStartMatch,_that.plcIsHealthy,_that.fieldEStop,_that.accessPointStatus,_that.switchStatus,_that.redSccStatus,_that.blueSccStatus,_that.plcArmorBlockStatuses);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'MatchId')  int matchId, @JsonKey(name: 'AllianceStations')  Map<String, CheesyAllianceStation> allianceStations, @JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'CanStartMatch')  bool canStartMatch, @JsonKey(name: 'PlcIsHealthy')  bool plcIsHealthy, @JsonKey(name: 'FieldEStop')  bool fieldEStop, @JsonKey(name: 'AccessPointStatus')  String accessPointStatus, @JsonKey(name: 'SwitchStatus')  String switchStatus, @JsonKey(name: 'RedSCCStatus')  String redSccStatus, @JsonKey(name: 'BlueSCCStatus')  String blueSccStatus, @JsonKey(name: 'PlcArmorBlockStatuses')  Map<String, bool>? plcArmorBlockStatuses)  $default,) {final _that = this;
switch (_that) {
case _CheesyArenaStatus():
return $default(_that.matchId,_that.allianceStations,_that.matchState,_that.canStartMatch,_that.plcIsHealthy,_that.fieldEStop,_that.accessPointStatus,_that.switchStatus,_that.redSccStatus,_that.blueSccStatus,_that.plcArmorBlockStatuses);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'MatchId')  int matchId, @JsonKey(name: 'AllianceStations')  Map<String, CheesyAllianceStation> allianceStations, @JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'CanStartMatch')  bool canStartMatch, @JsonKey(name: 'PlcIsHealthy')  bool plcIsHealthy, @JsonKey(name: 'FieldEStop')  bool fieldEStop, @JsonKey(name: 'AccessPointStatus')  String accessPointStatus, @JsonKey(name: 'SwitchStatus')  String switchStatus, @JsonKey(name: 'RedSCCStatus')  String redSccStatus, @JsonKey(name: 'BlueSCCStatus')  String blueSccStatus, @JsonKey(name: 'PlcArmorBlockStatuses')  Map<String, bool>? plcArmorBlockStatuses)?  $default,) {final _that = this;
switch (_that) {
case _CheesyArenaStatus() when $default != null:
return $default(_that.matchId,_that.allianceStations,_that.matchState,_that.canStartMatch,_that.plcIsHealthy,_that.fieldEStop,_that.accessPointStatus,_that.switchStatus,_that.redSccStatus,_that.blueSccStatus,_that.plcArmorBlockStatuses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyArenaStatus implements CheesyArenaStatus {
  const _CheesyArenaStatus({@JsonKey(name: 'MatchId') required this.matchId, @JsonKey(name: 'AllianceStations') required final  Map<String, CheesyAllianceStation> allianceStations, @JsonKey(name: 'MatchState') required this.matchState, @JsonKey(name: 'CanStartMatch') required this.canStartMatch, @JsonKey(name: 'PlcIsHealthy') required this.plcIsHealthy, @JsonKey(name: 'FieldEStop') required this.fieldEStop, @JsonKey(name: 'AccessPointStatus') this.accessPointStatus = 'UNKNOWN', @JsonKey(name: 'SwitchStatus') this.switchStatus = 'UNKNOWN', @JsonKey(name: 'RedSCCStatus') this.redSccStatus = 'UNKNOWN', @JsonKey(name: 'BlueSCCStatus') this.blueSccStatus = 'UNKNOWN', @JsonKey(name: 'PlcArmorBlockStatuses') final  Map<String, bool>? plcArmorBlockStatuses}): _allianceStations = allianceStations,_plcArmorBlockStatuses = plcArmorBlockStatuses;
  factory _CheesyArenaStatus.fromJson(Map<String, dynamic> json) => _$CheesyArenaStatusFromJson(json);

@override@JsonKey(name: 'MatchId') final  int matchId;
 final  Map<String, CheesyAllianceStation> _allianceStations;
@override@JsonKey(name: 'AllianceStations') Map<String, CheesyAllianceStation> get allianceStations {
  if (_allianceStations is EqualUnmodifiableMapView) return _allianceStations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_allianceStations);
}

@override@JsonKey(name: 'MatchState') final  int matchState;
@override@JsonKey(name: 'CanStartMatch') final  bool canStartMatch;
@override@JsonKey(name: 'PlcIsHealthy') final  bool plcIsHealthy;
@override@JsonKey(name: 'FieldEStop') final  bool fieldEStop;
@override@JsonKey(name: 'AccessPointStatus') final  String accessPointStatus;
@override@JsonKey(name: 'SwitchStatus') final  String switchStatus;
@override@JsonKey(name: 'RedSCCStatus') final  String redSccStatus;
@override@JsonKey(name: 'BlueSCCStatus') final  String blueSccStatus;
 final  Map<String, bool>? _plcArmorBlockStatuses;
@override@JsonKey(name: 'PlcArmorBlockStatuses') Map<String, bool>? get plcArmorBlockStatuses {
  final value = _plcArmorBlockStatuses;
  if (value == null) return null;
  if (_plcArmorBlockStatuses is EqualUnmodifiableMapView) return _plcArmorBlockStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CheesyArenaStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyArenaStatusCopyWith<_CheesyArenaStatus> get copyWith => __$CheesyArenaStatusCopyWithImpl<_CheesyArenaStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyArenaStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyArenaStatus&&(identical(other.matchId, matchId) || other.matchId == matchId)&&const DeepCollectionEquality().equals(other._allianceStations, _allianceStations)&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.canStartMatch, canStartMatch) || other.canStartMatch == canStartMatch)&&(identical(other.plcIsHealthy, plcIsHealthy) || other.plcIsHealthy == plcIsHealthy)&&(identical(other.fieldEStop, fieldEStop) || other.fieldEStop == fieldEStop)&&(identical(other.accessPointStatus, accessPointStatus) || other.accessPointStatus == accessPointStatus)&&(identical(other.switchStatus, switchStatus) || other.switchStatus == switchStatus)&&(identical(other.redSccStatus, redSccStatus) || other.redSccStatus == redSccStatus)&&(identical(other.blueSccStatus, blueSccStatus) || other.blueSccStatus == blueSccStatus)&&const DeepCollectionEquality().equals(other._plcArmorBlockStatuses, _plcArmorBlockStatuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,const DeepCollectionEquality().hash(_allianceStations),matchState,canStartMatch,plcIsHealthy,fieldEStop,accessPointStatus,switchStatus,redSccStatus,blueSccStatus,const DeepCollectionEquality().hash(_plcArmorBlockStatuses));

@override
String toString() {
  return 'CheesyArenaStatus(matchId: $matchId, allianceStations: $allianceStations, matchState: $matchState, canStartMatch: $canStartMatch, plcIsHealthy: $plcIsHealthy, fieldEStop: $fieldEStop, accessPointStatus: $accessPointStatus, switchStatus: $switchStatus, redSccStatus: $redSccStatus, blueSccStatus: $blueSccStatus, plcArmorBlockStatuses: $plcArmorBlockStatuses)';
}


}

/// @nodoc
abstract mixin class _$CheesyArenaStatusCopyWith<$Res> implements $CheesyArenaStatusCopyWith<$Res> {
  factory _$CheesyArenaStatusCopyWith(_CheesyArenaStatus value, $Res Function(_CheesyArenaStatus) _then) = __$CheesyArenaStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MatchId') int matchId,@JsonKey(name: 'AllianceStations') Map<String, CheesyAllianceStation> allianceStations,@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'CanStartMatch') bool canStartMatch,@JsonKey(name: 'PlcIsHealthy') bool plcIsHealthy,@JsonKey(name: 'FieldEStop') bool fieldEStop,@JsonKey(name: 'AccessPointStatus') String accessPointStatus,@JsonKey(name: 'SwitchStatus') String switchStatus,@JsonKey(name: 'RedSCCStatus') String redSccStatus,@JsonKey(name: 'BlueSCCStatus') String blueSccStatus,@JsonKey(name: 'PlcArmorBlockStatuses') Map<String, bool>? plcArmorBlockStatuses
});




}
/// @nodoc
class __$CheesyArenaStatusCopyWithImpl<$Res>
    implements _$CheesyArenaStatusCopyWith<$Res> {
  __$CheesyArenaStatusCopyWithImpl(this._self, this._then);

  final _CheesyArenaStatus _self;
  final $Res Function(_CheesyArenaStatus) _then;

/// Create a copy of CheesyArenaStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? allianceStations = null,Object? matchState = null,Object? canStartMatch = null,Object? plcIsHealthy = null,Object? fieldEStop = null,Object? accessPointStatus = null,Object? switchStatus = null,Object? redSccStatus = null,Object? blueSccStatus = null,Object? plcArmorBlockStatuses = freezed,}) {
  return _then(_CheesyArenaStatus(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,allianceStations: null == allianceStations ? _self._allianceStations : allianceStations // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyAllianceStation>,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,canStartMatch: null == canStartMatch ? _self.canStartMatch : canStartMatch // ignore: cast_nullable_to_non_nullable
as bool,plcIsHealthy: null == plcIsHealthy ? _self.plcIsHealthy : plcIsHealthy // ignore: cast_nullable_to_non_nullable
as bool,fieldEStop: null == fieldEStop ? _self.fieldEStop : fieldEStop // ignore: cast_nullable_to_non_nullable
as bool,accessPointStatus: null == accessPointStatus ? _self.accessPointStatus : accessPointStatus // ignore: cast_nullable_to_non_nullable
as String,switchStatus: null == switchStatus ? _self.switchStatus : switchStatus // ignore: cast_nullable_to_non_nullable
as String,redSccStatus: null == redSccStatus ? _self.redSccStatus : redSccStatus // ignore: cast_nullable_to_non_nullable
as String,blueSccStatus: null == blueSccStatus ? _self.blueSccStatus : blueSccStatus // ignore: cast_nullable_to_non_nullable
as String,plcArmorBlockStatuses: freezed == plcArmorBlockStatuses ? _self._plcArmorBlockStatuses : plcArmorBlockStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, bool>?,
  ));
}


}


/// @nodoc
mixin _$CheesyEventStatus {

@JsonKey(name: 'CycleTime') String get cycleTime;@JsonKey(name: 'EarlyLateMessage') String get earlyLateMessage;
/// Create a copy of CheesyEventStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyEventStatusCopyWith<CheesyEventStatus> get copyWith => _$CheesyEventStatusCopyWithImpl<CheesyEventStatus>(this as CheesyEventStatus, _$identity);

  /// Serializes this CheesyEventStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyEventStatus&&(identical(other.cycleTime, cycleTime) || other.cycleTime == cycleTime)&&(identical(other.earlyLateMessage, earlyLateMessage) || other.earlyLateMessage == earlyLateMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cycleTime,earlyLateMessage);

@override
String toString() {
  return 'CheesyEventStatus(cycleTime: $cycleTime, earlyLateMessage: $earlyLateMessage)';
}


}

/// @nodoc
abstract mixin class $CheesyEventStatusCopyWith<$Res>  {
  factory $CheesyEventStatusCopyWith(CheesyEventStatus value, $Res Function(CheesyEventStatus) _then) = _$CheesyEventStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'CycleTime') String cycleTime,@JsonKey(name: 'EarlyLateMessage') String earlyLateMessage
});




}
/// @nodoc
class _$CheesyEventStatusCopyWithImpl<$Res>
    implements $CheesyEventStatusCopyWith<$Res> {
  _$CheesyEventStatusCopyWithImpl(this._self, this._then);

  final CheesyEventStatus _self;
  final $Res Function(CheesyEventStatus) _then;

/// Create a copy of CheesyEventStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cycleTime = null,Object? earlyLateMessage = null,}) {
  return _then(_self.copyWith(
cycleTime: null == cycleTime ? _self.cycleTime : cycleTime // ignore: cast_nullable_to_non_nullable
as String,earlyLateMessage: null == earlyLateMessage ? _self.earlyLateMessage : earlyLateMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyEventStatus].
extension CheesyEventStatusPatterns on CheesyEventStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyEventStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyEventStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyEventStatus value)  $default,){
final _that = this;
switch (_that) {
case _CheesyEventStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyEventStatus value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyEventStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'CycleTime')  String cycleTime, @JsonKey(name: 'EarlyLateMessage')  String earlyLateMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyEventStatus() when $default != null:
return $default(_that.cycleTime,_that.earlyLateMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'CycleTime')  String cycleTime, @JsonKey(name: 'EarlyLateMessage')  String earlyLateMessage)  $default,) {final _that = this;
switch (_that) {
case _CheesyEventStatus():
return $default(_that.cycleTime,_that.earlyLateMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'CycleTime')  String cycleTime, @JsonKey(name: 'EarlyLateMessage')  String earlyLateMessage)?  $default,) {final _that = this;
switch (_that) {
case _CheesyEventStatus() when $default != null:
return $default(_that.cycleTime,_that.earlyLateMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyEventStatus implements CheesyEventStatus {
  const _CheesyEventStatus({@JsonKey(name: 'CycleTime') this.cycleTime = '', @JsonKey(name: 'EarlyLateMessage') this.earlyLateMessage = ''});
  factory _CheesyEventStatus.fromJson(Map<String, dynamic> json) => _$CheesyEventStatusFromJson(json);

@override@JsonKey(name: 'CycleTime') final  String cycleTime;
@override@JsonKey(name: 'EarlyLateMessage') final  String earlyLateMessage;

/// Create a copy of CheesyEventStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyEventStatusCopyWith<_CheesyEventStatus> get copyWith => __$CheesyEventStatusCopyWithImpl<_CheesyEventStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyEventStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyEventStatus&&(identical(other.cycleTime, cycleTime) || other.cycleTime == cycleTime)&&(identical(other.earlyLateMessage, earlyLateMessage) || other.earlyLateMessage == earlyLateMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cycleTime,earlyLateMessage);

@override
String toString() {
  return 'CheesyEventStatus(cycleTime: $cycleTime, earlyLateMessage: $earlyLateMessage)';
}


}

/// @nodoc
abstract mixin class _$CheesyEventStatusCopyWith<$Res> implements $CheesyEventStatusCopyWith<$Res> {
  factory _$CheesyEventStatusCopyWith(_CheesyEventStatus value, $Res Function(_CheesyEventStatus) _then) = __$CheesyEventStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'CycleTime') String cycleTime,@JsonKey(name: 'EarlyLateMessage') String earlyLateMessage
});




}
/// @nodoc
class __$CheesyEventStatusCopyWithImpl<$Res>
    implements _$CheesyEventStatusCopyWith<$Res> {
  __$CheesyEventStatusCopyWithImpl(this._self, this._then);

  final _CheesyEventStatus _self;
  final $Res Function(_CheesyEventStatus) _then;

/// Create a copy of CheesyEventStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cycleTime = null,Object? earlyLateMessage = null,}) {
  return _then(_CheesyEventStatus(
cycleTime: null == cycleTime ? _self.cycleTime : cycleTime // ignore: cast_nullable_to_non_nullable
as String,earlyLateMessage: null == earlyLateMessage ? _self.earlyLateMessage : earlyLateMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CheesyMatchTimeMessage {

@JsonKey(name: 'MatchState') int get matchState;@JsonKey(name: 'MatchTimeSec') int get matchTimeSec;
/// Create a copy of CheesyMatchTimeMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyMatchTimeMessageCopyWith<CheesyMatchTimeMessage> get copyWith => _$CheesyMatchTimeMessageCopyWithImpl<CheesyMatchTimeMessage>(this as CheesyMatchTimeMessage, _$identity);

  /// Serializes this CheesyMatchTimeMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyMatchTimeMessage&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.matchTimeSec, matchTimeSec) || other.matchTimeSec == matchTimeSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchState,matchTimeSec);

@override
String toString() {
  return 'CheesyMatchTimeMessage(matchState: $matchState, matchTimeSec: $matchTimeSec)';
}


}

/// @nodoc
abstract mixin class $CheesyMatchTimeMessageCopyWith<$Res>  {
  factory $CheesyMatchTimeMessageCopyWith(CheesyMatchTimeMessage value, $Res Function(CheesyMatchTimeMessage) _then) = _$CheesyMatchTimeMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'MatchTimeSec') int matchTimeSec
});




}
/// @nodoc
class _$CheesyMatchTimeMessageCopyWithImpl<$Res>
    implements $CheesyMatchTimeMessageCopyWith<$Res> {
  _$CheesyMatchTimeMessageCopyWithImpl(this._self, this._then);

  final CheesyMatchTimeMessage _self;
  final $Res Function(CheesyMatchTimeMessage) _then;

/// Create a copy of CheesyMatchTimeMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchState = null,Object? matchTimeSec = null,}) {
  return _then(_self.copyWith(
matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,matchTimeSec: null == matchTimeSec ? _self.matchTimeSec : matchTimeSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyMatchTimeMessage].
extension CheesyMatchTimeMessagePatterns on CheesyMatchTimeMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyMatchTimeMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyMatchTimeMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyMatchTimeMessage value)  $default,){
final _that = this;
switch (_that) {
case _CheesyMatchTimeMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyMatchTimeMessage value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyMatchTimeMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'MatchTimeSec')  int matchTimeSec)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyMatchTimeMessage() when $default != null:
return $default(_that.matchState,_that.matchTimeSec);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'MatchTimeSec')  int matchTimeSec)  $default,) {final _that = this;
switch (_that) {
case _CheesyMatchTimeMessage():
return $default(_that.matchState,_that.matchTimeSec);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'MatchTimeSec')  int matchTimeSec)?  $default,) {final _that = this;
switch (_that) {
case _CheesyMatchTimeMessage() when $default != null:
return $default(_that.matchState,_that.matchTimeSec);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyMatchTimeMessage implements CheesyMatchTimeMessage {
  const _CheesyMatchTimeMessage({@JsonKey(name: 'MatchState') required this.matchState, @JsonKey(name: 'MatchTimeSec') required this.matchTimeSec});
  factory _CheesyMatchTimeMessage.fromJson(Map<String, dynamic> json) => _$CheesyMatchTimeMessageFromJson(json);

@override@JsonKey(name: 'MatchState') final  int matchState;
@override@JsonKey(name: 'MatchTimeSec') final  int matchTimeSec;

/// Create a copy of CheesyMatchTimeMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyMatchTimeMessageCopyWith<_CheesyMatchTimeMessage> get copyWith => __$CheesyMatchTimeMessageCopyWithImpl<_CheesyMatchTimeMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyMatchTimeMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyMatchTimeMessage&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.matchTimeSec, matchTimeSec) || other.matchTimeSec == matchTimeSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchState,matchTimeSec);

@override
String toString() {
  return 'CheesyMatchTimeMessage(matchState: $matchState, matchTimeSec: $matchTimeSec)';
}


}

/// @nodoc
abstract mixin class _$CheesyMatchTimeMessageCopyWith<$Res> implements $CheesyMatchTimeMessageCopyWith<$Res> {
  factory _$CheesyMatchTimeMessageCopyWith(_CheesyMatchTimeMessage value, $Res Function(_CheesyMatchTimeMessage) _then) = __$CheesyMatchTimeMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'MatchTimeSec') int matchTimeSec
});




}
/// @nodoc
class __$CheesyMatchTimeMessageCopyWithImpl<$Res>
    implements _$CheesyMatchTimeMessageCopyWith<$Res> {
  __$CheesyMatchTimeMessageCopyWithImpl(this._self, this._then);

  final _CheesyMatchTimeMessage _self;
  final $Res Function(_CheesyMatchTimeMessage) _then;

/// Create a copy of CheesyMatchTimeMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchState = null,Object? matchTimeSec = null,}) {
  return _then(_CheesyMatchTimeMessage(
matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,matchTimeSec: null == matchTimeSec ? _self.matchTimeSec : matchTimeSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheesyMatchTiming {

@JsonKey(name: 'AutoDurationSec') int get autoDurationSec;@JsonKey(name: 'PauseDurationSec') int get pauseDurationSec;@JsonKey(name: 'TransitionShiftDurationSec') int get transitionShiftDurationSec;@JsonKey(name: 'ShiftDurationSec') int get shiftDurationSec;@JsonKey(name: 'EndgameDurationSec') int get endgameDurationSec;@JsonKey(name: 'WarningRemainingDurationSec') int get warningRemainingDurationSec;@JsonKey(name: 'TimeoutDurationSec') int get timeoutDurationSec;
/// Create a copy of CheesyMatchTiming
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyMatchTimingCopyWith<CheesyMatchTiming> get copyWith => _$CheesyMatchTimingCopyWithImpl<CheesyMatchTiming>(this as CheesyMatchTiming, _$identity);

  /// Serializes this CheesyMatchTiming to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyMatchTiming&&(identical(other.autoDurationSec, autoDurationSec) || other.autoDurationSec == autoDurationSec)&&(identical(other.pauseDurationSec, pauseDurationSec) || other.pauseDurationSec == pauseDurationSec)&&(identical(other.transitionShiftDurationSec, transitionShiftDurationSec) || other.transitionShiftDurationSec == transitionShiftDurationSec)&&(identical(other.shiftDurationSec, shiftDurationSec) || other.shiftDurationSec == shiftDurationSec)&&(identical(other.endgameDurationSec, endgameDurationSec) || other.endgameDurationSec == endgameDurationSec)&&(identical(other.warningRemainingDurationSec, warningRemainingDurationSec) || other.warningRemainingDurationSec == warningRemainingDurationSec)&&(identical(other.timeoutDurationSec, timeoutDurationSec) || other.timeoutDurationSec == timeoutDurationSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,autoDurationSec,pauseDurationSec,transitionShiftDurationSec,shiftDurationSec,endgameDurationSec,warningRemainingDurationSec,timeoutDurationSec);

@override
String toString() {
  return 'CheesyMatchTiming(autoDurationSec: $autoDurationSec, pauseDurationSec: $pauseDurationSec, transitionShiftDurationSec: $transitionShiftDurationSec, shiftDurationSec: $shiftDurationSec, endgameDurationSec: $endgameDurationSec, warningRemainingDurationSec: $warningRemainingDurationSec, timeoutDurationSec: $timeoutDurationSec)';
}


}

/// @nodoc
abstract mixin class $CheesyMatchTimingCopyWith<$Res>  {
  factory $CheesyMatchTimingCopyWith(CheesyMatchTiming value, $Res Function(CheesyMatchTiming) _then) = _$CheesyMatchTimingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'AutoDurationSec') int autoDurationSec,@JsonKey(name: 'PauseDurationSec') int pauseDurationSec,@JsonKey(name: 'TransitionShiftDurationSec') int transitionShiftDurationSec,@JsonKey(name: 'ShiftDurationSec') int shiftDurationSec,@JsonKey(name: 'EndgameDurationSec') int endgameDurationSec,@JsonKey(name: 'WarningRemainingDurationSec') int warningRemainingDurationSec,@JsonKey(name: 'TimeoutDurationSec') int timeoutDurationSec
});




}
/// @nodoc
class _$CheesyMatchTimingCopyWithImpl<$Res>
    implements $CheesyMatchTimingCopyWith<$Res> {
  _$CheesyMatchTimingCopyWithImpl(this._self, this._then);

  final CheesyMatchTiming _self;
  final $Res Function(CheesyMatchTiming) _then;

/// Create a copy of CheesyMatchTiming
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? autoDurationSec = null,Object? pauseDurationSec = null,Object? transitionShiftDurationSec = null,Object? shiftDurationSec = null,Object? endgameDurationSec = null,Object? warningRemainingDurationSec = null,Object? timeoutDurationSec = null,}) {
  return _then(_self.copyWith(
autoDurationSec: null == autoDurationSec ? _self.autoDurationSec : autoDurationSec // ignore: cast_nullable_to_non_nullable
as int,pauseDurationSec: null == pauseDurationSec ? _self.pauseDurationSec : pauseDurationSec // ignore: cast_nullable_to_non_nullable
as int,transitionShiftDurationSec: null == transitionShiftDurationSec ? _self.transitionShiftDurationSec : transitionShiftDurationSec // ignore: cast_nullable_to_non_nullable
as int,shiftDurationSec: null == shiftDurationSec ? _self.shiftDurationSec : shiftDurationSec // ignore: cast_nullable_to_non_nullable
as int,endgameDurationSec: null == endgameDurationSec ? _self.endgameDurationSec : endgameDurationSec // ignore: cast_nullable_to_non_nullable
as int,warningRemainingDurationSec: null == warningRemainingDurationSec ? _self.warningRemainingDurationSec : warningRemainingDurationSec // ignore: cast_nullable_to_non_nullable
as int,timeoutDurationSec: null == timeoutDurationSec ? _self.timeoutDurationSec : timeoutDurationSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyMatchTiming].
extension CheesyMatchTimingPatterns on CheesyMatchTiming {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyMatchTiming value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyMatchTiming() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyMatchTiming value)  $default,){
final _that = this;
switch (_that) {
case _CheesyMatchTiming():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyMatchTiming value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyMatchTiming() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'AutoDurationSec')  int autoDurationSec, @JsonKey(name: 'PauseDurationSec')  int pauseDurationSec, @JsonKey(name: 'TransitionShiftDurationSec')  int transitionShiftDurationSec, @JsonKey(name: 'ShiftDurationSec')  int shiftDurationSec, @JsonKey(name: 'EndgameDurationSec')  int endgameDurationSec, @JsonKey(name: 'WarningRemainingDurationSec')  int warningRemainingDurationSec, @JsonKey(name: 'TimeoutDurationSec')  int timeoutDurationSec)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyMatchTiming() when $default != null:
return $default(_that.autoDurationSec,_that.pauseDurationSec,_that.transitionShiftDurationSec,_that.shiftDurationSec,_that.endgameDurationSec,_that.warningRemainingDurationSec,_that.timeoutDurationSec);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'AutoDurationSec')  int autoDurationSec, @JsonKey(name: 'PauseDurationSec')  int pauseDurationSec, @JsonKey(name: 'TransitionShiftDurationSec')  int transitionShiftDurationSec, @JsonKey(name: 'ShiftDurationSec')  int shiftDurationSec, @JsonKey(name: 'EndgameDurationSec')  int endgameDurationSec, @JsonKey(name: 'WarningRemainingDurationSec')  int warningRemainingDurationSec, @JsonKey(name: 'TimeoutDurationSec')  int timeoutDurationSec)  $default,) {final _that = this;
switch (_that) {
case _CheesyMatchTiming():
return $default(_that.autoDurationSec,_that.pauseDurationSec,_that.transitionShiftDurationSec,_that.shiftDurationSec,_that.endgameDurationSec,_that.warningRemainingDurationSec,_that.timeoutDurationSec);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'AutoDurationSec')  int autoDurationSec, @JsonKey(name: 'PauseDurationSec')  int pauseDurationSec, @JsonKey(name: 'TransitionShiftDurationSec')  int transitionShiftDurationSec, @JsonKey(name: 'ShiftDurationSec')  int shiftDurationSec, @JsonKey(name: 'EndgameDurationSec')  int endgameDurationSec, @JsonKey(name: 'WarningRemainingDurationSec')  int warningRemainingDurationSec, @JsonKey(name: 'TimeoutDurationSec')  int timeoutDurationSec)?  $default,) {final _that = this;
switch (_that) {
case _CheesyMatchTiming() when $default != null:
return $default(_that.autoDurationSec,_that.pauseDurationSec,_that.transitionShiftDurationSec,_that.shiftDurationSec,_that.endgameDurationSec,_that.warningRemainingDurationSec,_that.timeoutDurationSec);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyMatchTiming implements CheesyMatchTiming {
  const _CheesyMatchTiming({@JsonKey(name: 'AutoDurationSec') this.autoDurationSec = 15, @JsonKey(name: 'PauseDurationSec') this.pauseDurationSec = 3, @JsonKey(name: 'TransitionShiftDurationSec') this.transitionShiftDurationSec = 10, @JsonKey(name: 'ShiftDurationSec') this.shiftDurationSec = 25, @JsonKey(name: 'EndgameDurationSec') this.endgameDurationSec = 30, @JsonKey(name: 'WarningRemainingDurationSec') this.warningRemainingDurationSec = 20, @JsonKey(name: 'TimeoutDurationSec') this.timeoutDurationSec = 0});
  factory _CheesyMatchTiming.fromJson(Map<String, dynamic> json) => _$CheesyMatchTimingFromJson(json);

@override@JsonKey(name: 'AutoDurationSec') final  int autoDurationSec;
@override@JsonKey(name: 'PauseDurationSec') final  int pauseDurationSec;
@override@JsonKey(name: 'TransitionShiftDurationSec') final  int transitionShiftDurationSec;
@override@JsonKey(name: 'ShiftDurationSec') final  int shiftDurationSec;
@override@JsonKey(name: 'EndgameDurationSec') final  int endgameDurationSec;
@override@JsonKey(name: 'WarningRemainingDurationSec') final  int warningRemainingDurationSec;
@override@JsonKey(name: 'TimeoutDurationSec') final  int timeoutDurationSec;

/// Create a copy of CheesyMatchTiming
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyMatchTimingCopyWith<_CheesyMatchTiming> get copyWith => __$CheesyMatchTimingCopyWithImpl<_CheesyMatchTiming>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyMatchTimingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyMatchTiming&&(identical(other.autoDurationSec, autoDurationSec) || other.autoDurationSec == autoDurationSec)&&(identical(other.pauseDurationSec, pauseDurationSec) || other.pauseDurationSec == pauseDurationSec)&&(identical(other.transitionShiftDurationSec, transitionShiftDurationSec) || other.transitionShiftDurationSec == transitionShiftDurationSec)&&(identical(other.shiftDurationSec, shiftDurationSec) || other.shiftDurationSec == shiftDurationSec)&&(identical(other.endgameDurationSec, endgameDurationSec) || other.endgameDurationSec == endgameDurationSec)&&(identical(other.warningRemainingDurationSec, warningRemainingDurationSec) || other.warningRemainingDurationSec == warningRemainingDurationSec)&&(identical(other.timeoutDurationSec, timeoutDurationSec) || other.timeoutDurationSec == timeoutDurationSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,autoDurationSec,pauseDurationSec,transitionShiftDurationSec,shiftDurationSec,endgameDurationSec,warningRemainingDurationSec,timeoutDurationSec);

@override
String toString() {
  return 'CheesyMatchTiming(autoDurationSec: $autoDurationSec, pauseDurationSec: $pauseDurationSec, transitionShiftDurationSec: $transitionShiftDurationSec, shiftDurationSec: $shiftDurationSec, endgameDurationSec: $endgameDurationSec, warningRemainingDurationSec: $warningRemainingDurationSec, timeoutDurationSec: $timeoutDurationSec)';
}


}

/// @nodoc
abstract mixin class _$CheesyMatchTimingCopyWith<$Res> implements $CheesyMatchTimingCopyWith<$Res> {
  factory _$CheesyMatchTimingCopyWith(_CheesyMatchTiming value, $Res Function(_CheesyMatchTiming) _then) = __$CheesyMatchTimingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'AutoDurationSec') int autoDurationSec,@JsonKey(name: 'PauseDurationSec') int pauseDurationSec,@JsonKey(name: 'TransitionShiftDurationSec') int transitionShiftDurationSec,@JsonKey(name: 'ShiftDurationSec') int shiftDurationSec,@JsonKey(name: 'EndgameDurationSec') int endgameDurationSec,@JsonKey(name: 'WarningRemainingDurationSec') int warningRemainingDurationSec,@JsonKey(name: 'TimeoutDurationSec') int timeoutDurationSec
});




}
/// @nodoc
class __$CheesyMatchTimingCopyWithImpl<$Res>
    implements _$CheesyMatchTimingCopyWith<$Res> {
  __$CheesyMatchTimingCopyWithImpl(this._self, this._then);

  final _CheesyMatchTiming _self;
  final $Res Function(_CheesyMatchTiming) _then;

/// Create a copy of CheesyMatchTiming
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? autoDurationSec = null,Object? pauseDurationSec = null,Object? transitionShiftDurationSec = null,Object? shiftDurationSec = null,Object? endgameDurationSec = null,Object? warningRemainingDurationSec = null,Object? timeoutDurationSec = null,}) {
  return _then(_CheesyMatchTiming(
autoDurationSec: null == autoDurationSec ? _self.autoDurationSec : autoDurationSec // ignore: cast_nullable_to_non_nullable
as int,pauseDurationSec: null == pauseDurationSec ? _self.pauseDurationSec : pauseDurationSec // ignore: cast_nullable_to_non_nullable
as int,transitionShiftDurationSec: null == transitionShiftDurationSec ? _self.transitionShiftDurationSec : transitionShiftDurationSec // ignore: cast_nullable_to_non_nullable
as int,shiftDurationSec: null == shiftDurationSec ? _self.shiftDurationSec : shiftDurationSec // ignore: cast_nullable_to_non_nullable
as int,endgameDurationSec: null == endgameDurationSec ? _self.endgameDurationSec : endgameDurationSec // ignore: cast_nullable_to_non_nullable
as int,warningRemainingDurationSec: null == warningRemainingDurationSec ? _self.warningRemainingDurationSec : warningRemainingDurationSec // ignore: cast_nullable_to_non_nullable
as int,timeoutDurationSec: null == timeoutDurationSec ? _self.timeoutDurationSec : timeoutDurationSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheesyMatchLoad {

@JsonKey(name: 'Match') CheesyMatch get match;@JsonKey(name: 'AllowSubstitution') bool get allowSubstitution;@JsonKey(name: 'IsReplay') bool get isReplay;@JsonKey(name: 'Teams') Map<String, CheesyTeam?> get teams;@JsonKey(name: 'Rankings') Map<String, int> get rankings;@JsonKey(name: 'BreakDescription') String get breakDescription;@JsonKey(name: 'Matchup') dynamic get matchup;
/// Create a copy of CheesyMatchLoad
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyMatchLoadCopyWith<CheesyMatchLoad> get copyWith => _$CheesyMatchLoadCopyWithImpl<CheesyMatchLoad>(this as CheesyMatchLoad, _$identity);

  /// Serializes this CheesyMatchLoad to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyMatchLoad&&(identical(other.match, match) || other.match == match)&&(identical(other.allowSubstitution, allowSubstitution) || other.allowSubstitution == allowSubstitution)&&(identical(other.isReplay, isReplay) || other.isReplay == isReplay)&&const DeepCollectionEquality().equals(other.teams, teams)&&const DeepCollectionEquality().equals(other.rankings, rankings)&&(identical(other.breakDescription, breakDescription) || other.breakDescription == breakDescription)&&const DeepCollectionEquality().equals(other.matchup, matchup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,match,allowSubstitution,isReplay,const DeepCollectionEquality().hash(teams),const DeepCollectionEquality().hash(rankings),breakDescription,const DeepCollectionEquality().hash(matchup));

@override
String toString() {
  return 'CheesyMatchLoad(match: $match, allowSubstitution: $allowSubstitution, isReplay: $isReplay, teams: $teams, rankings: $rankings, breakDescription: $breakDescription, matchup: $matchup)';
}


}

/// @nodoc
abstract mixin class $CheesyMatchLoadCopyWith<$Res>  {
  factory $CheesyMatchLoadCopyWith(CheesyMatchLoad value, $Res Function(CheesyMatchLoad) _then) = _$CheesyMatchLoadCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Match') CheesyMatch match,@JsonKey(name: 'AllowSubstitution') bool allowSubstitution,@JsonKey(name: 'IsReplay') bool isReplay,@JsonKey(name: 'Teams') Map<String, CheesyTeam?> teams,@JsonKey(name: 'Rankings') Map<String, int> rankings,@JsonKey(name: 'BreakDescription') String breakDescription,@JsonKey(name: 'Matchup') dynamic matchup
});


$CheesyMatchCopyWith<$Res> get match;

}
/// @nodoc
class _$CheesyMatchLoadCopyWithImpl<$Res>
    implements $CheesyMatchLoadCopyWith<$Res> {
  _$CheesyMatchLoadCopyWithImpl(this._self, this._then);

  final CheesyMatchLoad _self;
  final $Res Function(CheesyMatchLoad) _then;

/// Create a copy of CheesyMatchLoad
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? match = null,Object? allowSubstitution = null,Object? isReplay = null,Object? teams = null,Object? rankings = null,Object? breakDescription = null,Object? matchup = freezed,}) {
  return _then(_self.copyWith(
match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as CheesyMatch,allowSubstitution: null == allowSubstitution ? _self.allowSubstitution : allowSubstitution // ignore: cast_nullable_to_non_nullable
as bool,isReplay: null == isReplay ? _self.isReplay : isReplay // ignore: cast_nullable_to_non_nullable
as bool,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyTeam?>,rankings: null == rankings ? _self.rankings : rankings // ignore: cast_nullable_to_non_nullable
as Map<String, int>,breakDescription: null == breakDescription ? _self.breakDescription : breakDescription // ignore: cast_nullable_to_non_nullable
as String,matchup: freezed == matchup ? _self.matchup : matchup // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of CheesyMatchLoad
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyMatchCopyWith<$Res> get match {
  
  return $CheesyMatchCopyWith<$Res>(_self.match, (value) {
    return _then(_self.copyWith(match: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheesyMatchLoad].
extension CheesyMatchLoadPatterns on CheesyMatchLoad {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyMatchLoad value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyMatchLoad() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyMatchLoad value)  $default,){
final _that = this;
switch (_that) {
case _CheesyMatchLoad():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyMatchLoad value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyMatchLoad() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Match')  CheesyMatch match, @JsonKey(name: 'AllowSubstitution')  bool allowSubstitution, @JsonKey(name: 'IsReplay')  bool isReplay, @JsonKey(name: 'Teams')  Map<String, CheesyTeam?> teams, @JsonKey(name: 'Rankings')  Map<String, int> rankings, @JsonKey(name: 'BreakDescription')  String breakDescription, @JsonKey(name: 'Matchup')  dynamic matchup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyMatchLoad() when $default != null:
return $default(_that.match,_that.allowSubstitution,_that.isReplay,_that.teams,_that.rankings,_that.breakDescription,_that.matchup);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Match')  CheesyMatch match, @JsonKey(name: 'AllowSubstitution')  bool allowSubstitution, @JsonKey(name: 'IsReplay')  bool isReplay, @JsonKey(name: 'Teams')  Map<String, CheesyTeam?> teams, @JsonKey(name: 'Rankings')  Map<String, int> rankings, @JsonKey(name: 'BreakDescription')  String breakDescription, @JsonKey(name: 'Matchup')  dynamic matchup)  $default,) {final _that = this;
switch (_that) {
case _CheesyMatchLoad():
return $default(_that.match,_that.allowSubstitution,_that.isReplay,_that.teams,_that.rankings,_that.breakDescription,_that.matchup);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Match')  CheesyMatch match, @JsonKey(name: 'AllowSubstitution')  bool allowSubstitution, @JsonKey(name: 'IsReplay')  bool isReplay, @JsonKey(name: 'Teams')  Map<String, CheesyTeam?> teams, @JsonKey(name: 'Rankings')  Map<String, int> rankings, @JsonKey(name: 'BreakDescription')  String breakDescription, @JsonKey(name: 'Matchup')  dynamic matchup)?  $default,) {final _that = this;
switch (_that) {
case _CheesyMatchLoad() when $default != null:
return $default(_that.match,_that.allowSubstitution,_that.isReplay,_that.teams,_that.rankings,_that.breakDescription,_that.matchup);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyMatchLoad implements CheesyMatchLoad {
  const _CheesyMatchLoad({@JsonKey(name: 'Match') required this.match, @JsonKey(name: 'AllowSubstitution') this.allowSubstitution = false, @JsonKey(name: 'IsReplay') this.isReplay = false, @JsonKey(name: 'Teams') required final  Map<String, CheesyTeam?> teams, @JsonKey(name: 'Rankings') final  Map<String, int> rankings = const {}, @JsonKey(name: 'BreakDescription') this.breakDescription = '', @JsonKey(name: 'Matchup') this.matchup}): _teams = teams,_rankings = rankings;
  factory _CheesyMatchLoad.fromJson(Map<String, dynamic> json) => _$CheesyMatchLoadFromJson(json);

@override@JsonKey(name: 'Match') final  CheesyMatch match;
@override@JsonKey(name: 'AllowSubstitution') final  bool allowSubstitution;
@override@JsonKey(name: 'IsReplay') final  bool isReplay;
 final  Map<String, CheesyTeam?> _teams;
@override@JsonKey(name: 'Teams') Map<String, CheesyTeam?> get teams {
  if (_teams is EqualUnmodifiableMapView) return _teams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_teams);
}

 final  Map<String, int> _rankings;
@override@JsonKey(name: 'Rankings') Map<String, int> get rankings {
  if (_rankings is EqualUnmodifiableMapView) return _rankings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rankings);
}

@override@JsonKey(name: 'BreakDescription') final  String breakDescription;
@override@JsonKey(name: 'Matchup') final  dynamic matchup;

/// Create a copy of CheesyMatchLoad
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyMatchLoadCopyWith<_CheesyMatchLoad> get copyWith => __$CheesyMatchLoadCopyWithImpl<_CheesyMatchLoad>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyMatchLoadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyMatchLoad&&(identical(other.match, match) || other.match == match)&&(identical(other.allowSubstitution, allowSubstitution) || other.allowSubstitution == allowSubstitution)&&(identical(other.isReplay, isReplay) || other.isReplay == isReplay)&&const DeepCollectionEquality().equals(other._teams, _teams)&&const DeepCollectionEquality().equals(other._rankings, _rankings)&&(identical(other.breakDescription, breakDescription) || other.breakDescription == breakDescription)&&const DeepCollectionEquality().equals(other.matchup, matchup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,match,allowSubstitution,isReplay,const DeepCollectionEquality().hash(_teams),const DeepCollectionEquality().hash(_rankings),breakDescription,const DeepCollectionEquality().hash(matchup));

@override
String toString() {
  return 'CheesyMatchLoad(match: $match, allowSubstitution: $allowSubstitution, isReplay: $isReplay, teams: $teams, rankings: $rankings, breakDescription: $breakDescription, matchup: $matchup)';
}


}

/// @nodoc
abstract mixin class _$CheesyMatchLoadCopyWith<$Res> implements $CheesyMatchLoadCopyWith<$Res> {
  factory _$CheesyMatchLoadCopyWith(_CheesyMatchLoad value, $Res Function(_CheesyMatchLoad) _then) = __$CheesyMatchLoadCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Match') CheesyMatch match,@JsonKey(name: 'AllowSubstitution') bool allowSubstitution,@JsonKey(name: 'IsReplay') bool isReplay,@JsonKey(name: 'Teams') Map<String, CheesyTeam?> teams,@JsonKey(name: 'Rankings') Map<String, int> rankings,@JsonKey(name: 'BreakDescription') String breakDescription,@JsonKey(name: 'Matchup') dynamic matchup
});


@override $CheesyMatchCopyWith<$Res> get match;

}
/// @nodoc
class __$CheesyMatchLoadCopyWithImpl<$Res>
    implements _$CheesyMatchLoadCopyWith<$Res> {
  __$CheesyMatchLoadCopyWithImpl(this._self, this._then);

  final _CheesyMatchLoad _self;
  final $Res Function(_CheesyMatchLoad) _then;

/// Create a copy of CheesyMatchLoad
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? match = null,Object? allowSubstitution = null,Object? isReplay = null,Object? teams = null,Object? rankings = null,Object? breakDescription = null,Object? matchup = freezed,}) {
  return _then(_CheesyMatchLoad(
match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as CheesyMatch,allowSubstitution: null == allowSubstitution ? _self.allowSubstitution : allowSubstitution // ignore: cast_nullable_to_non_nullable
as bool,isReplay: null == isReplay ? _self.isReplay : isReplay // ignore: cast_nullable_to_non_nullable
as bool,teams: null == teams ? _self._teams : teams // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyTeam?>,rankings: null == rankings ? _self._rankings : rankings // ignore: cast_nullable_to_non_nullable
as Map<String, int>,breakDescription: null == breakDescription ? _self.breakDescription : breakDescription // ignore: cast_nullable_to_non_nullable
as String,matchup: freezed == matchup ? _self.matchup : matchup // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of CheesyMatchLoad
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyMatchCopyWith<$Res> get match {
  
  return $CheesyMatchCopyWith<$Res>(_self.match, (value) {
    return _then(_self.copyWith(match: value));
  });
}
}


/// @nodoc
mixin _$CheesyMatch {

@JsonKey(name: 'Id') int get id;@JsonKey(name: 'Type') int get type;@JsonKey(name: 'TypeOrder') int get typeOrder;@JsonKey(name: 'LongName') String get longName;@JsonKey(name: 'ShortName') String get shortName;@JsonKey(name: 'NameDetail') String get nameDetail;@JsonKey(name: 'PlayoffMatchGroupId') String get playoffMatchGroupId;@JsonKey(name: 'PlayoffRedAlliance') int get playoffRedAlliance;@JsonKey(name: 'PlayoffBlueAlliance') int get playoffBlueAlliance;@JsonKey(name: 'Red1') int get red1;@JsonKey(name: 'Red1IsSurrogate') bool get red1IsSurrogate;@JsonKey(name: 'Red2') int get red2;@JsonKey(name: 'Red2IsSurrogate') bool get red2IsSurrogate;@JsonKey(name: 'Red3') int get red3;@JsonKey(name: 'Red3IsSurrogate') bool get red3IsSurrogate;@JsonKey(name: 'Blue1') int get blue1;@JsonKey(name: 'Blue1IsSurrogate') bool get blue1IsSurrogate;@JsonKey(name: 'Blue2') int get blue2;@JsonKey(name: 'Blue2IsSurrogate') bool get blue2IsSurrogate;@JsonKey(name: 'Blue3') int get blue3;@JsonKey(name: 'Blue3IsSurrogate') bool get blue3IsSurrogate;@JsonKey(name: 'Status') int get status;@JsonKey(name: 'ScheduledStartTime') DateTime? get scheduledStartTime;
/// Create a copy of CheesyMatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyMatchCopyWith<CheesyMatch> get copyWith => _$CheesyMatchCopyWithImpl<CheesyMatch>(this as CheesyMatch, _$identity);

  /// Serializes this CheesyMatch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyMatch&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeOrder, typeOrder) || other.typeOrder == typeOrder)&&(identical(other.longName, longName) || other.longName == longName)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.nameDetail, nameDetail) || other.nameDetail == nameDetail)&&(identical(other.playoffMatchGroupId, playoffMatchGroupId) || other.playoffMatchGroupId == playoffMatchGroupId)&&(identical(other.playoffRedAlliance, playoffRedAlliance) || other.playoffRedAlliance == playoffRedAlliance)&&(identical(other.playoffBlueAlliance, playoffBlueAlliance) || other.playoffBlueAlliance == playoffBlueAlliance)&&(identical(other.red1, red1) || other.red1 == red1)&&(identical(other.red1IsSurrogate, red1IsSurrogate) || other.red1IsSurrogate == red1IsSurrogate)&&(identical(other.red2, red2) || other.red2 == red2)&&(identical(other.red2IsSurrogate, red2IsSurrogate) || other.red2IsSurrogate == red2IsSurrogate)&&(identical(other.red3, red3) || other.red3 == red3)&&(identical(other.red3IsSurrogate, red3IsSurrogate) || other.red3IsSurrogate == red3IsSurrogate)&&(identical(other.blue1, blue1) || other.blue1 == blue1)&&(identical(other.blue1IsSurrogate, blue1IsSurrogate) || other.blue1IsSurrogate == blue1IsSurrogate)&&(identical(other.blue2, blue2) || other.blue2 == blue2)&&(identical(other.blue2IsSurrogate, blue2IsSurrogate) || other.blue2IsSurrogate == blue2IsSurrogate)&&(identical(other.blue3, blue3) || other.blue3 == blue3)&&(identical(other.blue3IsSurrogate, blue3IsSurrogate) || other.blue3IsSurrogate == blue3IsSurrogate)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledStartTime, scheduledStartTime) || other.scheduledStartTime == scheduledStartTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,type,typeOrder,longName,shortName,nameDetail,playoffMatchGroupId,playoffRedAlliance,playoffBlueAlliance,red1,red1IsSurrogate,red2,red2IsSurrogate,red3,red3IsSurrogate,blue1,blue1IsSurrogate,blue2,blue2IsSurrogate,blue3,blue3IsSurrogate,status,scheduledStartTime]);

@override
String toString() {
  return 'CheesyMatch(id: $id, type: $type, typeOrder: $typeOrder, longName: $longName, shortName: $shortName, nameDetail: $nameDetail, playoffMatchGroupId: $playoffMatchGroupId, playoffRedAlliance: $playoffRedAlliance, playoffBlueAlliance: $playoffBlueAlliance, red1: $red1, red1IsSurrogate: $red1IsSurrogate, red2: $red2, red2IsSurrogate: $red2IsSurrogate, red3: $red3, red3IsSurrogate: $red3IsSurrogate, blue1: $blue1, blue1IsSurrogate: $blue1IsSurrogate, blue2: $blue2, blue2IsSurrogate: $blue2IsSurrogate, blue3: $blue3, blue3IsSurrogate: $blue3IsSurrogate, status: $status, scheduledStartTime: $scheduledStartTime)';
}


}

/// @nodoc
abstract mixin class $CheesyMatchCopyWith<$Res>  {
  factory $CheesyMatchCopyWith(CheesyMatch value, $Res Function(CheesyMatch) _then) = _$CheesyMatchCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Type') int type,@JsonKey(name: 'TypeOrder') int typeOrder,@JsonKey(name: 'LongName') String longName,@JsonKey(name: 'ShortName') String shortName,@JsonKey(name: 'NameDetail') String nameDetail,@JsonKey(name: 'PlayoffMatchGroupId') String playoffMatchGroupId,@JsonKey(name: 'PlayoffRedAlliance') int playoffRedAlliance,@JsonKey(name: 'PlayoffBlueAlliance') int playoffBlueAlliance,@JsonKey(name: 'Red1') int red1,@JsonKey(name: 'Red1IsSurrogate') bool red1IsSurrogate,@JsonKey(name: 'Red2') int red2,@JsonKey(name: 'Red2IsSurrogate') bool red2IsSurrogate,@JsonKey(name: 'Red3') int red3,@JsonKey(name: 'Red3IsSurrogate') bool red3IsSurrogate,@JsonKey(name: 'Blue1') int blue1,@JsonKey(name: 'Blue1IsSurrogate') bool blue1IsSurrogate,@JsonKey(name: 'Blue2') int blue2,@JsonKey(name: 'Blue2IsSurrogate') bool blue2IsSurrogate,@JsonKey(name: 'Blue3') int blue3,@JsonKey(name: 'Blue3IsSurrogate') bool blue3IsSurrogate,@JsonKey(name: 'Status') int status,@JsonKey(name: 'ScheduledStartTime') DateTime? scheduledStartTime
});




}
/// @nodoc
class _$CheesyMatchCopyWithImpl<$Res>
    implements $CheesyMatchCopyWith<$Res> {
  _$CheesyMatchCopyWithImpl(this._self, this._then);

  final CheesyMatch _self;
  final $Res Function(CheesyMatch) _then;

/// Create a copy of CheesyMatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? typeOrder = null,Object? longName = null,Object? shortName = null,Object? nameDetail = null,Object? playoffMatchGroupId = null,Object? playoffRedAlliance = null,Object? playoffBlueAlliance = null,Object? red1 = null,Object? red1IsSurrogate = null,Object? red2 = null,Object? red2IsSurrogate = null,Object? red3 = null,Object? red3IsSurrogate = null,Object? blue1 = null,Object? blue1IsSurrogate = null,Object? blue2 = null,Object? blue2IsSurrogate = null,Object? blue3 = null,Object? blue3IsSurrogate = null,Object? status = null,Object? scheduledStartTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,typeOrder: null == typeOrder ? _self.typeOrder : typeOrder // ignore: cast_nullable_to_non_nullable
as int,longName: null == longName ? _self.longName : longName // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,nameDetail: null == nameDetail ? _self.nameDetail : nameDetail // ignore: cast_nullable_to_non_nullable
as String,playoffMatchGroupId: null == playoffMatchGroupId ? _self.playoffMatchGroupId : playoffMatchGroupId // ignore: cast_nullable_to_non_nullable
as String,playoffRedAlliance: null == playoffRedAlliance ? _self.playoffRedAlliance : playoffRedAlliance // ignore: cast_nullable_to_non_nullable
as int,playoffBlueAlliance: null == playoffBlueAlliance ? _self.playoffBlueAlliance : playoffBlueAlliance // ignore: cast_nullable_to_non_nullable
as int,red1: null == red1 ? _self.red1 : red1 // ignore: cast_nullable_to_non_nullable
as int,red1IsSurrogate: null == red1IsSurrogate ? _self.red1IsSurrogate : red1IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,red2: null == red2 ? _self.red2 : red2 // ignore: cast_nullable_to_non_nullable
as int,red2IsSurrogate: null == red2IsSurrogate ? _self.red2IsSurrogate : red2IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,red3: null == red3 ? _self.red3 : red3 // ignore: cast_nullable_to_non_nullable
as int,red3IsSurrogate: null == red3IsSurrogate ? _self.red3IsSurrogate : red3IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,blue1: null == blue1 ? _self.blue1 : blue1 // ignore: cast_nullable_to_non_nullable
as int,blue1IsSurrogate: null == blue1IsSurrogate ? _self.blue1IsSurrogate : blue1IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,blue2: null == blue2 ? _self.blue2 : blue2 // ignore: cast_nullable_to_non_nullable
as int,blue2IsSurrogate: null == blue2IsSurrogate ? _self.blue2IsSurrogate : blue2IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,blue3: null == blue3 ? _self.blue3 : blue3 // ignore: cast_nullable_to_non_nullable
as int,blue3IsSurrogate: null == blue3IsSurrogate ? _self.blue3IsSurrogate : blue3IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,scheduledStartTime: freezed == scheduledStartTime ? _self.scheduledStartTime : scheduledStartTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyMatch].
extension CheesyMatchPatterns on CheesyMatch {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyMatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyMatch() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyMatch value)  $default,){
final _that = this;
switch (_that) {
case _CheesyMatch():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyMatch value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyMatch() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Type')  int type, @JsonKey(name: 'TypeOrder')  int typeOrder, @JsonKey(name: 'LongName')  String longName, @JsonKey(name: 'ShortName')  String shortName, @JsonKey(name: 'NameDetail')  String nameDetail, @JsonKey(name: 'PlayoffMatchGroupId')  String playoffMatchGroupId, @JsonKey(name: 'PlayoffRedAlliance')  int playoffRedAlliance, @JsonKey(name: 'PlayoffBlueAlliance')  int playoffBlueAlliance, @JsonKey(name: 'Red1')  int red1, @JsonKey(name: 'Red1IsSurrogate')  bool red1IsSurrogate, @JsonKey(name: 'Red2')  int red2, @JsonKey(name: 'Red2IsSurrogate')  bool red2IsSurrogate, @JsonKey(name: 'Red3')  int red3, @JsonKey(name: 'Red3IsSurrogate')  bool red3IsSurrogate, @JsonKey(name: 'Blue1')  int blue1, @JsonKey(name: 'Blue1IsSurrogate')  bool blue1IsSurrogate, @JsonKey(name: 'Blue2')  int blue2, @JsonKey(name: 'Blue2IsSurrogate')  bool blue2IsSurrogate, @JsonKey(name: 'Blue3')  int blue3, @JsonKey(name: 'Blue3IsSurrogate')  bool blue3IsSurrogate, @JsonKey(name: 'Status')  int status, @JsonKey(name: 'ScheduledStartTime')  DateTime? scheduledStartTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyMatch() when $default != null:
return $default(_that.id,_that.type,_that.typeOrder,_that.longName,_that.shortName,_that.nameDetail,_that.playoffMatchGroupId,_that.playoffRedAlliance,_that.playoffBlueAlliance,_that.red1,_that.red1IsSurrogate,_that.red2,_that.red2IsSurrogate,_that.red3,_that.red3IsSurrogate,_that.blue1,_that.blue1IsSurrogate,_that.blue2,_that.blue2IsSurrogate,_that.blue3,_that.blue3IsSurrogate,_that.status,_that.scheduledStartTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Type')  int type, @JsonKey(name: 'TypeOrder')  int typeOrder, @JsonKey(name: 'LongName')  String longName, @JsonKey(name: 'ShortName')  String shortName, @JsonKey(name: 'NameDetail')  String nameDetail, @JsonKey(name: 'PlayoffMatchGroupId')  String playoffMatchGroupId, @JsonKey(name: 'PlayoffRedAlliance')  int playoffRedAlliance, @JsonKey(name: 'PlayoffBlueAlliance')  int playoffBlueAlliance, @JsonKey(name: 'Red1')  int red1, @JsonKey(name: 'Red1IsSurrogate')  bool red1IsSurrogate, @JsonKey(name: 'Red2')  int red2, @JsonKey(name: 'Red2IsSurrogate')  bool red2IsSurrogate, @JsonKey(name: 'Red3')  int red3, @JsonKey(name: 'Red3IsSurrogate')  bool red3IsSurrogate, @JsonKey(name: 'Blue1')  int blue1, @JsonKey(name: 'Blue1IsSurrogate')  bool blue1IsSurrogate, @JsonKey(name: 'Blue2')  int blue2, @JsonKey(name: 'Blue2IsSurrogate')  bool blue2IsSurrogate, @JsonKey(name: 'Blue3')  int blue3, @JsonKey(name: 'Blue3IsSurrogate')  bool blue3IsSurrogate, @JsonKey(name: 'Status')  int status, @JsonKey(name: 'ScheduledStartTime')  DateTime? scheduledStartTime)  $default,) {final _that = this;
switch (_that) {
case _CheesyMatch():
return $default(_that.id,_that.type,_that.typeOrder,_that.longName,_that.shortName,_that.nameDetail,_that.playoffMatchGroupId,_that.playoffRedAlliance,_that.playoffBlueAlliance,_that.red1,_that.red1IsSurrogate,_that.red2,_that.red2IsSurrogate,_that.red3,_that.red3IsSurrogate,_that.blue1,_that.blue1IsSurrogate,_that.blue2,_that.blue2IsSurrogate,_that.blue3,_that.blue3IsSurrogate,_that.status,_that.scheduledStartTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Type')  int type, @JsonKey(name: 'TypeOrder')  int typeOrder, @JsonKey(name: 'LongName')  String longName, @JsonKey(name: 'ShortName')  String shortName, @JsonKey(name: 'NameDetail')  String nameDetail, @JsonKey(name: 'PlayoffMatchGroupId')  String playoffMatchGroupId, @JsonKey(name: 'PlayoffRedAlliance')  int playoffRedAlliance, @JsonKey(name: 'PlayoffBlueAlliance')  int playoffBlueAlliance, @JsonKey(name: 'Red1')  int red1, @JsonKey(name: 'Red1IsSurrogate')  bool red1IsSurrogate, @JsonKey(name: 'Red2')  int red2, @JsonKey(name: 'Red2IsSurrogate')  bool red2IsSurrogate, @JsonKey(name: 'Red3')  int red3, @JsonKey(name: 'Red3IsSurrogate')  bool red3IsSurrogate, @JsonKey(name: 'Blue1')  int blue1, @JsonKey(name: 'Blue1IsSurrogate')  bool blue1IsSurrogate, @JsonKey(name: 'Blue2')  int blue2, @JsonKey(name: 'Blue2IsSurrogate')  bool blue2IsSurrogate, @JsonKey(name: 'Blue3')  int blue3, @JsonKey(name: 'Blue3IsSurrogate')  bool blue3IsSurrogate, @JsonKey(name: 'Status')  int status, @JsonKey(name: 'ScheduledStartTime')  DateTime? scheduledStartTime)?  $default,) {final _that = this;
switch (_that) {
case _CheesyMatch() when $default != null:
return $default(_that.id,_that.type,_that.typeOrder,_that.longName,_that.shortName,_that.nameDetail,_that.playoffMatchGroupId,_that.playoffRedAlliance,_that.playoffBlueAlliance,_that.red1,_that.red1IsSurrogate,_that.red2,_that.red2IsSurrogate,_that.red3,_that.red3IsSurrogate,_that.blue1,_that.blue1IsSurrogate,_that.blue2,_that.blue2IsSurrogate,_that.blue3,_that.blue3IsSurrogate,_that.status,_that.scheduledStartTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyMatch implements CheesyMatch {
  const _CheesyMatch({@JsonKey(name: 'Id') required this.id, @JsonKey(name: 'Type') required this.type, @JsonKey(name: 'TypeOrder') this.typeOrder = 0, @JsonKey(name: 'LongName') this.longName = '', @JsonKey(name: 'ShortName') this.shortName = '', @JsonKey(name: 'NameDetail') this.nameDetail = '', @JsonKey(name: 'PlayoffMatchGroupId') this.playoffMatchGroupId = '', @JsonKey(name: 'PlayoffRedAlliance') this.playoffRedAlliance = 0, @JsonKey(name: 'PlayoffBlueAlliance') this.playoffBlueAlliance = 0, @JsonKey(name: 'Red1') this.red1 = 0, @JsonKey(name: 'Red1IsSurrogate') this.red1IsSurrogate = false, @JsonKey(name: 'Red2') this.red2 = 0, @JsonKey(name: 'Red2IsSurrogate') this.red2IsSurrogate = false, @JsonKey(name: 'Red3') this.red3 = 0, @JsonKey(name: 'Red3IsSurrogate') this.red3IsSurrogate = false, @JsonKey(name: 'Blue1') this.blue1 = 0, @JsonKey(name: 'Blue1IsSurrogate') this.blue1IsSurrogate = false, @JsonKey(name: 'Blue2') this.blue2 = 0, @JsonKey(name: 'Blue2IsSurrogate') this.blue2IsSurrogate = false, @JsonKey(name: 'Blue3') this.blue3 = 0, @JsonKey(name: 'Blue3IsSurrogate') this.blue3IsSurrogate = false, @JsonKey(name: 'Status') this.status = 0, @JsonKey(name: 'ScheduledStartTime') this.scheduledStartTime});
  factory _CheesyMatch.fromJson(Map<String, dynamic> json) => _$CheesyMatchFromJson(json);

@override@JsonKey(name: 'Id') final  int id;
@override@JsonKey(name: 'Type') final  int type;
@override@JsonKey(name: 'TypeOrder') final  int typeOrder;
@override@JsonKey(name: 'LongName') final  String longName;
@override@JsonKey(name: 'ShortName') final  String shortName;
@override@JsonKey(name: 'NameDetail') final  String nameDetail;
@override@JsonKey(name: 'PlayoffMatchGroupId') final  String playoffMatchGroupId;
@override@JsonKey(name: 'PlayoffRedAlliance') final  int playoffRedAlliance;
@override@JsonKey(name: 'PlayoffBlueAlliance') final  int playoffBlueAlliance;
@override@JsonKey(name: 'Red1') final  int red1;
@override@JsonKey(name: 'Red1IsSurrogate') final  bool red1IsSurrogate;
@override@JsonKey(name: 'Red2') final  int red2;
@override@JsonKey(name: 'Red2IsSurrogate') final  bool red2IsSurrogate;
@override@JsonKey(name: 'Red3') final  int red3;
@override@JsonKey(name: 'Red3IsSurrogate') final  bool red3IsSurrogate;
@override@JsonKey(name: 'Blue1') final  int blue1;
@override@JsonKey(name: 'Blue1IsSurrogate') final  bool blue1IsSurrogate;
@override@JsonKey(name: 'Blue2') final  int blue2;
@override@JsonKey(name: 'Blue2IsSurrogate') final  bool blue2IsSurrogate;
@override@JsonKey(name: 'Blue3') final  int blue3;
@override@JsonKey(name: 'Blue3IsSurrogate') final  bool blue3IsSurrogate;
@override@JsonKey(name: 'Status') final  int status;
@override@JsonKey(name: 'ScheduledStartTime') final  DateTime? scheduledStartTime;

/// Create a copy of CheesyMatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyMatchCopyWith<_CheesyMatch> get copyWith => __$CheesyMatchCopyWithImpl<_CheesyMatch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyMatchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyMatch&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeOrder, typeOrder) || other.typeOrder == typeOrder)&&(identical(other.longName, longName) || other.longName == longName)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.nameDetail, nameDetail) || other.nameDetail == nameDetail)&&(identical(other.playoffMatchGroupId, playoffMatchGroupId) || other.playoffMatchGroupId == playoffMatchGroupId)&&(identical(other.playoffRedAlliance, playoffRedAlliance) || other.playoffRedAlliance == playoffRedAlliance)&&(identical(other.playoffBlueAlliance, playoffBlueAlliance) || other.playoffBlueAlliance == playoffBlueAlliance)&&(identical(other.red1, red1) || other.red1 == red1)&&(identical(other.red1IsSurrogate, red1IsSurrogate) || other.red1IsSurrogate == red1IsSurrogate)&&(identical(other.red2, red2) || other.red2 == red2)&&(identical(other.red2IsSurrogate, red2IsSurrogate) || other.red2IsSurrogate == red2IsSurrogate)&&(identical(other.red3, red3) || other.red3 == red3)&&(identical(other.red3IsSurrogate, red3IsSurrogate) || other.red3IsSurrogate == red3IsSurrogate)&&(identical(other.blue1, blue1) || other.blue1 == blue1)&&(identical(other.blue1IsSurrogate, blue1IsSurrogate) || other.blue1IsSurrogate == blue1IsSurrogate)&&(identical(other.blue2, blue2) || other.blue2 == blue2)&&(identical(other.blue2IsSurrogate, blue2IsSurrogate) || other.blue2IsSurrogate == blue2IsSurrogate)&&(identical(other.blue3, blue3) || other.blue3 == blue3)&&(identical(other.blue3IsSurrogate, blue3IsSurrogate) || other.blue3IsSurrogate == blue3IsSurrogate)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledStartTime, scheduledStartTime) || other.scheduledStartTime == scheduledStartTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,type,typeOrder,longName,shortName,nameDetail,playoffMatchGroupId,playoffRedAlliance,playoffBlueAlliance,red1,red1IsSurrogate,red2,red2IsSurrogate,red3,red3IsSurrogate,blue1,blue1IsSurrogate,blue2,blue2IsSurrogate,blue3,blue3IsSurrogate,status,scheduledStartTime]);

@override
String toString() {
  return 'CheesyMatch(id: $id, type: $type, typeOrder: $typeOrder, longName: $longName, shortName: $shortName, nameDetail: $nameDetail, playoffMatchGroupId: $playoffMatchGroupId, playoffRedAlliance: $playoffRedAlliance, playoffBlueAlliance: $playoffBlueAlliance, red1: $red1, red1IsSurrogate: $red1IsSurrogate, red2: $red2, red2IsSurrogate: $red2IsSurrogate, red3: $red3, red3IsSurrogate: $red3IsSurrogate, blue1: $blue1, blue1IsSurrogate: $blue1IsSurrogate, blue2: $blue2, blue2IsSurrogate: $blue2IsSurrogate, blue3: $blue3, blue3IsSurrogate: $blue3IsSurrogate, status: $status, scheduledStartTime: $scheduledStartTime)';
}


}

/// @nodoc
abstract mixin class _$CheesyMatchCopyWith<$Res> implements $CheesyMatchCopyWith<$Res> {
  factory _$CheesyMatchCopyWith(_CheesyMatch value, $Res Function(_CheesyMatch) _then) = __$CheesyMatchCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Type') int type,@JsonKey(name: 'TypeOrder') int typeOrder,@JsonKey(name: 'LongName') String longName,@JsonKey(name: 'ShortName') String shortName,@JsonKey(name: 'NameDetail') String nameDetail,@JsonKey(name: 'PlayoffMatchGroupId') String playoffMatchGroupId,@JsonKey(name: 'PlayoffRedAlliance') int playoffRedAlliance,@JsonKey(name: 'PlayoffBlueAlliance') int playoffBlueAlliance,@JsonKey(name: 'Red1') int red1,@JsonKey(name: 'Red1IsSurrogate') bool red1IsSurrogate,@JsonKey(name: 'Red2') int red2,@JsonKey(name: 'Red2IsSurrogate') bool red2IsSurrogate,@JsonKey(name: 'Red3') int red3,@JsonKey(name: 'Red3IsSurrogate') bool red3IsSurrogate,@JsonKey(name: 'Blue1') int blue1,@JsonKey(name: 'Blue1IsSurrogate') bool blue1IsSurrogate,@JsonKey(name: 'Blue2') int blue2,@JsonKey(name: 'Blue2IsSurrogate') bool blue2IsSurrogate,@JsonKey(name: 'Blue3') int blue3,@JsonKey(name: 'Blue3IsSurrogate') bool blue3IsSurrogate,@JsonKey(name: 'Status') int status,@JsonKey(name: 'ScheduledStartTime') DateTime? scheduledStartTime
});




}
/// @nodoc
class __$CheesyMatchCopyWithImpl<$Res>
    implements _$CheesyMatchCopyWith<$Res> {
  __$CheesyMatchCopyWithImpl(this._self, this._then);

  final _CheesyMatch _self;
  final $Res Function(_CheesyMatch) _then;

/// Create a copy of CheesyMatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? typeOrder = null,Object? longName = null,Object? shortName = null,Object? nameDetail = null,Object? playoffMatchGroupId = null,Object? playoffRedAlliance = null,Object? playoffBlueAlliance = null,Object? red1 = null,Object? red1IsSurrogate = null,Object? red2 = null,Object? red2IsSurrogate = null,Object? red3 = null,Object? red3IsSurrogate = null,Object? blue1 = null,Object? blue1IsSurrogate = null,Object? blue2 = null,Object? blue2IsSurrogate = null,Object? blue3 = null,Object? blue3IsSurrogate = null,Object? status = null,Object? scheduledStartTime = freezed,}) {
  return _then(_CheesyMatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,typeOrder: null == typeOrder ? _self.typeOrder : typeOrder // ignore: cast_nullable_to_non_nullable
as int,longName: null == longName ? _self.longName : longName // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,nameDetail: null == nameDetail ? _self.nameDetail : nameDetail // ignore: cast_nullable_to_non_nullable
as String,playoffMatchGroupId: null == playoffMatchGroupId ? _self.playoffMatchGroupId : playoffMatchGroupId // ignore: cast_nullable_to_non_nullable
as String,playoffRedAlliance: null == playoffRedAlliance ? _self.playoffRedAlliance : playoffRedAlliance // ignore: cast_nullable_to_non_nullable
as int,playoffBlueAlliance: null == playoffBlueAlliance ? _self.playoffBlueAlliance : playoffBlueAlliance // ignore: cast_nullable_to_non_nullable
as int,red1: null == red1 ? _self.red1 : red1 // ignore: cast_nullable_to_non_nullable
as int,red1IsSurrogate: null == red1IsSurrogate ? _self.red1IsSurrogate : red1IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,red2: null == red2 ? _self.red2 : red2 // ignore: cast_nullable_to_non_nullable
as int,red2IsSurrogate: null == red2IsSurrogate ? _self.red2IsSurrogate : red2IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,red3: null == red3 ? _self.red3 : red3 // ignore: cast_nullable_to_non_nullable
as int,red3IsSurrogate: null == red3IsSurrogate ? _self.red3IsSurrogate : red3IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,blue1: null == blue1 ? _self.blue1 : blue1 // ignore: cast_nullable_to_non_nullable
as int,blue1IsSurrogate: null == blue1IsSurrogate ? _self.blue1IsSurrogate : blue1IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,blue2: null == blue2 ? _self.blue2 : blue2 // ignore: cast_nullable_to_non_nullable
as int,blue2IsSurrogate: null == blue2IsSurrogate ? _self.blue2IsSurrogate : blue2IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,blue3: null == blue3 ? _self.blue3 : blue3 // ignore: cast_nullable_to_non_nullable
as int,blue3IsSurrogate: null == blue3IsSurrogate ? _self.blue3IsSurrogate : blue3IsSurrogate // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,scheduledStartTime: freezed == scheduledStartTime ? _self.scheduledStartTime : scheduledStartTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CheesyAllianceStation {

@JsonKey(name: 'DsConn') CheesyDsConnection? get dsConn;@JsonKey(name: 'Ethernet') bool get ethernet;@JsonKey(name: 'AStop') bool get aStop;@JsonKey(name: 'EStop') bool get eStop;@JsonKey(name: 'Bypass') bool get bypass;@JsonKey(name: 'Team') CheesyTeam? get team;@JsonKey(name: 'WifiStatus') CheesyWifiStatus get wifiStatus;@JsonKey(name: 'GameData') String get gameData;
/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyAllianceStationCopyWith<CheesyAllianceStation> get copyWith => _$CheesyAllianceStationCopyWithImpl<CheesyAllianceStation>(this as CheesyAllianceStation, _$identity);

  /// Serializes this CheesyAllianceStation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyAllianceStation&&(identical(other.dsConn, dsConn) || other.dsConn == dsConn)&&(identical(other.ethernet, ethernet) || other.ethernet == ethernet)&&(identical(other.aStop, aStop) || other.aStop == aStop)&&(identical(other.eStop, eStop) || other.eStop == eStop)&&(identical(other.bypass, bypass) || other.bypass == bypass)&&(identical(other.team, team) || other.team == team)&&(identical(other.wifiStatus, wifiStatus) || other.wifiStatus == wifiStatus)&&(identical(other.gameData, gameData) || other.gameData == gameData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsConn,ethernet,aStop,eStop,bypass,team,wifiStatus,gameData);

@override
String toString() {
  return 'CheesyAllianceStation(dsConn: $dsConn, ethernet: $ethernet, aStop: $aStop, eStop: $eStop, bypass: $bypass, team: $team, wifiStatus: $wifiStatus, gameData: $gameData)';
}


}

/// @nodoc
abstract mixin class $CheesyAllianceStationCopyWith<$Res>  {
  factory $CheesyAllianceStationCopyWith(CheesyAllianceStation value, $Res Function(CheesyAllianceStation) _then) = _$CheesyAllianceStationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'DsConn') CheesyDsConnection? dsConn,@JsonKey(name: 'Ethernet') bool ethernet,@JsonKey(name: 'AStop') bool aStop,@JsonKey(name: 'EStop') bool eStop,@JsonKey(name: 'Bypass') bool bypass,@JsonKey(name: 'Team') CheesyTeam? team,@JsonKey(name: 'WifiStatus') CheesyWifiStatus wifiStatus,@JsonKey(name: 'GameData') String gameData
});


$CheesyDsConnectionCopyWith<$Res>? get dsConn;$CheesyTeamCopyWith<$Res>? get team;$CheesyWifiStatusCopyWith<$Res> get wifiStatus;

}
/// @nodoc
class _$CheesyAllianceStationCopyWithImpl<$Res>
    implements $CheesyAllianceStationCopyWith<$Res> {
  _$CheesyAllianceStationCopyWithImpl(this._self, this._then);

  final CheesyAllianceStation _self;
  final $Res Function(CheesyAllianceStation) _then;

/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dsConn = freezed,Object? ethernet = null,Object? aStop = null,Object? eStop = null,Object? bypass = null,Object? team = freezed,Object? wifiStatus = null,Object? gameData = null,}) {
  return _then(_self.copyWith(
dsConn: freezed == dsConn ? _self.dsConn : dsConn // ignore: cast_nullable_to_non_nullable
as CheesyDsConnection?,ethernet: null == ethernet ? _self.ethernet : ethernet // ignore: cast_nullable_to_non_nullable
as bool,aStop: null == aStop ? _self.aStop : aStop // ignore: cast_nullable_to_non_nullable
as bool,eStop: null == eStop ? _self.eStop : eStop // ignore: cast_nullable_to_non_nullable
as bool,bypass: null == bypass ? _self.bypass : bypass // ignore: cast_nullable_to_non_nullable
as bool,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as CheesyTeam?,wifiStatus: null == wifiStatus ? _self.wifiStatus : wifiStatus // ignore: cast_nullable_to_non_nullable
as CheesyWifiStatus,gameData: null == gameData ? _self.gameData : gameData // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyDsConnectionCopyWith<$Res>? get dsConn {
    if (_self.dsConn == null) {
    return null;
  }

  return $CheesyDsConnectionCopyWith<$Res>(_self.dsConn!, (value) {
    return _then(_self.copyWith(dsConn: value));
  });
}/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyTeamCopyWith<$Res>? get team {
    if (_self.team == null) {
    return null;
  }

  return $CheesyTeamCopyWith<$Res>(_self.team!, (value) {
    return _then(_self.copyWith(team: value));
  });
}/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyWifiStatusCopyWith<$Res> get wifiStatus {
  
  return $CheesyWifiStatusCopyWith<$Res>(_self.wifiStatus, (value) {
    return _then(_self.copyWith(wifiStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheesyAllianceStation].
extension CheesyAllianceStationPatterns on CheesyAllianceStation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyAllianceStation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyAllianceStation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyAllianceStation value)  $default,){
final _that = this;
switch (_that) {
case _CheesyAllianceStation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyAllianceStation value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyAllianceStation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsConn')  CheesyDsConnection? dsConn, @JsonKey(name: 'Ethernet')  bool ethernet, @JsonKey(name: 'AStop')  bool aStop, @JsonKey(name: 'EStop')  bool eStop, @JsonKey(name: 'Bypass')  bool bypass, @JsonKey(name: 'Team')  CheesyTeam? team, @JsonKey(name: 'WifiStatus')  CheesyWifiStatus wifiStatus, @JsonKey(name: 'GameData')  String gameData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyAllianceStation() when $default != null:
return $default(_that.dsConn,_that.ethernet,_that.aStop,_that.eStop,_that.bypass,_that.team,_that.wifiStatus,_that.gameData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsConn')  CheesyDsConnection? dsConn, @JsonKey(name: 'Ethernet')  bool ethernet, @JsonKey(name: 'AStop')  bool aStop, @JsonKey(name: 'EStop')  bool eStop, @JsonKey(name: 'Bypass')  bool bypass, @JsonKey(name: 'Team')  CheesyTeam? team, @JsonKey(name: 'WifiStatus')  CheesyWifiStatus wifiStatus, @JsonKey(name: 'GameData')  String gameData)  $default,) {final _that = this;
switch (_that) {
case _CheesyAllianceStation():
return $default(_that.dsConn,_that.ethernet,_that.aStop,_that.eStop,_that.bypass,_that.team,_that.wifiStatus,_that.gameData);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'DsConn')  CheesyDsConnection? dsConn, @JsonKey(name: 'Ethernet')  bool ethernet, @JsonKey(name: 'AStop')  bool aStop, @JsonKey(name: 'EStop')  bool eStop, @JsonKey(name: 'Bypass')  bool bypass, @JsonKey(name: 'Team')  CheesyTeam? team, @JsonKey(name: 'WifiStatus')  CheesyWifiStatus wifiStatus, @JsonKey(name: 'GameData')  String gameData)?  $default,) {final _that = this;
switch (_that) {
case _CheesyAllianceStation() when $default != null:
return $default(_that.dsConn,_that.ethernet,_that.aStop,_that.eStop,_that.bypass,_that.team,_that.wifiStatus,_that.gameData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyAllianceStation implements CheesyAllianceStation {
  const _CheesyAllianceStation({@JsonKey(name: 'DsConn') this.dsConn, @JsonKey(name: 'Ethernet') required this.ethernet, @JsonKey(name: 'AStop') required this.aStop, @JsonKey(name: 'EStop') required this.eStop, @JsonKey(name: 'Bypass') required this.bypass, @JsonKey(name: 'Team') this.team, @JsonKey(name: 'WifiStatus') required this.wifiStatus, @JsonKey(name: 'GameData') this.gameData = ''});
  factory _CheesyAllianceStation.fromJson(Map<String, dynamic> json) => _$CheesyAllianceStationFromJson(json);

@override@JsonKey(name: 'DsConn') final  CheesyDsConnection? dsConn;
@override@JsonKey(name: 'Ethernet') final  bool ethernet;
@override@JsonKey(name: 'AStop') final  bool aStop;
@override@JsonKey(name: 'EStop') final  bool eStop;
@override@JsonKey(name: 'Bypass') final  bool bypass;
@override@JsonKey(name: 'Team') final  CheesyTeam? team;
@override@JsonKey(name: 'WifiStatus') final  CheesyWifiStatus wifiStatus;
@override@JsonKey(name: 'GameData') final  String gameData;

/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyAllianceStationCopyWith<_CheesyAllianceStation> get copyWith => __$CheesyAllianceStationCopyWithImpl<_CheesyAllianceStation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyAllianceStationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyAllianceStation&&(identical(other.dsConn, dsConn) || other.dsConn == dsConn)&&(identical(other.ethernet, ethernet) || other.ethernet == ethernet)&&(identical(other.aStop, aStop) || other.aStop == aStop)&&(identical(other.eStop, eStop) || other.eStop == eStop)&&(identical(other.bypass, bypass) || other.bypass == bypass)&&(identical(other.team, team) || other.team == team)&&(identical(other.wifiStatus, wifiStatus) || other.wifiStatus == wifiStatus)&&(identical(other.gameData, gameData) || other.gameData == gameData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsConn,ethernet,aStop,eStop,bypass,team,wifiStatus,gameData);

@override
String toString() {
  return 'CheesyAllianceStation(dsConn: $dsConn, ethernet: $ethernet, aStop: $aStop, eStop: $eStop, bypass: $bypass, team: $team, wifiStatus: $wifiStatus, gameData: $gameData)';
}


}

/// @nodoc
abstract mixin class _$CheesyAllianceStationCopyWith<$Res> implements $CheesyAllianceStationCopyWith<$Res> {
  factory _$CheesyAllianceStationCopyWith(_CheesyAllianceStation value, $Res Function(_CheesyAllianceStation) _then) = __$CheesyAllianceStationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'DsConn') CheesyDsConnection? dsConn,@JsonKey(name: 'Ethernet') bool ethernet,@JsonKey(name: 'AStop') bool aStop,@JsonKey(name: 'EStop') bool eStop,@JsonKey(name: 'Bypass') bool bypass,@JsonKey(name: 'Team') CheesyTeam? team,@JsonKey(name: 'WifiStatus') CheesyWifiStatus wifiStatus,@JsonKey(name: 'GameData') String gameData
});


@override $CheesyDsConnectionCopyWith<$Res>? get dsConn;@override $CheesyTeamCopyWith<$Res>? get team;@override $CheesyWifiStatusCopyWith<$Res> get wifiStatus;

}
/// @nodoc
class __$CheesyAllianceStationCopyWithImpl<$Res>
    implements _$CheesyAllianceStationCopyWith<$Res> {
  __$CheesyAllianceStationCopyWithImpl(this._self, this._then);

  final _CheesyAllianceStation _self;
  final $Res Function(_CheesyAllianceStation) _then;

/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dsConn = freezed,Object? ethernet = null,Object? aStop = null,Object? eStop = null,Object? bypass = null,Object? team = freezed,Object? wifiStatus = null,Object? gameData = null,}) {
  return _then(_CheesyAllianceStation(
dsConn: freezed == dsConn ? _self.dsConn : dsConn // ignore: cast_nullable_to_non_nullable
as CheesyDsConnection?,ethernet: null == ethernet ? _self.ethernet : ethernet // ignore: cast_nullable_to_non_nullable
as bool,aStop: null == aStop ? _self.aStop : aStop // ignore: cast_nullable_to_non_nullable
as bool,eStop: null == eStop ? _self.eStop : eStop // ignore: cast_nullable_to_non_nullable
as bool,bypass: null == bypass ? _self.bypass : bypass // ignore: cast_nullable_to_non_nullable
as bool,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as CheesyTeam?,wifiStatus: null == wifiStatus ? _self.wifiStatus : wifiStatus // ignore: cast_nullable_to_non_nullable
as CheesyWifiStatus,gameData: null == gameData ? _self.gameData : gameData // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyDsConnectionCopyWith<$Res>? get dsConn {
    if (_self.dsConn == null) {
    return null;
  }

  return $CheesyDsConnectionCopyWith<$Res>(_self.dsConn!, (value) {
    return _then(_self.copyWith(dsConn: value));
  });
}/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyTeamCopyWith<$Res>? get team {
    if (_self.team == null) {
    return null;
  }

  return $CheesyTeamCopyWith<$Res>(_self.team!, (value) {
    return _then(_self.copyWith(team: value));
  });
}/// Create a copy of CheesyAllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyWifiStatusCopyWith<$Res> get wifiStatus {
  
  return $CheesyWifiStatusCopyWith<$Res>(_self.wifiStatus, (value) {
    return _then(_self.copyWith(wifiStatus: value));
  });
}
}


/// @nodoc
mixin _$CheesyWifiStatus {

@JsonKey(name: 'TeamId') int get teamId;@JsonKey(name: 'RadioLinked') bool get radioLinked;@JsonKey(name: 'MBits', fromJson: _numToDouble) double get mBits;@JsonKey(name: 'RxRate', fromJson: _numToDouble) double get rxRate;@JsonKey(name: 'TxRate', fromJson: _numToDouble) double get txRate;@JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) double get signalNoiseRatio;@JsonKey(name: 'ConnectionQuality') int get connectionQuality;
/// Create a copy of CheesyWifiStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyWifiStatusCopyWith<CheesyWifiStatus> get copyWith => _$CheesyWifiStatusCopyWithImpl<CheesyWifiStatus>(this as CheesyWifiStatus, _$identity);

  /// Serializes this CheesyWifiStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyWifiStatus&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.mBits, mBits) || other.mBits == mBits)&&(identical(other.rxRate, rxRate) || other.rxRate == rxRate)&&(identical(other.txRate, txRate) || other.txRate == txRate)&&(identical(other.signalNoiseRatio, signalNoiseRatio) || other.signalNoiseRatio == signalNoiseRatio)&&(identical(other.connectionQuality, connectionQuality) || other.connectionQuality == connectionQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,radioLinked,mBits,rxRate,txRate,signalNoiseRatio,connectionQuality);

@override
String toString() {
  return 'CheesyWifiStatus(teamId: $teamId, radioLinked: $radioLinked, mBits: $mBits, rxRate: $rxRate, txRate: $txRate, signalNoiseRatio: $signalNoiseRatio, connectionQuality: $connectionQuality)';
}


}

/// @nodoc
abstract mixin class $CheesyWifiStatusCopyWith<$Res>  {
  factory $CheesyWifiStatusCopyWith(CheesyWifiStatus value, $Res Function(CheesyWifiStatus) _then) = _$CheesyWifiStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'TeamId') int teamId,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'MBits', fromJson: _numToDouble) double mBits,@JsonKey(name: 'RxRate', fromJson: _numToDouble) double rxRate,@JsonKey(name: 'TxRate', fromJson: _numToDouble) double txRate,@JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) double signalNoiseRatio,@JsonKey(name: 'ConnectionQuality') int connectionQuality
});




}
/// @nodoc
class _$CheesyWifiStatusCopyWithImpl<$Res>
    implements $CheesyWifiStatusCopyWith<$Res> {
  _$CheesyWifiStatusCopyWithImpl(this._self, this._then);

  final CheesyWifiStatus _self;
  final $Res Function(CheesyWifiStatus) _then;

/// Create a copy of CheesyWifiStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamId = null,Object? radioLinked = null,Object? mBits = null,Object? rxRate = null,Object? txRate = null,Object? signalNoiseRatio = null,Object? connectionQuality = null,}) {
  return _then(_self.copyWith(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as int,radioLinked: null == radioLinked ? _self.radioLinked : radioLinked // ignore: cast_nullable_to_non_nullable
as bool,mBits: null == mBits ? _self.mBits : mBits // ignore: cast_nullable_to_non_nullable
as double,rxRate: null == rxRate ? _self.rxRate : rxRate // ignore: cast_nullable_to_non_nullable
as double,txRate: null == txRate ? _self.txRate : txRate // ignore: cast_nullable_to_non_nullable
as double,signalNoiseRatio: null == signalNoiseRatio ? _self.signalNoiseRatio : signalNoiseRatio // ignore: cast_nullable_to_non_nullable
as double,connectionQuality: null == connectionQuality ? _self.connectionQuality : connectionQuality // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyWifiStatus].
extension CheesyWifiStatusPatterns on CheesyWifiStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyWifiStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyWifiStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyWifiStatus value)  $default,){
final _that = this;
switch (_that) {
case _CheesyWifiStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyWifiStatus value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyWifiStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'TeamId')  int teamId, @JsonKey(name: 'RadioLinked')  bool radioLinked, @JsonKey(name: 'MBits', fromJson: _numToDouble)  double mBits, @JsonKey(name: 'RxRate', fromJson: _numToDouble)  double rxRate, @JsonKey(name: 'TxRate', fromJson: _numToDouble)  double txRate, @JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble)  double signalNoiseRatio, @JsonKey(name: 'ConnectionQuality')  int connectionQuality)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyWifiStatus() when $default != null:
return $default(_that.teamId,_that.radioLinked,_that.mBits,_that.rxRate,_that.txRate,_that.signalNoiseRatio,_that.connectionQuality);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'TeamId')  int teamId, @JsonKey(name: 'RadioLinked')  bool radioLinked, @JsonKey(name: 'MBits', fromJson: _numToDouble)  double mBits, @JsonKey(name: 'RxRate', fromJson: _numToDouble)  double rxRate, @JsonKey(name: 'TxRate', fromJson: _numToDouble)  double txRate, @JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble)  double signalNoiseRatio, @JsonKey(name: 'ConnectionQuality')  int connectionQuality)  $default,) {final _that = this;
switch (_that) {
case _CheesyWifiStatus():
return $default(_that.teamId,_that.radioLinked,_that.mBits,_that.rxRate,_that.txRate,_that.signalNoiseRatio,_that.connectionQuality);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'TeamId')  int teamId, @JsonKey(name: 'RadioLinked')  bool radioLinked, @JsonKey(name: 'MBits', fromJson: _numToDouble)  double mBits, @JsonKey(name: 'RxRate', fromJson: _numToDouble)  double rxRate, @JsonKey(name: 'TxRate', fromJson: _numToDouble)  double txRate, @JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble)  double signalNoiseRatio, @JsonKey(name: 'ConnectionQuality')  int connectionQuality)?  $default,) {final _that = this;
switch (_that) {
case _CheesyWifiStatus() when $default != null:
return $default(_that.teamId,_that.radioLinked,_that.mBits,_that.rxRate,_that.txRate,_that.signalNoiseRatio,_that.connectionQuality);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyWifiStatus implements CheesyWifiStatus {
  const _CheesyWifiStatus({@JsonKey(name: 'TeamId') required this.teamId, @JsonKey(name: 'RadioLinked') required this.radioLinked, @JsonKey(name: 'MBits', fromJson: _numToDouble) this.mBits = 0.0, @JsonKey(name: 'RxRate', fromJson: _numToDouble) this.rxRate = 0.0, @JsonKey(name: 'TxRate', fromJson: _numToDouble) this.txRate = 0.0, @JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) this.signalNoiseRatio = 0.0, @JsonKey(name: 'ConnectionQuality') this.connectionQuality = 0});
  factory _CheesyWifiStatus.fromJson(Map<String, dynamic> json) => _$CheesyWifiStatusFromJson(json);

@override@JsonKey(name: 'TeamId') final  int teamId;
@override@JsonKey(name: 'RadioLinked') final  bool radioLinked;
@override@JsonKey(name: 'MBits', fromJson: _numToDouble) final  double mBits;
@override@JsonKey(name: 'RxRate', fromJson: _numToDouble) final  double rxRate;
@override@JsonKey(name: 'TxRate', fromJson: _numToDouble) final  double txRate;
@override@JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) final  double signalNoiseRatio;
@override@JsonKey(name: 'ConnectionQuality') final  int connectionQuality;

/// Create a copy of CheesyWifiStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyWifiStatusCopyWith<_CheesyWifiStatus> get copyWith => __$CheesyWifiStatusCopyWithImpl<_CheesyWifiStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyWifiStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyWifiStatus&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.mBits, mBits) || other.mBits == mBits)&&(identical(other.rxRate, rxRate) || other.rxRate == rxRate)&&(identical(other.txRate, txRate) || other.txRate == txRate)&&(identical(other.signalNoiseRatio, signalNoiseRatio) || other.signalNoiseRatio == signalNoiseRatio)&&(identical(other.connectionQuality, connectionQuality) || other.connectionQuality == connectionQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,radioLinked,mBits,rxRate,txRate,signalNoiseRatio,connectionQuality);

@override
String toString() {
  return 'CheesyWifiStatus(teamId: $teamId, radioLinked: $radioLinked, mBits: $mBits, rxRate: $rxRate, txRate: $txRate, signalNoiseRatio: $signalNoiseRatio, connectionQuality: $connectionQuality)';
}


}

/// @nodoc
abstract mixin class _$CheesyWifiStatusCopyWith<$Res> implements $CheesyWifiStatusCopyWith<$Res> {
  factory _$CheesyWifiStatusCopyWith(_CheesyWifiStatus value, $Res Function(_CheesyWifiStatus) _then) = __$CheesyWifiStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'TeamId') int teamId,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'MBits', fromJson: _numToDouble) double mBits,@JsonKey(name: 'RxRate', fromJson: _numToDouble) double rxRate,@JsonKey(name: 'TxRate', fromJson: _numToDouble) double txRate,@JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) double signalNoiseRatio,@JsonKey(name: 'ConnectionQuality') int connectionQuality
});




}
/// @nodoc
class __$CheesyWifiStatusCopyWithImpl<$Res>
    implements _$CheesyWifiStatusCopyWith<$Res> {
  __$CheesyWifiStatusCopyWithImpl(this._self, this._then);

  final _CheesyWifiStatus _self;
  final $Res Function(_CheesyWifiStatus) _then;

/// Create a copy of CheesyWifiStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? radioLinked = null,Object? mBits = null,Object? rxRate = null,Object? txRate = null,Object? signalNoiseRatio = null,Object? connectionQuality = null,}) {
  return _then(_CheesyWifiStatus(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as int,radioLinked: null == radioLinked ? _self.radioLinked : radioLinked // ignore: cast_nullable_to_non_nullable
as bool,mBits: null == mBits ? _self.mBits : mBits // ignore: cast_nullable_to_non_nullable
as double,rxRate: null == rxRate ? _self.rxRate : rxRate // ignore: cast_nullable_to_non_nullable
as double,txRate: null == txRate ? _self.txRate : txRate // ignore: cast_nullable_to_non_nullable
as double,signalNoiseRatio: null == signalNoiseRatio ? _self.signalNoiseRatio : signalNoiseRatio // ignore: cast_nullable_to_non_nullable
as double,connectionQuality: null == connectionQuality ? _self.connectionQuality : connectionQuality // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheesyDsConnection {

@JsonKey(name: 'DsLinked') bool get dsLinked;@JsonKey(name: 'RioLinked') bool get rioLinked;@JsonKey(name: 'RobotLinked') bool get robotLinked;@JsonKey(name: 'RadioLinked') bool get radioLinked;@JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) double get batteryVoltage;@JsonKey(name: 'DsRobotTripTimeMs') int get dsRobotTripTimeMs;@JsonKey(name: 'MissedPacketCount') int get missedPacketCount;
/// Create a copy of CheesyDsConnection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyDsConnectionCopyWith<CheesyDsConnection> get copyWith => _$CheesyDsConnectionCopyWithImpl<CheesyDsConnection>(this as CheesyDsConnection, _$identity);

  /// Serializes this CheesyDsConnection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyDsConnection&&(identical(other.dsLinked, dsLinked) || other.dsLinked == dsLinked)&&(identical(other.rioLinked, rioLinked) || other.rioLinked == rioLinked)&&(identical(other.robotLinked, robotLinked) || other.robotLinked == robotLinked)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.batteryVoltage, batteryVoltage) || other.batteryVoltage == batteryVoltage)&&(identical(other.dsRobotTripTimeMs, dsRobotTripTimeMs) || other.dsRobotTripTimeMs == dsRobotTripTimeMs)&&(identical(other.missedPacketCount, missedPacketCount) || other.missedPacketCount == missedPacketCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsLinked,rioLinked,robotLinked,radioLinked,batteryVoltage,dsRobotTripTimeMs,missedPacketCount);

@override
String toString() {
  return 'CheesyDsConnection(dsLinked: $dsLinked, rioLinked: $rioLinked, robotLinked: $robotLinked, radioLinked: $radioLinked, batteryVoltage: $batteryVoltage, dsRobotTripTimeMs: $dsRobotTripTimeMs, missedPacketCount: $missedPacketCount)';
}


}

/// @nodoc
abstract mixin class $CheesyDsConnectionCopyWith<$Res>  {
  factory $CheesyDsConnectionCopyWith(CheesyDsConnection value, $Res Function(CheesyDsConnection) _then) = _$CheesyDsConnectionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'DsLinked') bool dsLinked,@JsonKey(name: 'RioLinked') bool rioLinked,@JsonKey(name: 'RobotLinked') bool robotLinked,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) double batteryVoltage,@JsonKey(name: 'DsRobotTripTimeMs') int dsRobotTripTimeMs,@JsonKey(name: 'MissedPacketCount') int missedPacketCount
});




}
/// @nodoc
class _$CheesyDsConnectionCopyWithImpl<$Res>
    implements $CheesyDsConnectionCopyWith<$Res> {
  _$CheesyDsConnectionCopyWithImpl(this._self, this._then);

  final CheesyDsConnection _self;
  final $Res Function(CheesyDsConnection) _then;

/// Create a copy of CheesyDsConnection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dsLinked = null,Object? rioLinked = null,Object? robotLinked = null,Object? radioLinked = null,Object? batteryVoltage = null,Object? dsRobotTripTimeMs = null,Object? missedPacketCount = null,}) {
  return _then(_self.copyWith(
dsLinked: null == dsLinked ? _self.dsLinked : dsLinked // ignore: cast_nullable_to_non_nullable
as bool,rioLinked: null == rioLinked ? _self.rioLinked : rioLinked // ignore: cast_nullable_to_non_nullable
as bool,robotLinked: null == robotLinked ? _self.robotLinked : robotLinked // ignore: cast_nullable_to_non_nullable
as bool,radioLinked: null == radioLinked ? _self.radioLinked : radioLinked // ignore: cast_nullable_to_non_nullable
as bool,batteryVoltage: null == batteryVoltage ? _self.batteryVoltage : batteryVoltage // ignore: cast_nullable_to_non_nullable
as double,dsRobotTripTimeMs: null == dsRobotTripTimeMs ? _self.dsRobotTripTimeMs : dsRobotTripTimeMs // ignore: cast_nullable_to_non_nullable
as int,missedPacketCount: null == missedPacketCount ? _self.missedPacketCount : missedPacketCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyDsConnection].
extension CheesyDsConnectionPatterns on CheesyDsConnection {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyDsConnection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyDsConnection() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyDsConnection value)  $default,){
final _that = this;
switch (_that) {
case _CheesyDsConnection():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyDsConnection value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyDsConnection() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsLinked')  bool dsLinked, @JsonKey(name: 'RioLinked')  bool rioLinked, @JsonKey(name: 'RobotLinked')  bool robotLinked, @JsonKey(name: 'RadioLinked')  bool radioLinked, @JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble)  double batteryVoltage, @JsonKey(name: 'DsRobotTripTimeMs')  int dsRobotTripTimeMs, @JsonKey(name: 'MissedPacketCount')  int missedPacketCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyDsConnection() when $default != null:
return $default(_that.dsLinked,_that.rioLinked,_that.robotLinked,_that.radioLinked,_that.batteryVoltage,_that.dsRobotTripTimeMs,_that.missedPacketCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsLinked')  bool dsLinked, @JsonKey(name: 'RioLinked')  bool rioLinked, @JsonKey(name: 'RobotLinked')  bool robotLinked, @JsonKey(name: 'RadioLinked')  bool radioLinked, @JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble)  double batteryVoltage, @JsonKey(name: 'DsRobotTripTimeMs')  int dsRobotTripTimeMs, @JsonKey(name: 'MissedPacketCount')  int missedPacketCount)  $default,) {final _that = this;
switch (_that) {
case _CheesyDsConnection():
return $default(_that.dsLinked,_that.rioLinked,_that.robotLinked,_that.radioLinked,_that.batteryVoltage,_that.dsRobotTripTimeMs,_that.missedPacketCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'DsLinked')  bool dsLinked, @JsonKey(name: 'RioLinked')  bool rioLinked, @JsonKey(name: 'RobotLinked')  bool robotLinked, @JsonKey(name: 'RadioLinked')  bool radioLinked, @JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble)  double batteryVoltage, @JsonKey(name: 'DsRobotTripTimeMs')  int dsRobotTripTimeMs, @JsonKey(name: 'MissedPacketCount')  int missedPacketCount)?  $default,) {final _that = this;
switch (_that) {
case _CheesyDsConnection() when $default != null:
return $default(_that.dsLinked,_that.rioLinked,_that.robotLinked,_that.radioLinked,_that.batteryVoltage,_that.dsRobotTripTimeMs,_that.missedPacketCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyDsConnection implements CheesyDsConnection {
  const _CheesyDsConnection({@JsonKey(name: 'DsLinked') required this.dsLinked, @JsonKey(name: 'RioLinked') this.rioLinked = false, @JsonKey(name: 'RobotLinked') required this.robotLinked, @JsonKey(name: 'RadioLinked') required this.radioLinked, @JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) required this.batteryVoltage, @JsonKey(name: 'DsRobotTripTimeMs') required this.dsRobotTripTimeMs, @JsonKey(name: 'MissedPacketCount') required this.missedPacketCount});
  factory _CheesyDsConnection.fromJson(Map<String, dynamic> json) => _$CheesyDsConnectionFromJson(json);

@override@JsonKey(name: 'DsLinked') final  bool dsLinked;
@override@JsonKey(name: 'RioLinked') final  bool rioLinked;
@override@JsonKey(name: 'RobotLinked') final  bool robotLinked;
@override@JsonKey(name: 'RadioLinked') final  bool radioLinked;
@override@JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) final  double batteryVoltage;
@override@JsonKey(name: 'DsRobotTripTimeMs') final  int dsRobotTripTimeMs;
@override@JsonKey(name: 'MissedPacketCount') final  int missedPacketCount;

/// Create a copy of CheesyDsConnection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyDsConnectionCopyWith<_CheesyDsConnection> get copyWith => __$CheesyDsConnectionCopyWithImpl<_CheesyDsConnection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyDsConnectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyDsConnection&&(identical(other.dsLinked, dsLinked) || other.dsLinked == dsLinked)&&(identical(other.rioLinked, rioLinked) || other.rioLinked == rioLinked)&&(identical(other.robotLinked, robotLinked) || other.robotLinked == robotLinked)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.batteryVoltage, batteryVoltage) || other.batteryVoltage == batteryVoltage)&&(identical(other.dsRobotTripTimeMs, dsRobotTripTimeMs) || other.dsRobotTripTimeMs == dsRobotTripTimeMs)&&(identical(other.missedPacketCount, missedPacketCount) || other.missedPacketCount == missedPacketCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsLinked,rioLinked,robotLinked,radioLinked,batteryVoltage,dsRobotTripTimeMs,missedPacketCount);

@override
String toString() {
  return 'CheesyDsConnection(dsLinked: $dsLinked, rioLinked: $rioLinked, robotLinked: $robotLinked, radioLinked: $radioLinked, batteryVoltage: $batteryVoltage, dsRobotTripTimeMs: $dsRobotTripTimeMs, missedPacketCount: $missedPacketCount)';
}


}

/// @nodoc
abstract mixin class _$CheesyDsConnectionCopyWith<$Res> implements $CheesyDsConnectionCopyWith<$Res> {
  factory _$CheesyDsConnectionCopyWith(_CheesyDsConnection value, $Res Function(_CheesyDsConnection) _then) = __$CheesyDsConnectionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'DsLinked') bool dsLinked,@JsonKey(name: 'RioLinked') bool rioLinked,@JsonKey(name: 'RobotLinked') bool robotLinked,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) double batteryVoltage,@JsonKey(name: 'DsRobotTripTimeMs') int dsRobotTripTimeMs,@JsonKey(name: 'MissedPacketCount') int missedPacketCount
});




}
/// @nodoc
class __$CheesyDsConnectionCopyWithImpl<$Res>
    implements _$CheesyDsConnectionCopyWith<$Res> {
  __$CheesyDsConnectionCopyWithImpl(this._self, this._then);

  final _CheesyDsConnection _self;
  final $Res Function(_CheesyDsConnection) _then;

/// Create a copy of CheesyDsConnection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dsLinked = null,Object? rioLinked = null,Object? robotLinked = null,Object? radioLinked = null,Object? batteryVoltage = null,Object? dsRobotTripTimeMs = null,Object? missedPacketCount = null,}) {
  return _then(_CheesyDsConnection(
dsLinked: null == dsLinked ? _self.dsLinked : dsLinked // ignore: cast_nullable_to_non_nullable
as bool,rioLinked: null == rioLinked ? _self.rioLinked : rioLinked // ignore: cast_nullable_to_non_nullable
as bool,robotLinked: null == robotLinked ? _self.robotLinked : robotLinked // ignore: cast_nullable_to_non_nullable
as bool,radioLinked: null == radioLinked ? _self.radioLinked : radioLinked // ignore: cast_nullable_to_non_nullable
as bool,batteryVoltage: null == batteryVoltage ? _self.batteryVoltage : batteryVoltage // ignore: cast_nullable_to_non_nullable
as double,dsRobotTripTimeMs: null == dsRobotTripTimeMs ? _self.dsRobotTripTimeMs : dsRobotTripTimeMs // ignore: cast_nullable_to_non_nullable
as int,missedPacketCount: null == missedPacketCount ? _self.missedPacketCount : missedPacketCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheesyTeam {

@JsonKey(name: 'Id') int get id;@JsonKey(name: 'Name') String get name;@JsonKey(name: 'Nickname') String get nickname;@JsonKey(name: 'City') String get city;@JsonKey(name: 'StateProv') String get stateProv;@JsonKey(name: 'Country') String get country;@JsonKey(name: 'SchoolName') String get schoolName;@JsonKey(name: 'RookieYear') int get rookieYear;@JsonKey(name: 'RobotName') String get robotName;@JsonKey(name: 'YellowCard') bool get yellowCard;@JsonKey(name: 'HasConnected') bool get hasConnected;@JsonKey(name: 'FtaNotes') String get ftaNotes;
/// Create a copy of CheesyTeam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyTeamCopyWith<CheesyTeam> get copyWith => _$CheesyTeamCopyWithImpl<CheesyTeam>(this as CheesyTeam, _$identity);

  /// Serializes this CheesyTeam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.city, city) || other.city == city)&&(identical(other.stateProv, stateProv) || other.stateProv == stateProv)&&(identical(other.country, country) || other.country == country)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.rookieYear, rookieYear) || other.rookieYear == rookieYear)&&(identical(other.robotName, robotName) || other.robotName == robotName)&&(identical(other.yellowCard, yellowCard) || other.yellowCard == yellowCard)&&(identical(other.hasConnected, hasConnected) || other.hasConnected == hasConnected)&&(identical(other.ftaNotes, ftaNotes) || other.ftaNotes == ftaNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nickname,city,stateProv,country,schoolName,rookieYear,robotName,yellowCard,hasConnected,ftaNotes);

@override
String toString() {
  return 'CheesyTeam(id: $id, name: $name, nickname: $nickname, city: $city, stateProv: $stateProv, country: $country, schoolName: $schoolName, rookieYear: $rookieYear, robotName: $robotName, yellowCard: $yellowCard, hasConnected: $hasConnected, ftaNotes: $ftaNotes)';
}


}

/// @nodoc
abstract mixin class $CheesyTeamCopyWith<$Res>  {
  factory $CheesyTeamCopyWith(CheesyTeam value, $Res Function(CheesyTeam) _then) = _$CheesyTeamCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name') String name,@JsonKey(name: 'Nickname') String nickname,@JsonKey(name: 'City') String city,@JsonKey(name: 'StateProv') String stateProv,@JsonKey(name: 'Country') String country,@JsonKey(name: 'SchoolName') String schoolName,@JsonKey(name: 'RookieYear') int rookieYear,@JsonKey(name: 'RobotName') String robotName,@JsonKey(name: 'YellowCard') bool yellowCard,@JsonKey(name: 'HasConnected') bool hasConnected,@JsonKey(name: 'FtaNotes') String ftaNotes
});




}
/// @nodoc
class _$CheesyTeamCopyWithImpl<$Res>
    implements $CheesyTeamCopyWith<$Res> {
  _$CheesyTeamCopyWithImpl(this._self, this._then);

  final CheesyTeam _self;
  final $Res Function(CheesyTeam) _then;

/// Create a copy of CheesyTeam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nickname = null,Object? city = null,Object? stateProv = null,Object? country = null,Object? schoolName = null,Object? rookieYear = null,Object? robotName = null,Object? yellowCard = null,Object? hasConnected = null,Object? ftaNotes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,stateProv: null == stateProv ? _self.stateProv : stateProv // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,rookieYear: null == rookieYear ? _self.rookieYear : rookieYear // ignore: cast_nullable_to_non_nullable
as int,robotName: null == robotName ? _self.robotName : robotName // ignore: cast_nullable_to_non_nullable
as String,yellowCard: null == yellowCard ? _self.yellowCard : yellowCard // ignore: cast_nullable_to_non_nullable
as bool,hasConnected: null == hasConnected ? _self.hasConnected : hasConnected // ignore: cast_nullable_to_non_nullable
as bool,ftaNotes: null == ftaNotes ? _self.ftaNotes : ftaNotes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyTeam].
extension CheesyTeamPatterns on CheesyTeam {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyTeam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyTeam() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyTeam value)  $default,){
final _that = this;
switch (_that) {
case _CheesyTeam():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyTeam value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyTeam() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name')  String name, @JsonKey(name: 'Nickname')  String nickname, @JsonKey(name: 'City')  String city, @JsonKey(name: 'StateProv')  String stateProv, @JsonKey(name: 'Country')  String country, @JsonKey(name: 'SchoolName')  String schoolName, @JsonKey(name: 'RookieYear')  int rookieYear, @JsonKey(name: 'RobotName')  String robotName, @JsonKey(name: 'YellowCard')  bool yellowCard, @JsonKey(name: 'HasConnected')  bool hasConnected, @JsonKey(name: 'FtaNotes')  String ftaNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyTeam() when $default != null:
return $default(_that.id,_that.name,_that.nickname,_that.city,_that.stateProv,_that.country,_that.schoolName,_that.rookieYear,_that.robotName,_that.yellowCard,_that.hasConnected,_that.ftaNotes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name')  String name, @JsonKey(name: 'Nickname')  String nickname, @JsonKey(name: 'City')  String city, @JsonKey(name: 'StateProv')  String stateProv, @JsonKey(name: 'Country')  String country, @JsonKey(name: 'SchoolName')  String schoolName, @JsonKey(name: 'RookieYear')  int rookieYear, @JsonKey(name: 'RobotName')  String robotName, @JsonKey(name: 'YellowCard')  bool yellowCard, @JsonKey(name: 'HasConnected')  bool hasConnected, @JsonKey(name: 'FtaNotes')  String ftaNotes)  $default,) {final _that = this;
switch (_that) {
case _CheesyTeam():
return $default(_that.id,_that.name,_that.nickname,_that.city,_that.stateProv,_that.country,_that.schoolName,_that.rookieYear,_that.robotName,_that.yellowCard,_that.hasConnected,_that.ftaNotes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name')  String name, @JsonKey(name: 'Nickname')  String nickname, @JsonKey(name: 'City')  String city, @JsonKey(name: 'StateProv')  String stateProv, @JsonKey(name: 'Country')  String country, @JsonKey(name: 'SchoolName')  String schoolName, @JsonKey(name: 'RookieYear')  int rookieYear, @JsonKey(name: 'RobotName')  String robotName, @JsonKey(name: 'YellowCard')  bool yellowCard, @JsonKey(name: 'HasConnected')  bool hasConnected, @JsonKey(name: 'FtaNotes')  String ftaNotes)?  $default,) {final _that = this;
switch (_that) {
case _CheesyTeam() when $default != null:
return $default(_that.id,_that.name,_that.nickname,_that.city,_that.stateProv,_that.country,_that.schoolName,_that.rookieYear,_that.robotName,_that.yellowCard,_that.hasConnected,_that.ftaNotes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyTeam implements CheesyTeam {
  const _CheesyTeam({@JsonKey(name: 'Id') required this.id, @JsonKey(name: 'Name') required this.name, @JsonKey(name: 'Nickname') this.nickname = '', @JsonKey(name: 'City') this.city = '', @JsonKey(name: 'StateProv') this.stateProv = '', @JsonKey(name: 'Country') this.country = '', @JsonKey(name: 'SchoolName') this.schoolName = '', @JsonKey(name: 'RookieYear') this.rookieYear = 0, @JsonKey(name: 'RobotName') this.robotName = '', @JsonKey(name: 'YellowCard') this.yellowCard = false, @JsonKey(name: 'HasConnected') this.hasConnected = false, @JsonKey(name: 'FtaNotes') this.ftaNotes = ''});
  factory _CheesyTeam.fromJson(Map<String, dynamic> json) => _$CheesyTeamFromJson(json);

@override@JsonKey(name: 'Id') final  int id;
@override@JsonKey(name: 'Name') final  String name;
@override@JsonKey(name: 'Nickname') final  String nickname;
@override@JsonKey(name: 'City') final  String city;
@override@JsonKey(name: 'StateProv') final  String stateProv;
@override@JsonKey(name: 'Country') final  String country;
@override@JsonKey(name: 'SchoolName') final  String schoolName;
@override@JsonKey(name: 'RookieYear') final  int rookieYear;
@override@JsonKey(name: 'RobotName') final  String robotName;
@override@JsonKey(name: 'YellowCard') final  bool yellowCard;
@override@JsonKey(name: 'HasConnected') final  bool hasConnected;
@override@JsonKey(name: 'FtaNotes') final  String ftaNotes;

/// Create a copy of CheesyTeam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyTeamCopyWith<_CheesyTeam> get copyWith => __$CheesyTeamCopyWithImpl<_CheesyTeam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyTeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.city, city) || other.city == city)&&(identical(other.stateProv, stateProv) || other.stateProv == stateProv)&&(identical(other.country, country) || other.country == country)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.rookieYear, rookieYear) || other.rookieYear == rookieYear)&&(identical(other.robotName, robotName) || other.robotName == robotName)&&(identical(other.yellowCard, yellowCard) || other.yellowCard == yellowCard)&&(identical(other.hasConnected, hasConnected) || other.hasConnected == hasConnected)&&(identical(other.ftaNotes, ftaNotes) || other.ftaNotes == ftaNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nickname,city,stateProv,country,schoolName,rookieYear,robotName,yellowCard,hasConnected,ftaNotes);

@override
String toString() {
  return 'CheesyTeam(id: $id, name: $name, nickname: $nickname, city: $city, stateProv: $stateProv, country: $country, schoolName: $schoolName, rookieYear: $rookieYear, robotName: $robotName, yellowCard: $yellowCard, hasConnected: $hasConnected, ftaNotes: $ftaNotes)';
}


}

/// @nodoc
abstract mixin class _$CheesyTeamCopyWith<$Res> implements $CheesyTeamCopyWith<$Res> {
  factory _$CheesyTeamCopyWith(_CheesyTeam value, $Res Function(_CheesyTeam) _then) = __$CheesyTeamCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name') String name,@JsonKey(name: 'Nickname') String nickname,@JsonKey(name: 'City') String city,@JsonKey(name: 'StateProv') String stateProv,@JsonKey(name: 'Country') String country,@JsonKey(name: 'SchoolName') String schoolName,@JsonKey(name: 'RookieYear') int rookieYear,@JsonKey(name: 'RobotName') String robotName,@JsonKey(name: 'YellowCard') bool yellowCard,@JsonKey(name: 'HasConnected') bool hasConnected,@JsonKey(name: 'FtaNotes') String ftaNotes
});




}
/// @nodoc
class __$CheesyTeamCopyWithImpl<$Res>
    implements _$CheesyTeamCopyWith<$Res> {
  __$CheesyTeamCopyWithImpl(this._self, this._then);

  final _CheesyTeam _self;
  final $Res Function(_CheesyTeam) _then;

/// Create a copy of CheesyTeam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nickname = null,Object? city = null,Object? stateProv = null,Object? country = null,Object? schoolName = null,Object? rookieYear = null,Object? robotName = null,Object? yellowCard = null,Object? hasConnected = null,Object? ftaNotes = null,}) {
  return _then(_CheesyTeam(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,stateProv: null == stateProv ? _self.stateProv : stateProv // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,rookieYear: null == rookieYear ? _self.rookieYear : rookieYear // ignore: cast_nullable_to_non_nullable
as int,robotName: null == robotName ? _self.robotName : robotName // ignore: cast_nullable_to_non_nullable
as String,yellowCard: null == yellowCard ? _self.yellowCard : yellowCard // ignore: cast_nullable_to_non_nullable
as bool,hasConnected: null == hasConnected ? _self.hasConnected : hasConnected // ignore: cast_nullable_to_non_nullable
as bool,ftaNotes: null == ftaNotes ? _self.ftaNotes : ftaNotes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CheesyRealtimeScore {

@JsonKey(name: 'Red') CheesyAllianceScore get red;@JsonKey(name: 'Blue') CheesyAllianceScore get blue;@JsonKey(name: 'RedCards') Map<String, String> get redCards;@JsonKey(name: 'BlueCards') Map<String, String> get blueCards;@JsonKey(name: 'MatchState') int get matchState;
/// Create a copy of CheesyRealtimeScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyRealtimeScoreCopyWith<CheesyRealtimeScore> get copyWith => _$CheesyRealtimeScoreCopyWithImpl<CheesyRealtimeScore>(this as CheesyRealtimeScore, _$identity);

  /// Serializes this CheesyRealtimeScore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyRealtimeScore&&(identical(other.red, red) || other.red == red)&&(identical(other.blue, blue) || other.blue == blue)&&const DeepCollectionEquality().equals(other.redCards, redCards)&&const DeepCollectionEquality().equals(other.blueCards, blueCards)&&(identical(other.matchState, matchState) || other.matchState == matchState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,red,blue,const DeepCollectionEquality().hash(redCards),const DeepCollectionEquality().hash(blueCards),matchState);

@override
String toString() {
  return 'CheesyRealtimeScore(red: $red, blue: $blue, redCards: $redCards, blueCards: $blueCards, matchState: $matchState)';
}


}

/// @nodoc
abstract mixin class $CheesyRealtimeScoreCopyWith<$Res>  {
  factory $CheesyRealtimeScoreCopyWith(CheesyRealtimeScore value, $Res Function(CheesyRealtimeScore) _then) = _$CheesyRealtimeScoreCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Red') CheesyAllianceScore red,@JsonKey(name: 'Blue') CheesyAllianceScore blue,@JsonKey(name: 'RedCards') Map<String, String> redCards,@JsonKey(name: 'BlueCards') Map<String, String> blueCards,@JsonKey(name: 'MatchState') int matchState
});


$CheesyAllianceScoreCopyWith<$Res> get red;$CheesyAllianceScoreCopyWith<$Res> get blue;

}
/// @nodoc
class _$CheesyRealtimeScoreCopyWithImpl<$Res>
    implements $CheesyRealtimeScoreCopyWith<$Res> {
  _$CheesyRealtimeScoreCopyWithImpl(this._self, this._then);

  final CheesyRealtimeScore _self;
  final $Res Function(CheesyRealtimeScore) _then;

/// Create a copy of CheesyRealtimeScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? red = null,Object? blue = null,Object? redCards = null,Object? blueCards = null,Object? matchState = null,}) {
  return _then(_self.copyWith(
red: null == red ? _self.red : red // ignore: cast_nullable_to_non_nullable
as CheesyAllianceScore,blue: null == blue ? _self.blue : blue // ignore: cast_nullable_to_non_nullable
as CheesyAllianceScore,redCards: null == redCards ? _self.redCards : redCards // ignore: cast_nullable_to_non_nullable
as Map<String, String>,blueCards: null == blueCards ? _self.blueCards : blueCards // ignore: cast_nullable_to_non_nullable
as Map<String, String>,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CheesyRealtimeScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyAllianceScoreCopyWith<$Res> get red {
  
  return $CheesyAllianceScoreCopyWith<$Res>(_self.red, (value) {
    return _then(_self.copyWith(red: value));
  });
}/// Create a copy of CheesyRealtimeScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyAllianceScoreCopyWith<$Res> get blue {
  
  return $CheesyAllianceScoreCopyWith<$Res>(_self.blue, (value) {
    return _then(_self.copyWith(blue: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheesyRealtimeScore].
extension CheesyRealtimeScorePatterns on CheesyRealtimeScore {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyRealtimeScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyRealtimeScore() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyRealtimeScore value)  $default,){
final _that = this;
switch (_that) {
case _CheesyRealtimeScore():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyRealtimeScore value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyRealtimeScore() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Red')  CheesyAllianceScore red, @JsonKey(name: 'Blue')  CheesyAllianceScore blue, @JsonKey(name: 'RedCards')  Map<String, String> redCards, @JsonKey(name: 'BlueCards')  Map<String, String> blueCards, @JsonKey(name: 'MatchState')  int matchState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyRealtimeScore() when $default != null:
return $default(_that.red,_that.blue,_that.redCards,_that.blueCards,_that.matchState);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Red')  CheesyAllianceScore red, @JsonKey(name: 'Blue')  CheesyAllianceScore blue, @JsonKey(name: 'RedCards')  Map<String, String> redCards, @JsonKey(name: 'BlueCards')  Map<String, String> blueCards, @JsonKey(name: 'MatchState')  int matchState)  $default,) {final _that = this;
switch (_that) {
case _CheesyRealtimeScore():
return $default(_that.red,_that.blue,_that.redCards,_that.blueCards,_that.matchState);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Red')  CheesyAllianceScore red, @JsonKey(name: 'Blue')  CheesyAllianceScore blue, @JsonKey(name: 'RedCards')  Map<String, String> redCards, @JsonKey(name: 'BlueCards')  Map<String, String> blueCards, @JsonKey(name: 'MatchState')  int matchState)?  $default,) {final _that = this;
switch (_that) {
case _CheesyRealtimeScore() when $default != null:
return $default(_that.red,_that.blue,_that.redCards,_that.blueCards,_that.matchState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyRealtimeScore implements CheesyRealtimeScore {
  const _CheesyRealtimeScore({@JsonKey(name: 'Red') required this.red, @JsonKey(name: 'Blue') required this.blue, @JsonKey(name: 'RedCards') final  Map<String, String> redCards = const {}, @JsonKey(name: 'BlueCards') final  Map<String, String> blueCards = const {}, @JsonKey(name: 'MatchState') this.matchState = 0}): _redCards = redCards,_blueCards = blueCards;
  factory _CheesyRealtimeScore.fromJson(Map<String, dynamic> json) => _$CheesyRealtimeScoreFromJson(json);

@override@JsonKey(name: 'Red') final  CheesyAllianceScore red;
@override@JsonKey(name: 'Blue') final  CheesyAllianceScore blue;
 final  Map<String, String> _redCards;
@override@JsonKey(name: 'RedCards') Map<String, String> get redCards {
  if (_redCards is EqualUnmodifiableMapView) return _redCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_redCards);
}

 final  Map<String, String> _blueCards;
@override@JsonKey(name: 'BlueCards') Map<String, String> get blueCards {
  if (_blueCards is EqualUnmodifiableMapView) return _blueCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_blueCards);
}

@override@JsonKey(name: 'MatchState') final  int matchState;

/// Create a copy of CheesyRealtimeScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyRealtimeScoreCopyWith<_CheesyRealtimeScore> get copyWith => __$CheesyRealtimeScoreCopyWithImpl<_CheesyRealtimeScore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyRealtimeScoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyRealtimeScore&&(identical(other.red, red) || other.red == red)&&(identical(other.blue, blue) || other.blue == blue)&&const DeepCollectionEquality().equals(other._redCards, _redCards)&&const DeepCollectionEquality().equals(other._blueCards, _blueCards)&&(identical(other.matchState, matchState) || other.matchState == matchState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,red,blue,const DeepCollectionEquality().hash(_redCards),const DeepCollectionEquality().hash(_blueCards),matchState);

@override
String toString() {
  return 'CheesyRealtimeScore(red: $red, blue: $blue, redCards: $redCards, blueCards: $blueCards, matchState: $matchState)';
}


}

/// @nodoc
abstract mixin class _$CheesyRealtimeScoreCopyWith<$Res> implements $CheesyRealtimeScoreCopyWith<$Res> {
  factory _$CheesyRealtimeScoreCopyWith(_CheesyRealtimeScore value, $Res Function(_CheesyRealtimeScore) _then) = __$CheesyRealtimeScoreCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Red') CheesyAllianceScore red,@JsonKey(name: 'Blue') CheesyAllianceScore blue,@JsonKey(name: 'RedCards') Map<String, String> redCards,@JsonKey(name: 'BlueCards') Map<String, String> blueCards,@JsonKey(name: 'MatchState') int matchState
});


@override $CheesyAllianceScoreCopyWith<$Res> get red;@override $CheesyAllianceScoreCopyWith<$Res> get blue;

}
/// @nodoc
class __$CheesyRealtimeScoreCopyWithImpl<$Res>
    implements _$CheesyRealtimeScoreCopyWith<$Res> {
  __$CheesyRealtimeScoreCopyWithImpl(this._self, this._then);

  final _CheesyRealtimeScore _self;
  final $Res Function(_CheesyRealtimeScore) _then;

/// Create a copy of CheesyRealtimeScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? red = null,Object? blue = null,Object? redCards = null,Object? blueCards = null,Object? matchState = null,}) {
  return _then(_CheesyRealtimeScore(
red: null == red ? _self.red : red // ignore: cast_nullable_to_non_nullable
as CheesyAllianceScore,blue: null == blue ? _self.blue : blue // ignore: cast_nullable_to_non_nullable
as CheesyAllianceScore,redCards: null == redCards ? _self._redCards : redCards // ignore: cast_nullable_to_non_nullable
as Map<String, String>,blueCards: null == blueCards ? _self._blueCards : blueCards // ignore: cast_nullable_to_non_nullable
as Map<String, String>,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CheesyRealtimeScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyAllianceScoreCopyWith<$Res> get red {
  
  return $CheesyAllianceScoreCopyWith<$Res>(_self.red, (value) {
    return _then(_self.copyWith(red: value));
  });
}/// Create a copy of CheesyRealtimeScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyAllianceScoreCopyWith<$Res> get blue {
  
  return $CheesyAllianceScoreCopyWith<$Res>(_self.blue, (value) {
    return _then(_self.copyWith(blue: value));
  });
}
}


/// @nodoc
mixin _$CheesyAllianceScore {

@JsonKey(name: 'Score') Map<String, dynamic> get score;@JsonKey(name: 'ScoreSummary') CheesyScoreSummary get scoreSummary;@JsonKey(name: 'ActiveRemainingSec') int get activeRemainingSec;@JsonKey(name: 'ActiveDurationSec') int get activeDurationSec;
/// Create a copy of CheesyAllianceScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyAllianceScoreCopyWith<CheesyAllianceScore> get copyWith => _$CheesyAllianceScoreCopyWithImpl<CheesyAllianceScore>(this as CheesyAllianceScore, _$identity);

  /// Serializes this CheesyAllianceScore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyAllianceScore&&const DeepCollectionEquality().equals(other.score, score)&&(identical(other.scoreSummary, scoreSummary) || other.scoreSummary == scoreSummary)&&(identical(other.activeRemainingSec, activeRemainingSec) || other.activeRemainingSec == activeRemainingSec)&&(identical(other.activeDurationSec, activeDurationSec) || other.activeDurationSec == activeDurationSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(score),scoreSummary,activeRemainingSec,activeDurationSec);

@override
String toString() {
  return 'CheesyAllianceScore(score: $score, scoreSummary: $scoreSummary, activeRemainingSec: $activeRemainingSec, activeDurationSec: $activeDurationSec)';
}


}

/// @nodoc
abstract mixin class $CheesyAllianceScoreCopyWith<$Res>  {
  factory $CheesyAllianceScoreCopyWith(CheesyAllianceScore value, $Res Function(CheesyAllianceScore) _then) = _$CheesyAllianceScoreCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Score') Map<String, dynamic> score,@JsonKey(name: 'ScoreSummary') CheesyScoreSummary scoreSummary,@JsonKey(name: 'ActiveRemainingSec') int activeRemainingSec,@JsonKey(name: 'ActiveDurationSec') int activeDurationSec
});


$CheesyScoreSummaryCopyWith<$Res> get scoreSummary;

}
/// @nodoc
class _$CheesyAllianceScoreCopyWithImpl<$Res>
    implements $CheesyAllianceScoreCopyWith<$Res> {
  _$CheesyAllianceScoreCopyWithImpl(this._self, this._then);

  final CheesyAllianceScore _self;
  final $Res Function(CheesyAllianceScore) _then;

/// Create a copy of CheesyAllianceScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? scoreSummary = null,Object? activeRemainingSec = null,Object? activeDurationSec = null,}) {
  return _then(_self.copyWith(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,scoreSummary: null == scoreSummary ? _self.scoreSummary : scoreSummary // ignore: cast_nullable_to_non_nullable
as CheesyScoreSummary,activeRemainingSec: null == activeRemainingSec ? _self.activeRemainingSec : activeRemainingSec // ignore: cast_nullable_to_non_nullable
as int,activeDurationSec: null == activeDurationSec ? _self.activeDurationSec : activeDurationSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CheesyAllianceScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyScoreSummaryCopyWith<$Res> get scoreSummary {
  
  return $CheesyScoreSummaryCopyWith<$Res>(_self.scoreSummary, (value) {
    return _then(_self.copyWith(scoreSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheesyAllianceScore].
extension CheesyAllianceScorePatterns on CheesyAllianceScore {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyAllianceScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyAllianceScore() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyAllianceScore value)  $default,){
final _that = this;
switch (_that) {
case _CheesyAllianceScore():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyAllianceScore value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyAllianceScore() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Score')  Map<String, dynamic> score, @JsonKey(name: 'ScoreSummary')  CheesyScoreSummary scoreSummary, @JsonKey(name: 'ActiveRemainingSec')  int activeRemainingSec, @JsonKey(name: 'ActiveDurationSec')  int activeDurationSec)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyAllianceScore() when $default != null:
return $default(_that.score,_that.scoreSummary,_that.activeRemainingSec,_that.activeDurationSec);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Score')  Map<String, dynamic> score, @JsonKey(name: 'ScoreSummary')  CheesyScoreSummary scoreSummary, @JsonKey(name: 'ActiveRemainingSec')  int activeRemainingSec, @JsonKey(name: 'ActiveDurationSec')  int activeDurationSec)  $default,) {final _that = this;
switch (_that) {
case _CheesyAllianceScore():
return $default(_that.score,_that.scoreSummary,_that.activeRemainingSec,_that.activeDurationSec);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Score')  Map<String, dynamic> score, @JsonKey(name: 'ScoreSummary')  CheesyScoreSummary scoreSummary, @JsonKey(name: 'ActiveRemainingSec')  int activeRemainingSec, @JsonKey(name: 'ActiveDurationSec')  int activeDurationSec)?  $default,) {final _that = this;
switch (_that) {
case _CheesyAllianceScore() when $default != null:
return $default(_that.score,_that.scoreSummary,_that.activeRemainingSec,_that.activeDurationSec);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyAllianceScore implements CheesyAllianceScore {
  const _CheesyAllianceScore({@JsonKey(name: 'Score') final  Map<String, dynamic> score = const {}, @JsonKey(name: 'ScoreSummary') required this.scoreSummary, @JsonKey(name: 'ActiveRemainingSec') this.activeRemainingSec = 0, @JsonKey(name: 'ActiveDurationSec') this.activeDurationSec = 0}): _score = score;
  factory _CheesyAllianceScore.fromJson(Map<String, dynamic> json) => _$CheesyAllianceScoreFromJson(json);

 final  Map<String, dynamic> _score;
@override@JsonKey(name: 'Score') Map<String, dynamic> get score {
  if (_score is EqualUnmodifiableMapView) return _score;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_score);
}

@override@JsonKey(name: 'ScoreSummary') final  CheesyScoreSummary scoreSummary;
@override@JsonKey(name: 'ActiveRemainingSec') final  int activeRemainingSec;
@override@JsonKey(name: 'ActiveDurationSec') final  int activeDurationSec;

/// Create a copy of CheesyAllianceScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyAllianceScoreCopyWith<_CheesyAllianceScore> get copyWith => __$CheesyAllianceScoreCopyWithImpl<_CheesyAllianceScore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyAllianceScoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyAllianceScore&&const DeepCollectionEquality().equals(other._score, _score)&&(identical(other.scoreSummary, scoreSummary) || other.scoreSummary == scoreSummary)&&(identical(other.activeRemainingSec, activeRemainingSec) || other.activeRemainingSec == activeRemainingSec)&&(identical(other.activeDurationSec, activeDurationSec) || other.activeDurationSec == activeDurationSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_score),scoreSummary,activeRemainingSec,activeDurationSec);

@override
String toString() {
  return 'CheesyAllianceScore(score: $score, scoreSummary: $scoreSummary, activeRemainingSec: $activeRemainingSec, activeDurationSec: $activeDurationSec)';
}


}

/// @nodoc
abstract mixin class _$CheesyAllianceScoreCopyWith<$Res> implements $CheesyAllianceScoreCopyWith<$Res> {
  factory _$CheesyAllianceScoreCopyWith(_CheesyAllianceScore value, $Res Function(_CheesyAllianceScore) _then) = __$CheesyAllianceScoreCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Score') Map<String, dynamic> score,@JsonKey(name: 'ScoreSummary') CheesyScoreSummary scoreSummary,@JsonKey(name: 'ActiveRemainingSec') int activeRemainingSec,@JsonKey(name: 'ActiveDurationSec') int activeDurationSec
});


@override $CheesyScoreSummaryCopyWith<$Res> get scoreSummary;

}
/// @nodoc
class __$CheesyAllianceScoreCopyWithImpl<$Res>
    implements _$CheesyAllianceScoreCopyWith<$Res> {
  __$CheesyAllianceScoreCopyWithImpl(this._self, this._then);

  final _CheesyAllianceScore _self;
  final $Res Function(_CheesyAllianceScore) _then;

/// Create a copy of CheesyAllianceScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? scoreSummary = null,Object? activeRemainingSec = null,Object? activeDurationSec = null,}) {
  return _then(_CheesyAllianceScore(
score: null == score ? _self._score : score // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,scoreSummary: null == scoreSummary ? _self.scoreSummary : scoreSummary // ignore: cast_nullable_to_non_nullable
as CheesyScoreSummary,activeRemainingSec: null == activeRemainingSec ? _self.activeRemainingSec : activeRemainingSec // ignore: cast_nullable_to_non_nullable
as int,activeDurationSec: null == activeDurationSec ? _self.activeDurationSec : activeDurationSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CheesyAllianceScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyScoreSummaryCopyWith<$Res> get scoreSummary {
  
  return $CheesyScoreSummaryCopyWith<$Res>(_self.scoreSummary, (value) {
    return _then(_self.copyWith(scoreSummary: value));
  });
}
}


/// @nodoc
mixin _$CheesyGameScore {

@JsonKey(name: 'RobotsBypassed') List<bool> get robotsBypassed;@JsonKey(name: 'LeaveStatuses') List<bool> get leaveStatuses;@JsonKey(name: 'Reef') CheesyReef get reef;@JsonKey(name: 'BargeAlgae') int get bargeAlgae;@JsonKey(name: 'ProcessorAlgae') int get processorAlgae;@JsonKey(name: 'EndgameStatuses') List<int> get endgameStatuses;@JsonKey(name: 'Fouls') List<CheesyFoul> get fouls;@JsonKey(name: 'PlayoffDq') bool get playoffDq;
/// Create a copy of CheesyGameScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyGameScoreCopyWith<CheesyGameScore> get copyWith => _$CheesyGameScoreCopyWithImpl<CheesyGameScore>(this as CheesyGameScore, _$identity);

  /// Serializes this CheesyGameScore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyGameScore&&const DeepCollectionEquality().equals(other.robotsBypassed, robotsBypassed)&&const DeepCollectionEquality().equals(other.leaveStatuses, leaveStatuses)&&(identical(other.reef, reef) || other.reef == reef)&&(identical(other.bargeAlgae, bargeAlgae) || other.bargeAlgae == bargeAlgae)&&(identical(other.processorAlgae, processorAlgae) || other.processorAlgae == processorAlgae)&&const DeepCollectionEquality().equals(other.endgameStatuses, endgameStatuses)&&const DeepCollectionEquality().equals(other.fouls, fouls)&&(identical(other.playoffDq, playoffDq) || other.playoffDq == playoffDq));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(robotsBypassed),const DeepCollectionEquality().hash(leaveStatuses),reef,bargeAlgae,processorAlgae,const DeepCollectionEquality().hash(endgameStatuses),const DeepCollectionEquality().hash(fouls),playoffDq);

@override
String toString() {
  return 'CheesyGameScore(robotsBypassed: $robotsBypassed, leaveStatuses: $leaveStatuses, reef: $reef, bargeAlgae: $bargeAlgae, processorAlgae: $processorAlgae, endgameStatuses: $endgameStatuses, fouls: $fouls, playoffDq: $playoffDq)';
}


}

/// @nodoc
abstract mixin class $CheesyGameScoreCopyWith<$Res>  {
  factory $CheesyGameScoreCopyWith(CheesyGameScore value, $Res Function(CheesyGameScore) _then) = _$CheesyGameScoreCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'RobotsBypassed') List<bool> robotsBypassed,@JsonKey(name: 'LeaveStatuses') List<bool> leaveStatuses,@JsonKey(name: 'Reef') CheesyReef reef,@JsonKey(name: 'BargeAlgae') int bargeAlgae,@JsonKey(name: 'ProcessorAlgae') int processorAlgae,@JsonKey(name: 'EndgameStatuses') List<int> endgameStatuses,@JsonKey(name: 'Fouls') List<CheesyFoul> fouls,@JsonKey(name: 'PlayoffDq') bool playoffDq
});


$CheesyReefCopyWith<$Res> get reef;

}
/// @nodoc
class _$CheesyGameScoreCopyWithImpl<$Res>
    implements $CheesyGameScoreCopyWith<$Res> {
  _$CheesyGameScoreCopyWithImpl(this._self, this._then);

  final CheesyGameScore _self;
  final $Res Function(CheesyGameScore) _then;

/// Create a copy of CheesyGameScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? robotsBypassed = null,Object? leaveStatuses = null,Object? reef = null,Object? bargeAlgae = null,Object? processorAlgae = null,Object? endgameStatuses = null,Object? fouls = null,Object? playoffDq = null,}) {
  return _then(_self.copyWith(
robotsBypassed: null == robotsBypassed ? _self.robotsBypassed : robotsBypassed // ignore: cast_nullable_to_non_nullable
as List<bool>,leaveStatuses: null == leaveStatuses ? _self.leaveStatuses : leaveStatuses // ignore: cast_nullable_to_non_nullable
as List<bool>,reef: null == reef ? _self.reef : reef // ignore: cast_nullable_to_non_nullable
as CheesyReef,bargeAlgae: null == bargeAlgae ? _self.bargeAlgae : bargeAlgae // ignore: cast_nullable_to_non_nullable
as int,processorAlgae: null == processorAlgae ? _self.processorAlgae : processorAlgae // ignore: cast_nullable_to_non_nullable
as int,endgameStatuses: null == endgameStatuses ? _self.endgameStatuses : endgameStatuses // ignore: cast_nullable_to_non_nullable
as List<int>,fouls: null == fouls ? _self.fouls : fouls // ignore: cast_nullable_to_non_nullable
as List<CheesyFoul>,playoffDq: null == playoffDq ? _self.playoffDq : playoffDq // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CheesyGameScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyReefCopyWith<$Res> get reef {
  
  return $CheesyReefCopyWith<$Res>(_self.reef, (value) {
    return _then(_self.copyWith(reef: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheesyGameScore].
extension CheesyGameScorePatterns on CheesyGameScore {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyGameScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyGameScore() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyGameScore value)  $default,){
final _that = this;
switch (_that) {
case _CheesyGameScore():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyGameScore value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyGameScore() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'RobotsBypassed')  List<bool> robotsBypassed, @JsonKey(name: 'LeaveStatuses')  List<bool> leaveStatuses, @JsonKey(name: 'Reef')  CheesyReef reef, @JsonKey(name: 'BargeAlgae')  int bargeAlgae, @JsonKey(name: 'ProcessorAlgae')  int processorAlgae, @JsonKey(name: 'EndgameStatuses')  List<int> endgameStatuses, @JsonKey(name: 'Fouls')  List<CheesyFoul> fouls, @JsonKey(name: 'PlayoffDq')  bool playoffDq)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyGameScore() when $default != null:
return $default(_that.robotsBypassed,_that.leaveStatuses,_that.reef,_that.bargeAlgae,_that.processorAlgae,_that.endgameStatuses,_that.fouls,_that.playoffDq);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'RobotsBypassed')  List<bool> robotsBypassed, @JsonKey(name: 'LeaveStatuses')  List<bool> leaveStatuses, @JsonKey(name: 'Reef')  CheesyReef reef, @JsonKey(name: 'BargeAlgae')  int bargeAlgae, @JsonKey(name: 'ProcessorAlgae')  int processorAlgae, @JsonKey(name: 'EndgameStatuses')  List<int> endgameStatuses, @JsonKey(name: 'Fouls')  List<CheesyFoul> fouls, @JsonKey(name: 'PlayoffDq')  bool playoffDq)  $default,) {final _that = this;
switch (_that) {
case _CheesyGameScore():
return $default(_that.robotsBypassed,_that.leaveStatuses,_that.reef,_that.bargeAlgae,_that.processorAlgae,_that.endgameStatuses,_that.fouls,_that.playoffDq);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'RobotsBypassed')  List<bool> robotsBypassed, @JsonKey(name: 'LeaveStatuses')  List<bool> leaveStatuses, @JsonKey(name: 'Reef')  CheesyReef reef, @JsonKey(name: 'BargeAlgae')  int bargeAlgae, @JsonKey(name: 'ProcessorAlgae')  int processorAlgae, @JsonKey(name: 'EndgameStatuses')  List<int> endgameStatuses, @JsonKey(name: 'Fouls')  List<CheesyFoul> fouls, @JsonKey(name: 'PlayoffDq')  bool playoffDq)?  $default,) {final _that = this;
switch (_that) {
case _CheesyGameScore() when $default != null:
return $default(_that.robotsBypassed,_that.leaveStatuses,_that.reef,_that.bargeAlgae,_that.processorAlgae,_that.endgameStatuses,_that.fouls,_that.playoffDq);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyGameScore implements CheesyGameScore {
  const _CheesyGameScore({@JsonKey(name: 'RobotsBypassed') required final  List<bool> robotsBypassed, @JsonKey(name: 'LeaveStatuses') required final  List<bool> leaveStatuses, @JsonKey(name: 'Reef') required this.reef, @JsonKey(name: 'BargeAlgae') this.bargeAlgae = 0, @JsonKey(name: 'ProcessorAlgae') this.processorAlgae = 0, @JsonKey(name: 'EndgameStatuses') required final  List<int> endgameStatuses, @JsonKey(name: 'Fouls') final  List<CheesyFoul> fouls = const [], @JsonKey(name: 'PlayoffDq') this.playoffDq = false}): _robotsBypassed = robotsBypassed,_leaveStatuses = leaveStatuses,_endgameStatuses = endgameStatuses,_fouls = fouls;
  factory _CheesyGameScore.fromJson(Map<String, dynamic> json) => _$CheesyGameScoreFromJson(json);

 final  List<bool> _robotsBypassed;
@override@JsonKey(name: 'RobotsBypassed') List<bool> get robotsBypassed {
  if (_robotsBypassed is EqualUnmodifiableListView) return _robotsBypassed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_robotsBypassed);
}

 final  List<bool> _leaveStatuses;
@override@JsonKey(name: 'LeaveStatuses') List<bool> get leaveStatuses {
  if (_leaveStatuses is EqualUnmodifiableListView) return _leaveStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leaveStatuses);
}

@override@JsonKey(name: 'Reef') final  CheesyReef reef;
@override@JsonKey(name: 'BargeAlgae') final  int bargeAlgae;
@override@JsonKey(name: 'ProcessorAlgae') final  int processorAlgae;
 final  List<int> _endgameStatuses;
@override@JsonKey(name: 'EndgameStatuses') List<int> get endgameStatuses {
  if (_endgameStatuses is EqualUnmodifiableListView) return _endgameStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_endgameStatuses);
}

 final  List<CheesyFoul> _fouls;
@override@JsonKey(name: 'Fouls') List<CheesyFoul> get fouls {
  if (_fouls is EqualUnmodifiableListView) return _fouls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fouls);
}

@override@JsonKey(name: 'PlayoffDq') final  bool playoffDq;

/// Create a copy of CheesyGameScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyGameScoreCopyWith<_CheesyGameScore> get copyWith => __$CheesyGameScoreCopyWithImpl<_CheesyGameScore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyGameScoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyGameScore&&const DeepCollectionEquality().equals(other._robotsBypassed, _robotsBypassed)&&const DeepCollectionEquality().equals(other._leaveStatuses, _leaveStatuses)&&(identical(other.reef, reef) || other.reef == reef)&&(identical(other.bargeAlgae, bargeAlgae) || other.bargeAlgae == bargeAlgae)&&(identical(other.processorAlgae, processorAlgae) || other.processorAlgae == processorAlgae)&&const DeepCollectionEquality().equals(other._endgameStatuses, _endgameStatuses)&&const DeepCollectionEquality().equals(other._fouls, _fouls)&&(identical(other.playoffDq, playoffDq) || other.playoffDq == playoffDq));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_robotsBypassed),const DeepCollectionEquality().hash(_leaveStatuses),reef,bargeAlgae,processorAlgae,const DeepCollectionEquality().hash(_endgameStatuses),const DeepCollectionEquality().hash(_fouls),playoffDq);

@override
String toString() {
  return 'CheesyGameScore(robotsBypassed: $robotsBypassed, leaveStatuses: $leaveStatuses, reef: $reef, bargeAlgae: $bargeAlgae, processorAlgae: $processorAlgae, endgameStatuses: $endgameStatuses, fouls: $fouls, playoffDq: $playoffDq)';
}


}

/// @nodoc
abstract mixin class _$CheesyGameScoreCopyWith<$Res> implements $CheesyGameScoreCopyWith<$Res> {
  factory _$CheesyGameScoreCopyWith(_CheesyGameScore value, $Res Function(_CheesyGameScore) _then) = __$CheesyGameScoreCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'RobotsBypassed') List<bool> robotsBypassed,@JsonKey(name: 'LeaveStatuses') List<bool> leaveStatuses,@JsonKey(name: 'Reef') CheesyReef reef,@JsonKey(name: 'BargeAlgae') int bargeAlgae,@JsonKey(name: 'ProcessorAlgae') int processorAlgae,@JsonKey(name: 'EndgameStatuses') List<int> endgameStatuses,@JsonKey(name: 'Fouls') List<CheesyFoul> fouls,@JsonKey(name: 'PlayoffDq') bool playoffDq
});


@override $CheesyReefCopyWith<$Res> get reef;

}
/// @nodoc
class __$CheesyGameScoreCopyWithImpl<$Res>
    implements _$CheesyGameScoreCopyWith<$Res> {
  __$CheesyGameScoreCopyWithImpl(this._self, this._then);

  final _CheesyGameScore _self;
  final $Res Function(_CheesyGameScore) _then;

/// Create a copy of CheesyGameScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? robotsBypassed = null,Object? leaveStatuses = null,Object? reef = null,Object? bargeAlgae = null,Object? processorAlgae = null,Object? endgameStatuses = null,Object? fouls = null,Object? playoffDq = null,}) {
  return _then(_CheesyGameScore(
robotsBypassed: null == robotsBypassed ? _self._robotsBypassed : robotsBypassed // ignore: cast_nullable_to_non_nullable
as List<bool>,leaveStatuses: null == leaveStatuses ? _self._leaveStatuses : leaveStatuses // ignore: cast_nullable_to_non_nullable
as List<bool>,reef: null == reef ? _self.reef : reef // ignore: cast_nullable_to_non_nullable
as CheesyReef,bargeAlgae: null == bargeAlgae ? _self.bargeAlgae : bargeAlgae // ignore: cast_nullable_to_non_nullable
as int,processorAlgae: null == processorAlgae ? _self.processorAlgae : processorAlgae // ignore: cast_nullable_to_non_nullable
as int,endgameStatuses: null == endgameStatuses ? _self._endgameStatuses : endgameStatuses // ignore: cast_nullable_to_non_nullable
as List<int>,fouls: null == fouls ? _self._fouls : fouls // ignore: cast_nullable_to_non_nullable
as List<CheesyFoul>,playoffDq: null == playoffDq ? _self.playoffDq : playoffDq // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CheesyGameScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyReefCopyWith<$Res> get reef {
  
  return $CheesyReefCopyWith<$Res>(_self.reef, (value) {
    return _then(_self.copyWith(reef: value));
  });
}
}


/// @nodoc
mixin _$CheesyReef {

@JsonKey(name: 'AutoBranches') List<List<bool>> get autoBranches;@JsonKey(name: 'Branches') List<List<bool>> get branches;@JsonKey(name: 'AutoTroughNear') int get autoTroughNear;@JsonKey(name: 'AutoTroughFar') int get autoTroughFar;@JsonKey(name: 'TroughNear') int get troughNear;@JsonKey(name: 'TroughFar') int get troughFar;
/// Create a copy of CheesyReef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyReefCopyWith<CheesyReef> get copyWith => _$CheesyReefCopyWithImpl<CheesyReef>(this as CheesyReef, _$identity);

  /// Serializes this CheesyReef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyReef&&const DeepCollectionEquality().equals(other.autoBranches, autoBranches)&&const DeepCollectionEquality().equals(other.branches, branches)&&(identical(other.autoTroughNear, autoTroughNear) || other.autoTroughNear == autoTroughNear)&&(identical(other.autoTroughFar, autoTroughFar) || other.autoTroughFar == autoTroughFar)&&(identical(other.troughNear, troughNear) || other.troughNear == troughNear)&&(identical(other.troughFar, troughFar) || other.troughFar == troughFar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(autoBranches),const DeepCollectionEquality().hash(branches),autoTroughNear,autoTroughFar,troughNear,troughFar);

@override
String toString() {
  return 'CheesyReef(autoBranches: $autoBranches, branches: $branches, autoTroughNear: $autoTroughNear, autoTroughFar: $autoTroughFar, troughNear: $troughNear, troughFar: $troughFar)';
}


}

/// @nodoc
abstract mixin class $CheesyReefCopyWith<$Res>  {
  factory $CheesyReefCopyWith(CheesyReef value, $Res Function(CheesyReef) _then) = _$CheesyReefCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'AutoBranches') List<List<bool>> autoBranches,@JsonKey(name: 'Branches') List<List<bool>> branches,@JsonKey(name: 'AutoTroughNear') int autoTroughNear,@JsonKey(name: 'AutoTroughFar') int autoTroughFar,@JsonKey(name: 'TroughNear') int troughNear,@JsonKey(name: 'TroughFar') int troughFar
});




}
/// @nodoc
class _$CheesyReefCopyWithImpl<$Res>
    implements $CheesyReefCopyWith<$Res> {
  _$CheesyReefCopyWithImpl(this._self, this._then);

  final CheesyReef _self;
  final $Res Function(CheesyReef) _then;

/// Create a copy of CheesyReef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? autoBranches = null,Object? branches = null,Object? autoTroughNear = null,Object? autoTroughFar = null,Object? troughNear = null,Object? troughFar = null,}) {
  return _then(_self.copyWith(
autoBranches: null == autoBranches ? _self.autoBranches : autoBranches // ignore: cast_nullable_to_non_nullable
as List<List<bool>>,branches: null == branches ? _self.branches : branches // ignore: cast_nullable_to_non_nullable
as List<List<bool>>,autoTroughNear: null == autoTroughNear ? _self.autoTroughNear : autoTroughNear // ignore: cast_nullable_to_non_nullable
as int,autoTroughFar: null == autoTroughFar ? _self.autoTroughFar : autoTroughFar // ignore: cast_nullable_to_non_nullable
as int,troughNear: null == troughNear ? _self.troughNear : troughNear // ignore: cast_nullable_to_non_nullable
as int,troughFar: null == troughFar ? _self.troughFar : troughFar // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyReef].
extension CheesyReefPatterns on CheesyReef {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyReef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyReef() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyReef value)  $default,){
final _that = this;
switch (_that) {
case _CheesyReef():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyReef value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyReef() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'AutoBranches')  List<List<bool>> autoBranches, @JsonKey(name: 'Branches')  List<List<bool>> branches, @JsonKey(name: 'AutoTroughNear')  int autoTroughNear, @JsonKey(name: 'AutoTroughFar')  int autoTroughFar, @JsonKey(name: 'TroughNear')  int troughNear, @JsonKey(name: 'TroughFar')  int troughFar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyReef() when $default != null:
return $default(_that.autoBranches,_that.branches,_that.autoTroughNear,_that.autoTroughFar,_that.troughNear,_that.troughFar);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'AutoBranches')  List<List<bool>> autoBranches, @JsonKey(name: 'Branches')  List<List<bool>> branches, @JsonKey(name: 'AutoTroughNear')  int autoTroughNear, @JsonKey(name: 'AutoTroughFar')  int autoTroughFar, @JsonKey(name: 'TroughNear')  int troughNear, @JsonKey(name: 'TroughFar')  int troughFar)  $default,) {final _that = this;
switch (_that) {
case _CheesyReef():
return $default(_that.autoBranches,_that.branches,_that.autoTroughNear,_that.autoTroughFar,_that.troughNear,_that.troughFar);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'AutoBranches')  List<List<bool>> autoBranches, @JsonKey(name: 'Branches')  List<List<bool>> branches, @JsonKey(name: 'AutoTroughNear')  int autoTroughNear, @JsonKey(name: 'AutoTroughFar')  int autoTroughFar, @JsonKey(name: 'TroughNear')  int troughNear, @JsonKey(name: 'TroughFar')  int troughFar)?  $default,) {final _that = this;
switch (_that) {
case _CheesyReef() when $default != null:
return $default(_that.autoBranches,_that.branches,_that.autoTroughNear,_that.autoTroughFar,_that.troughNear,_that.troughFar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyReef implements CheesyReef {
  const _CheesyReef({@JsonKey(name: 'AutoBranches') required final  List<List<bool>> autoBranches, @JsonKey(name: 'Branches') required final  List<List<bool>> branches, @JsonKey(name: 'AutoTroughNear') this.autoTroughNear = 0, @JsonKey(name: 'AutoTroughFar') this.autoTroughFar = 0, @JsonKey(name: 'TroughNear') this.troughNear = 0, @JsonKey(name: 'TroughFar') this.troughFar = 0}): _autoBranches = autoBranches,_branches = branches;
  factory _CheesyReef.fromJson(Map<String, dynamic> json) => _$CheesyReefFromJson(json);

 final  List<List<bool>> _autoBranches;
@override@JsonKey(name: 'AutoBranches') List<List<bool>> get autoBranches {
  if (_autoBranches is EqualUnmodifiableListView) return _autoBranches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_autoBranches);
}

 final  List<List<bool>> _branches;
@override@JsonKey(name: 'Branches') List<List<bool>> get branches {
  if (_branches is EqualUnmodifiableListView) return _branches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_branches);
}

@override@JsonKey(name: 'AutoTroughNear') final  int autoTroughNear;
@override@JsonKey(name: 'AutoTroughFar') final  int autoTroughFar;
@override@JsonKey(name: 'TroughNear') final  int troughNear;
@override@JsonKey(name: 'TroughFar') final  int troughFar;

/// Create a copy of CheesyReef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyReefCopyWith<_CheesyReef> get copyWith => __$CheesyReefCopyWithImpl<_CheesyReef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyReefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyReef&&const DeepCollectionEquality().equals(other._autoBranches, _autoBranches)&&const DeepCollectionEquality().equals(other._branches, _branches)&&(identical(other.autoTroughNear, autoTroughNear) || other.autoTroughNear == autoTroughNear)&&(identical(other.autoTroughFar, autoTroughFar) || other.autoTroughFar == autoTroughFar)&&(identical(other.troughNear, troughNear) || other.troughNear == troughNear)&&(identical(other.troughFar, troughFar) || other.troughFar == troughFar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_autoBranches),const DeepCollectionEquality().hash(_branches),autoTroughNear,autoTroughFar,troughNear,troughFar);

@override
String toString() {
  return 'CheesyReef(autoBranches: $autoBranches, branches: $branches, autoTroughNear: $autoTroughNear, autoTroughFar: $autoTroughFar, troughNear: $troughNear, troughFar: $troughFar)';
}


}

/// @nodoc
abstract mixin class _$CheesyReefCopyWith<$Res> implements $CheesyReefCopyWith<$Res> {
  factory _$CheesyReefCopyWith(_CheesyReef value, $Res Function(_CheesyReef) _then) = __$CheesyReefCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'AutoBranches') List<List<bool>> autoBranches,@JsonKey(name: 'Branches') List<List<bool>> branches,@JsonKey(name: 'AutoTroughNear') int autoTroughNear,@JsonKey(name: 'AutoTroughFar') int autoTroughFar,@JsonKey(name: 'TroughNear') int troughNear,@JsonKey(name: 'TroughFar') int troughFar
});




}
/// @nodoc
class __$CheesyReefCopyWithImpl<$Res>
    implements _$CheesyReefCopyWith<$Res> {
  __$CheesyReefCopyWithImpl(this._self, this._then);

  final _CheesyReef _self;
  final $Res Function(_CheesyReef) _then;

/// Create a copy of CheesyReef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? autoBranches = null,Object? branches = null,Object? autoTroughNear = null,Object? autoTroughFar = null,Object? troughNear = null,Object? troughFar = null,}) {
  return _then(_CheesyReef(
autoBranches: null == autoBranches ? _self._autoBranches : autoBranches // ignore: cast_nullable_to_non_nullable
as List<List<bool>>,branches: null == branches ? _self._branches : branches // ignore: cast_nullable_to_non_nullable
as List<List<bool>>,autoTroughNear: null == autoTroughNear ? _self.autoTroughNear : autoTroughNear // ignore: cast_nullable_to_non_nullable
as int,autoTroughFar: null == autoTroughFar ? _self.autoTroughFar : autoTroughFar // ignore: cast_nullable_to_non_nullable
as int,troughNear: null == troughNear ? _self.troughNear : troughNear // ignore: cast_nullable_to_non_nullable
as int,troughFar: null == troughFar ? _self.troughFar : troughFar // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheesyFoul {

@JsonKey(name: 'FoulId') int get foulId;@JsonKey(name: 'IsMajor') bool get isMajor;@JsonKey(name: 'TeamId') int get teamId;@JsonKey(name: 'RuleId') int get ruleId;
/// Create a copy of CheesyFoul
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyFoulCopyWith<CheesyFoul> get copyWith => _$CheesyFoulCopyWithImpl<CheesyFoul>(this as CheesyFoul, _$identity);

  /// Serializes this CheesyFoul to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyFoul&&(identical(other.foulId, foulId) || other.foulId == foulId)&&(identical(other.isMajor, isMajor) || other.isMajor == isMajor)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foulId,isMajor,teamId,ruleId);

@override
String toString() {
  return 'CheesyFoul(foulId: $foulId, isMajor: $isMajor, teamId: $teamId, ruleId: $ruleId)';
}


}

/// @nodoc
abstract mixin class $CheesyFoulCopyWith<$Res>  {
  factory $CheesyFoulCopyWith(CheesyFoul value, $Res Function(CheesyFoul) _then) = _$CheesyFoulCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'FoulId') int foulId,@JsonKey(name: 'IsMajor') bool isMajor,@JsonKey(name: 'TeamId') int teamId,@JsonKey(name: 'RuleId') int ruleId
});




}
/// @nodoc
class _$CheesyFoulCopyWithImpl<$Res>
    implements $CheesyFoulCopyWith<$Res> {
  _$CheesyFoulCopyWithImpl(this._self, this._then);

  final CheesyFoul _self;
  final $Res Function(CheesyFoul) _then;

/// Create a copy of CheesyFoul
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foulId = null,Object? isMajor = null,Object? teamId = null,Object? ruleId = null,}) {
  return _then(_self.copyWith(
foulId: null == foulId ? _self.foulId : foulId // ignore: cast_nullable_to_non_nullable
as int,isMajor: null == isMajor ? _self.isMajor : isMajor // ignore: cast_nullable_to_non_nullable
as bool,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as int,ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyFoul].
extension CheesyFoulPatterns on CheesyFoul {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyFoul value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyFoul() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyFoul value)  $default,){
final _that = this;
switch (_that) {
case _CheesyFoul():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyFoul value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyFoul() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'FoulId')  int foulId, @JsonKey(name: 'IsMajor')  bool isMajor, @JsonKey(name: 'TeamId')  int teamId, @JsonKey(name: 'RuleId')  int ruleId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyFoul() when $default != null:
return $default(_that.foulId,_that.isMajor,_that.teamId,_that.ruleId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'FoulId')  int foulId, @JsonKey(name: 'IsMajor')  bool isMajor, @JsonKey(name: 'TeamId')  int teamId, @JsonKey(name: 'RuleId')  int ruleId)  $default,) {final _that = this;
switch (_that) {
case _CheesyFoul():
return $default(_that.foulId,_that.isMajor,_that.teamId,_that.ruleId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'FoulId')  int foulId, @JsonKey(name: 'IsMajor')  bool isMajor, @JsonKey(name: 'TeamId')  int teamId, @JsonKey(name: 'RuleId')  int ruleId)?  $default,) {final _that = this;
switch (_that) {
case _CheesyFoul() when $default != null:
return $default(_that.foulId,_that.isMajor,_that.teamId,_that.ruleId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyFoul implements CheesyFoul {
  const _CheesyFoul({@JsonKey(name: 'FoulId') required this.foulId, @JsonKey(name: 'IsMajor') required this.isMajor, @JsonKey(name: 'TeamId') this.teamId = 0, @JsonKey(name: 'RuleId') this.ruleId = 0});
  factory _CheesyFoul.fromJson(Map<String, dynamic> json) => _$CheesyFoulFromJson(json);

@override@JsonKey(name: 'FoulId') final  int foulId;
@override@JsonKey(name: 'IsMajor') final  bool isMajor;
@override@JsonKey(name: 'TeamId') final  int teamId;
@override@JsonKey(name: 'RuleId') final  int ruleId;

/// Create a copy of CheesyFoul
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyFoulCopyWith<_CheesyFoul> get copyWith => __$CheesyFoulCopyWithImpl<_CheesyFoul>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyFoulToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyFoul&&(identical(other.foulId, foulId) || other.foulId == foulId)&&(identical(other.isMajor, isMajor) || other.isMajor == isMajor)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foulId,isMajor,teamId,ruleId);

@override
String toString() {
  return 'CheesyFoul(foulId: $foulId, isMajor: $isMajor, teamId: $teamId, ruleId: $ruleId)';
}


}

/// @nodoc
abstract mixin class _$CheesyFoulCopyWith<$Res> implements $CheesyFoulCopyWith<$Res> {
  factory _$CheesyFoulCopyWith(_CheesyFoul value, $Res Function(_CheesyFoul) _then) = __$CheesyFoulCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'FoulId') int foulId,@JsonKey(name: 'IsMajor') bool isMajor,@JsonKey(name: 'TeamId') int teamId,@JsonKey(name: 'RuleId') int ruleId
});




}
/// @nodoc
class __$CheesyFoulCopyWithImpl<$Res>
    implements _$CheesyFoulCopyWith<$Res> {
  __$CheesyFoulCopyWithImpl(this._self, this._then);

  final _CheesyFoul _self;
  final $Res Function(_CheesyFoul) _then;

/// Create a copy of CheesyFoul
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foulId = null,Object? isMajor = null,Object? teamId = null,Object? ruleId = null,}) {
  return _then(_CheesyFoul(
foulId: null == foulId ? _self.foulId : foulId // ignore: cast_nullable_to_non_nullable
as int,isMajor: null == isMajor ? _self.isMajor : isMajor // ignore: cast_nullable_to_non_nullable
as bool,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as int,ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheesyScoreSummary {

@JsonKey(name: 'LeavePoints') int get leavePoints;@JsonKey(name: 'AutoPoints') int get autoPoints;@JsonKey(name: 'NumCoral') int get numCoral;@JsonKey(name: 'CoralPoints') int get coralPoints;@JsonKey(name: 'NumAlgae') int get numAlgae;@JsonKey(name: 'AlgaePoints') int get algaePoints;@JsonKey(name: 'BargePoints') int get bargePoints;@JsonKey(name: 'MatchPoints') int get matchPoints;@JsonKey(name: 'FoulPoints') int get foulPoints;@JsonKey(name: 'Score') int get score;@JsonKey(name: 'CoopertitionCriteriaMet') bool get coopertitionCriteriaMet;@JsonKey(name: 'CoopertitionBonus') bool get coopertitionBonus;@JsonKey(name: 'NumCoralLevels') int get numCoralLevels;@JsonKey(name: 'NumCoralLevelsGoal') int get numCoralLevelsGoal;@JsonKey(name: 'AutoBonusRankingPoint') bool get autoBonusRankingPoint;@JsonKey(name: 'CoralBonusRankingPoint') bool get coralBonusRankingPoint;@JsonKey(name: 'BargeBonusRankingPoint') bool get bargeBonusRankingPoint;@JsonKey(name: 'BonusRankingPoints') int get bonusRankingPoints;@JsonKey(name: 'NumOpponentMajorFouls') int get numOpponentMajorFouls;
/// Create a copy of CheesyScoreSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyScoreSummaryCopyWith<CheesyScoreSummary> get copyWith => _$CheesyScoreSummaryCopyWithImpl<CheesyScoreSummary>(this as CheesyScoreSummary, _$identity);

  /// Serializes this CheesyScoreSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyScoreSummary&&(identical(other.leavePoints, leavePoints) || other.leavePoints == leavePoints)&&(identical(other.autoPoints, autoPoints) || other.autoPoints == autoPoints)&&(identical(other.numCoral, numCoral) || other.numCoral == numCoral)&&(identical(other.coralPoints, coralPoints) || other.coralPoints == coralPoints)&&(identical(other.numAlgae, numAlgae) || other.numAlgae == numAlgae)&&(identical(other.algaePoints, algaePoints) || other.algaePoints == algaePoints)&&(identical(other.bargePoints, bargePoints) || other.bargePoints == bargePoints)&&(identical(other.matchPoints, matchPoints) || other.matchPoints == matchPoints)&&(identical(other.foulPoints, foulPoints) || other.foulPoints == foulPoints)&&(identical(other.score, score) || other.score == score)&&(identical(other.coopertitionCriteriaMet, coopertitionCriteriaMet) || other.coopertitionCriteriaMet == coopertitionCriteriaMet)&&(identical(other.coopertitionBonus, coopertitionBonus) || other.coopertitionBonus == coopertitionBonus)&&(identical(other.numCoralLevels, numCoralLevels) || other.numCoralLevels == numCoralLevels)&&(identical(other.numCoralLevelsGoal, numCoralLevelsGoal) || other.numCoralLevelsGoal == numCoralLevelsGoal)&&(identical(other.autoBonusRankingPoint, autoBonusRankingPoint) || other.autoBonusRankingPoint == autoBonusRankingPoint)&&(identical(other.coralBonusRankingPoint, coralBonusRankingPoint) || other.coralBonusRankingPoint == coralBonusRankingPoint)&&(identical(other.bargeBonusRankingPoint, bargeBonusRankingPoint) || other.bargeBonusRankingPoint == bargeBonusRankingPoint)&&(identical(other.bonusRankingPoints, bonusRankingPoints) || other.bonusRankingPoints == bonusRankingPoints)&&(identical(other.numOpponentMajorFouls, numOpponentMajorFouls) || other.numOpponentMajorFouls == numOpponentMajorFouls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,leavePoints,autoPoints,numCoral,coralPoints,numAlgae,algaePoints,bargePoints,matchPoints,foulPoints,score,coopertitionCriteriaMet,coopertitionBonus,numCoralLevels,numCoralLevelsGoal,autoBonusRankingPoint,coralBonusRankingPoint,bargeBonusRankingPoint,bonusRankingPoints,numOpponentMajorFouls]);

@override
String toString() {
  return 'CheesyScoreSummary(leavePoints: $leavePoints, autoPoints: $autoPoints, numCoral: $numCoral, coralPoints: $coralPoints, numAlgae: $numAlgae, algaePoints: $algaePoints, bargePoints: $bargePoints, matchPoints: $matchPoints, foulPoints: $foulPoints, score: $score, coopertitionCriteriaMet: $coopertitionCriteriaMet, coopertitionBonus: $coopertitionBonus, numCoralLevels: $numCoralLevels, numCoralLevelsGoal: $numCoralLevelsGoal, autoBonusRankingPoint: $autoBonusRankingPoint, coralBonusRankingPoint: $coralBonusRankingPoint, bargeBonusRankingPoint: $bargeBonusRankingPoint, bonusRankingPoints: $bonusRankingPoints, numOpponentMajorFouls: $numOpponentMajorFouls)';
}


}

/// @nodoc
abstract mixin class $CheesyScoreSummaryCopyWith<$Res>  {
  factory $CheesyScoreSummaryCopyWith(CheesyScoreSummary value, $Res Function(CheesyScoreSummary) _then) = _$CheesyScoreSummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'LeavePoints') int leavePoints,@JsonKey(name: 'AutoPoints') int autoPoints,@JsonKey(name: 'NumCoral') int numCoral,@JsonKey(name: 'CoralPoints') int coralPoints,@JsonKey(name: 'NumAlgae') int numAlgae,@JsonKey(name: 'AlgaePoints') int algaePoints,@JsonKey(name: 'BargePoints') int bargePoints,@JsonKey(name: 'MatchPoints') int matchPoints,@JsonKey(name: 'FoulPoints') int foulPoints,@JsonKey(name: 'Score') int score,@JsonKey(name: 'CoopertitionCriteriaMet') bool coopertitionCriteriaMet,@JsonKey(name: 'CoopertitionBonus') bool coopertitionBonus,@JsonKey(name: 'NumCoralLevels') int numCoralLevels,@JsonKey(name: 'NumCoralLevelsGoal') int numCoralLevelsGoal,@JsonKey(name: 'AutoBonusRankingPoint') bool autoBonusRankingPoint,@JsonKey(name: 'CoralBonusRankingPoint') bool coralBonusRankingPoint,@JsonKey(name: 'BargeBonusRankingPoint') bool bargeBonusRankingPoint,@JsonKey(name: 'BonusRankingPoints') int bonusRankingPoints,@JsonKey(name: 'NumOpponentMajorFouls') int numOpponentMajorFouls
});




}
/// @nodoc
class _$CheesyScoreSummaryCopyWithImpl<$Res>
    implements $CheesyScoreSummaryCopyWith<$Res> {
  _$CheesyScoreSummaryCopyWithImpl(this._self, this._then);

  final CheesyScoreSummary _self;
  final $Res Function(CheesyScoreSummary) _then;

/// Create a copy of CheesyScoreSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leavePoints = null,Object? autoPoints = null,Object? numCoral = null,Object? coralPoints = null,Object? numAlgae = null,Object? algaePoints = null,Object? bargePoints = null,Object? matchPoints = null,Object? foulPoints = null,Object? score = null,Object? coopertitionCriteriaMet = null,Object? coopertitionBonus = null,Object? numCoralLevels = null,Object? numCoralLevelsGoal = null,Object? autoBonusRankingPoint = null,Object? coralBonusRankingPoint = null,Object? bargeBonusRankingPoint = null,Object? bonusRankingPoints = null,Object? numOpponentMajorFouls = null,}) {
  return _then(_self.copyWith(
leavePoints: null == leavePoints ? _self.leavePoints : leavePoints // ignore: cast_nullable_to_non_nullable
as int,autoPoints: null == autoPoints ? _self.autoPoints : autoPoints // ignore: cast_nullable_to_non_nullable
as int,numCoral: null == numCoral ? _self.numCoral : numCoral // ignore: cast_nullable_to_non_nullable
as int,coralPoints: null == coralPoints ? _self.coralPoints : coralPoints // ignore: cast_nullable_to_non_nullable
as int,numAlgae: null == numAlgae ? _self.numAlgae : numAlgae // ignore: cast_nullable_to_non_nullable
as int,algaePoints: null == algaePoints ? _self.algaePoints : algaePoints // ignore: cast_nullable_to_non_nullable
as int,bargePoints: null == bargePoints ? _self.bargePoints : bargePoints // ignore: cast_nullable_to_non_nullable
as int,matchPoints: null == matchPoints ? _self.matchPoints : matchPoints // ignore: cast_nullable_to_non_nullable
as int,foulPoints: null == foulPoints ? _self.foulPoints : foulPoints // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,coopertitionCriteriaMet: null == coopertitionCriteriaMet ? _self.coopertitionCriteriaMet : coopertitionCriteriaMet // ignore: cast_nullable_to_non_nullable
as bool,coopertitionBonus: null == coopertitionBonus ? _self.coopertitionBonus : coopertitionBonus // ignore: cast_nullable_to_non_nullable
as bool,numCoralLevels: null == numCoralLevels ? _self.numCoralLevels : numCoralLevels // ignore: cast_nullable_to_non_nullable
as int,numCoralLevelsGoal: null == numCoralLevelsGoal ? _self.numCoralLevelsGoal : numCoralLevelsGoal // ignore: cast_nullable_to_non_nullable
as int,autoBonusRankingPoint: null == autoBonusRankingPoint ? _self.autoBonusRankingPoint : autoBonusRankingPoint // ignore: cast_nullable_to_non_nullable
as bool,coralBonusRankingPoint: null == coralBonusRankingPoint ? _self.coralBonusRankingPoint : coralBonusRankingPoint // ignore: cast_nullable_to_non_nullable
as bool,bargeBonusRankingPoint: null == bargeBonusRankingPoint ? _self.bargeBonusRankingPoint : bargeBonusRankingPoint // ignore: cast_nullable_to_non_nullable
as bool,bonusRankingPoints: null == bonusRankingPoints ? _self.bonusRankingPoints : bonusRankingPoints // ignore: cast_nullable_to_non_nullable
as int,numOpponentMajorFouls: null == numOpponentMajorFouls ? _self.numOpponentMajorFouls : numOpponentMajorFouls // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyScoreSummary].
extension CheesyScoreSummaryPatterns on CheesyScoreSummary {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyScoreSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyScoreSummary() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyScoreSummary value)  $default,){
final _that = this;
switch (_that) {
case _CheesyScoreSummary():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyScoreSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyScoreSummary() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'LeavePoints')  int leavePoints, @JsonKey(name: 'AutoPoints')  int autoPoints, @JsonKey(name: 'NumCoral')  int numCoral, @JsonKey(name: 'CoralPoints')  int coralPoints, @JsonKey(name: 'NumAlgae')  int numAlgae, @JsonKey(name: 'AlgaePoints')  int algaePoints, @JsonKey(name: 'BargePoints')  int bargePoints, @JsonKey(name: 'MatchPoints')  int matchPoints, @JsonKey(name: 'FoulPoints')  int foulPoints, @JsonKey(name: 'Score')  int score, @JsonKey(name: 'CoopertitionCriteriaMet')  bool coopertitionCriteriaMet, @JsonKey(name: 'CoopertitionBonus')  bool coopertitionBonus, @JsonKey(name: 'NumCoralLevels')  int numCoralLevels, @JsonKey(name: 'NumCoralLevelsGoal')  int numCoralLevelsGoal, @JsonKey(name: 'AutoBonusRankingPoint')  bool autoBonusRankingPoint, @JsonKey(name: 'CoralBonusRankingPoint')  bool coralBonusRankingPoint, @JsonKey(name: 'BargeBonusRankingPoint')  bool bargeBonusRankingPoint, @JsonKey(name: 'BonusRankingPoints')  int bonusRankingPoints, @JsonKey(name: 'NumOpponentMajorFouls')  int numOpponentMajorFouls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyScoreSummary() when $default != null:
return $default(_that.leavePoints,_that.autoPoints,_that.numCoral,_that.coralPoints,_that.numAlgae,_that.algaePoints,_that.bargePoints,_that.matchPoints,_that.foulPoints,_that.score,_that.coopertitionCriteriaMet,_that.coopertitionBonus,_that.numCoralLevels,_that.numCoralLevelsGoal,_that.autoBonusRankingPoint,_that.coralBonusRankingPoint,_that.bargeBonusRankingPoint,_that.bonusRankingPoints,_that.numOpponentMajorFouls);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'LeavePoints')  int leavePoints, @JsonKey(name: 'AutoPoints')  int autoPoints, @JsonKey(name: 'NumCoral')  int numCoral, @JsonKey(name: 'CoralPoints')  int coralPoints, @JsonKey(name: 'NumAlgae')  int numAlgae, @JsonKey(name: 'AlgaePoints')  int algaePoints, @JsonKey(name: 'BargePoints')  int bargePoints, @JsonKey(name: 'MatchPoints')  int matchPoints, @JsonKey(name: 'FoulPoints')  int foulPoints, @JsonKey(name: 'Score')  int score, @JsonKey(name: 'CoopertitionCriteriaMet')  bool coopertitionCriteriaMet, @JsonKey(name: 'CoopertitionBonus')  bool coopertitionBonus, @JsonKey(name: 'NumCoralLevels')  int numCoralLevels, @JsonKey(name: 'NumCoralLevelsGoal')  int numCoralLevelsGoal, @JsonKey(name: 'AutoBonusRankingPoint')  bool autoBonusRankingPoint, @JsonKey(name: 'CoralBonusRankingPoint')  bool coralBonusRankingPoint, @JsonKey(name: 'BargeBonusRankingPoint')  bool bargeBonusRankingPoint, @JsonKey(name: 'BonusRankingPoints')  int bonusRankingPoints, @JsonKey(name: 'NumOpponentMajorFouls')  int numOpponentMajorFouls)  $default,) {final _that = this;
switch (_that) {
case _CheesyScoreSummary():
return $default(_that.leavePoints,_that.autoPoints,_that.numCoral,_that.coralPoints,_that.numAlgae,_that.algaePoints,_that.bargePoints,_that.matchPoints,_that.foulPoints,_that.score,_that.coopertitionCriteriaMet,_that.coopertitionBonus,_that.numCoralLevels,_that.numCoralLevelsGoal,_that.autoBonusRankingPoint,_that.coralBonusRankingPoint,_that.bargeBonusRankingPoint,_that.bonusRankingPoints,_that.numOpponentMajorFouls);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'LeavePoints')  int leavePoints, @JsonKey(name: 'AutoPoints')  int autoPoints, @JsonKey(name: 'NumCoral')  int numCoral, @JsonKey(name: 'CoralPoints')  int coralPoints, @JsonKey(name: 'NumAlgae')  int numAlgae, @JsonKey(name: 'AlgaePoints')  int algaePoints, @JsonKey(name: 'BargePoints')  int bargePoints, @JsonKey(name: 'MatchPoints')  int matchPoints, @JsonKey(name: 'FoulPoints')  int foulPoints, @JsonKey(name: 'Score')  int score, @JsonKey(name: 'CoopertitionCriteriaMet')  bool coopertitionCriteriaMet, @JsonKey(name: 'CoopertitionBonus')  bool coopertitionBonus, @JsonKey(name: 'NumCoralLevels')  int numCoralLevels, @JsonKey(name: 'NumCoralLevelsGoal')  int numCoralLevelsGoal, @JsonKey(name: 'AutoBonusRankingPoint')  bool autoBonusRankingPoint, @JsonKey(name: 'CoralBonusRankingPoint')  bool coralBonusRankingPoint, @JsonKey(name: 'BargeBonusRankingPoint')  bool bargeBonusRankingPoint, @JsonKey(name: 'BonusRankingPoints')  int bonusRankingPoints, @JsonKey(name: 'NumOpponentMajorFouls')  int numOpponentMajorFouls)?  $default,) {final _that = this;
switch (_that) {
case _CheesyScoreSummary() when $default != null:
return $default(_that.leavePoints,_that.autoPoints,_that.numCoral,_that.coralPoints,_that.numAlgae,_that.algaePoints,_that.bargePoints,_that.matchPoints,_that.foulPoints,_that.score,_that.coopertitionCriteriaMet,_that.coopertitionBonus,_that.numCoralLevels,_that.numCoralLevelsGoal,_that.autoBonusRankingPoint,_that.coralBonusRankingPoint,_that.bargeBonusRankingPoint,_that.bonusRankingPoints,_that.numOpponentMajorFouls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyScoreSummary implements CheesyScoreSummary {
  const _CheesyScoreSummary({@JsonKey(name: 'LeavePoints') this.leavePoints = 0, @JsonKey(name: 'AutoPoints') this.autoPoints = 0, @JsonKey(name: 'NumCoral') this.numCoral = 0, @JsonKey(name: 'CoralPoints') this.coralPoints = 0, @JsonKey(name: 'NumAlgae') this.numAlgae = 0, @JsonKey(name: 'AlgaePoints') this.algaePoints = 0, @JsonKey(name: 'BargePoints') this.bargePoints = 0, @JsonKey(name: 'MatchPoints') this.matchPoints = 0, @JsonKey(name: 'FoulPoints') this.foulPoints = 0, @JsonKey(name: 'Score') this.score = 0, @JsonKey(name: 'CoopertitionCriteriaMet') this.coopertitionCriteriaMet = false, @JsonKey(name: 'CoopertitionBonus') this.coopertitionBonus = false, @JsonKey(name: 'NumCoralLevels') this.numCoralLevels = 0, @JsonKey(name: 'NumCoralLevelsGoal') this.numCoralLevelsGoal = 4, @JsonKey(name: 'AutoBonusRankingPoint') this.autoBonusRankingPoint = false, @JsonKey(name: 'CoralBonusRankingPoint') this.coralBonusRankingPoint = false, @JsonKey(name: 'BargeBonusRankingPoint') this.bargeBonusRankingPoint = false, @JsonKey(name: 'BonusRankingPoints') this.bonusRankingPoints = 0, @JsonKey(name: 'NumOpponentMajorFouls') this.numOpponentMajorFouls = 0});
  factory _CheesyScoreSummary.fromJson(Map<String, dynamic> json) => _$CheesyScoreSummaryFromJson(json);

@override@JsonKey(name: 'LeavePoints') final  int leavePoints;
@override@JsonKey(name: 'AutoPoints') final  int autoPoints;
@override@JsonKey(name: 'NumCoral') final  int numCoral;
@override@JsonKey(name: 'CoralPoints') final  int coralPoints;
@override@JsonKey(name: 'NumAlgae') final  int numAlgae;
@override@JsonKey(name: 'AlgaePoints') final  int algaePoints;
@override@JsonKey(name: 'BargePoints') final  int bargePoints;
@override@JsonKey(name: 'MatchPoints') final  int matchPoints;
@override@JsonKey(name: 'FoulPoints') final  int foulPoints;
@override@JsonKey(name: 'Score') final  int score;
@override@JsonKey(name: 'CoopertitionCriteriaMet') final  bool coopertitionCriteriaMet;
@override@JsonKey(name: 'CoopertitionBonus') final  bool coopertitionBonus;
@override@JsonKey(name: 'NumCoralLevels') final  int numCoralLevels;
@override@JsonKey(name: 'NumCoralLevelsGoal') final  int numCoralLevelsGoal;
@override@JsonKey(name: 'AutoBonusRankingPoint') final  bool autoBonusRankingPoint;
@override@JsonKey(name: 'CoralBonusRankingPoint') final  bool coralBonusRankingPoint;
@override@JsonKey(name: 'BargeBonusRankingPoint') final  bool bargeBonusRankingPoint;
@override@JsonKey(name: 'BonusRankingPoints') final  int bonusRankingPoints;
@override@JsonKey(name: 'NumOpponentMajorFouls') final  int numOpponentMajorFouls;

/// Create a copy of CheesyScoreSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyScoreSummaryCopyWith<_CheesyScoreSummary> get copyWith => __$CheesyScoreSummaryCopyWithImpl<_CheesyScoreSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyScoreSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyScoreSummary&&(identical(other.leavePoints, leavePoints) || other.leavePoints == leavePoints)&&(identical(other.autoPoints, autoPoints) || other.autoPoints == autoPoints)&&(identical(other.numCoral, numCoral) || other.numCoral == numCoral)&&(identical(other.coralPoints, coralPoints) || other.coralPoints == coralPoints)&&(identical(other.numAlgae, numAlgae) || other.numAlgae == numAlgae)&&(identical(other.algaePoints, algaePoints) || other.algaePoints == algaePoints)&&(identical(other.bargePoints, bargePoints) || other.bargePoints == bargePoints)&&(identical(other.matchPoints, matchPoints) || other.matchPoints == matchPoints)&&(identical(other.foulPoints, foulPoints) || other.foulPoints == foulPoints)&&(identical(other.score, score) || other.score == score)&&(identical(other.coopertitionCriteriaMet, coopertitionCriteriaMet) || other.coopertitionCriteriaMet == coopertitionCriteriaMet)&&(identical(other.coopertitionBonus, coopertitionBonus) || other.coopertitionBonus == coopertitionBonus)&&(identical(other.numCoralLevels, numCoralLevels) || other.numCoralLevels == numCoralLevels)&&(identical(other.numCoralLevelsGoal, numCoralLevelsGoal) || other.numCoralLevelsGoal == numCoralLevelsGoal)&&(identical(other.autoBonusRankingPoint, autoBonusRankingPoint) || other.autoBonusRankingPoint == autoBonusRankingPoint)&&(identical(other.coralBonusRankingPoint, coralBonusRankingPoint) || other.coralBonusRankingPoint == coralBonusRankingPoint)&&(identical(other.bargeBonusRankingPoint, bargeBonusRankingPoint) || other.bargeBonusRankingPoint == bargeBonusRankingPoint)&&(identical(other.bonusRankingPoints, bonusRankingPoints) || other.bonusRankingPoints == bonusRankingPoints)&&(identical(other.numOpponentMajorFouls, numOpponentMajorFouls) || other.numOpponentMajorFouls == numOpponentMajorFouls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,leavePoints,autoPoints,numCoral,coralPoints,numAlgae,algaePoints,bargePoints,matchPoints,foulPoints,score,coopertitionCriteriaMet,coopertitionBonus,numCoralLevels,numCoralLevelsGoal,autoBonusRankingPoint,coralBonusRankingPoint,bargeBonusRankingPoint,bonusRankingPoints,numOpponentMajorFouls]);

@override
String toString() {
  return 'CheesyScoreSummary(leavePoints: $leavePoints, autoPoints: $autoPoints, numCoral: $numCoral, coralPoints: $coralPoints, numAlgae: $numAlgae, algaePoints: $algaePoints, bargePoints: $bargePoints, matchPoints: $matchPoints, foulPoints: $foulPoints, score: $score, coopertitionCriteriaMet: $coopertitionCriteriaMet, coopertitionBonus: $coopertitionBonus, numCoralLevels: $numCoralLevels, numCoralLevelsGoal: $numCoralLevelsGoal, autoBonusRankingPoint: $autoBonusRankingPoint, coralBonusRankingPoint: $coralBonusRankingPoint, bargeBonusRankingPoint: $bargeBonusRankingPoint, bonusRankingPoints: $bonusRankingPoints, numOpponentMajorFouls: $numOpponentMajorFouls)';
}


}

/// @nodoc
abstract mixin class _$CheesyScoreSummaryCopyWith<$Res> implements $CheesyScoreSummaryCopyWith<$Res> {
  factory _$CheesyScoreSummaryCopyWith(_CheesyScoreSummary value, $Res Function(_CheesyScoreSummary) _then) = __$CheesyScoreSummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'LeavePoints') int leavePoints,@JsonKey(name: 'AutoPoints') int autoPoints,@JsonKey(name: 'NumCoral') int numCoral,@JsonKey(name: 'CoralPoints') int coralPoints,@JsonKey(name: 'NumAlgae') int numAlgae,@JsonKey(name: 'AlgaePoints') int algaePoints,@JsonKey(name: 'BargePoints') int bargePoints,@JsonKey(name: 'MatchPoints') int matchPoints,@JsonKey(name: 'FoulPoints') int foulPoints,@JsonKey(name: 'Score') int score,@JsonKey(name: 'CoopertitionCriteriaMet') bool coopertitionCriteriaMet,@JsonKey(name: 'CoopertitionBonus') bool coopertitionBonus,@JsonKey(name: 'NumCoralLevels') int numCoralLevels,@JsonKey(name: 'NumCoralLevelsGoal') int numCoralLevelsGoal,@JsonKey(name: 'AutoBonusRankingPoint') bool autoBonusRankingPoint,@JsonKey(name: 'CoralBonusRankingPoint') bool coralBonusRankingPoint,@JsonKey(name: 'BargeBonusRankingPoint') bool bargeBonusRankingPoint,@JsonKey(name: 'BonusRankingPoints') int bonusRankingPoints,@JsonKey(name: 'NumOpponentMajorFouls') int numOpponentMajorFouls
});




}
/// @nodoc
class __$CheesyScoreSummaryCopyWithImpl<$Res>
    implements _$CheesyScoreSummaryCopyWith<$Res> {
  __$CheesyScoreSummaryCopyWithImpl(this._self, this._then);

  final _CheesyScoreSummary _self;
  final $Res Function(_CheesyScoreSummary) _then;

/// Create a copy of CheesyScoreSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leavePoints = null,Object? autoPoints = null,Object? numCoral = null,Object? coralPoints = null,Object? numAlgae = null,Object? algaePoints = null,Object? bargePoints = null,Object? matchPoints = null,Object? foulPoints = null,Object? score = null,Object? coopertitionCriteriaMet = null,Object? coopertitionBonus = null,Object? numCoralLevels = null,Object? numCoralLevelsGoal = null,Object? autoBonusRankingPoint = null,Object? coralBonusRankingPoint = null,Object? bargeBonusRankingPoint = null,Object? bonusRankingPoints = null,Object? numOpponentMajorFouls = null,}) {
  return _then(_CheesyScoreSummary(
leavePoints: null == leavePoints ? _self.leavePoints : leavePoints // ignore: cast_nullable_to_non_nullable
as int,autoPoints: null == autoPoints ? _self.autoPoints : autoPoints // ignore: cast_nullable_to_non_nullable
as int,numCoral: null == numCoral ? _self.numCoral : numCoral // ignore: cast_nullable_to_non_nullable
as int,coralPoints: null == coralPoints ? _self.coralPoints : coralPoints // ignore: cast_nullable_to_non_nullable
as int,numAlgae: null == numAlgae ? _self.numAlgae : numAlgae // ignore: cast_nullable_to_non_nullable
as int,algaePoints: null == algaePoints ? _self.algaePoints : algaePoints // ignore: cast_nullable_to_non_nullable
as int,bargePoints: null == bargePoints ? _self.bargePoints : bargePoints // ignore: cast_nullable_to_non_nullable
as int,matchPoints: null == matchPoints ? _self.matchPoints : matchPoints // ignore: cast_nullable_to_non_nullable
as int,foulPoints: null == foulPoints ? _self.foulPoints : foulPoints // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,coopertitionCriteriaMet: null == coopertitionCriteriaMet ? _self.coopertitionCriteriaMet : coopertitionCriteriaMet // ignore: cast_nullable_to_non_nullable
as bool,coopertitionBonus: null == coopertitionBonus ? _self.coopertitionBonus : coopertitionBonus // ignore: cast_nullable_to_non_nullable
as bool,numCoralLevels: null == numCoralLevels ? _self.numCoralLevels : numCoralLevels // ignore: cast_nullable_to_non_nullable
as int,numCoralLevelsGoal: null == numCoralLevelsGoal ? _self.numCoralLevelsGoal : numCoralLevelsGoal // ignore: cast_nullable_to_non_nullable
as int,autoBonusRankingPoint: null == autoBonusRankingPoint ? _self.autoBonusRankingPoint : autoBonusRankingPoint // ignore: cast_nullable_to_non_nullable
as bool,coralBonusRankingPoint: null == coralBonusRankingPoint ? _self.coralBonusRankingPoint : coralBonusRankingPoint // ignore: cast_nullable_to_non_nullable
as bool,bargeBonusRankingPoint: null == bargeBonusRankingPoint ? _self.bargeBonusRankingPoint : bargeBonusRankingPoint // ignore: cast_nullable_to_non_nullable
as bool,bonusRankingPoints: null == bonusRankingPoints ? _self.bonusRankingPoints : bonusRankingPoints // ignore: cast_nullable_to_non_nullable
as int,numOpponentMajorFouls: null == numOpponentMajorFouls ? _self.numOpponentMajorFouls : numOpponentMajorFouls // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheesyScoringStatus {

@JsonKey(name: 'RefereeScoreReady') bool get refereeScoreReady;@JsonKey(name: 'PositionStatuses') Map<String, CheesyPositionStatus> get positionStatuses;
/// Create a copy of CheesyScoringStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyScoringStatusCopyWith<CheesyScoringStatus> get copyWith => _$CheesyScoringStatusCopyWithImpl<CheesyScoringStatus>(this as CheesyScoringStatus, _$identity);

  /// Serializes this CheesyScoringStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyScoringStatus&&(identical(other.refereeScoreReady, refereeScoreReady) || other.refereeScoreReady == refereeScoreReady)&&const DeepCollectionEquality().equals(other.positionStatuses, positionStatuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refereeScoreReady,const DeepCollectionEquality().hash(positionStatuses));

@override
String toString() {
  return 'CheesyScoringStatus(refereeScoreReady: $refereeScoreReady, positionStatuses: $positionStatuses)';
}


}

/// @nodoc
abstract mixin class $CheesyScoringStatusCopyWith<$Res>  {
  factory $CheesyScoringStatusCopyWith(CheesyScoringStatus value, $Res Function(CheesyScoringStatus) _then) = _$CheesyScoringStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'RefereeScoreReady') bool refereeScoreReady,@JsonKey(name: 'PositionStatuses') Map<String, CheesyPositionStatus> positionStatuses
});




}
/// @nodoc
class _$CheesyScoringStatusCopyWithImpl<$Res>
    implements $CheesyScoringStatusCopyWith<$Res> {
  _$CheesyScoringStatusCopyWithImpl(this._self, this._then);

  final CheesyScoringStatus _self;
  final $Res Function(CheesyScoringStatus) _then;

/// Create a copy of CheesyScoringStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refereeScoreReady = null,Object? positionStatuses = null,}) {
  return _then(_self.copyWith(
refereeScoreReady: null == refereeScoreReady ? _self.refereeScoreReady : refereeScoreReady // ignore: cast_nullable_to_non_nullable
as bool,positionStatuses: null == positionStatuses ? _self.positionStatuses : positionStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyPositionStatus>,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyScoringStatus].
extension CheesyScoringStatusPatterns on CheesyScoringStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyScoringStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyScoringStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyScoringStatus value)  $default,){
final _that = this;
switch (_that) {
case _CheesyScoringStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyScoringStatus value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyScoringStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'RefereeScoreReady')  bool refereeScoreReady, @JsonKey(name: 'PositionStatuses')  Map<String, CheesyPositionStatus> positionStatuses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyScoringStatus() when $default != null:
return $default(_that.refereeScoreReady,_that.positionStatuses);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'RefereeScoreReady')  bool refereeScoreReady, @JsonKey(name: 'PositionStatuses')  Map<String, CheesyPositionStatus> positionStatuses)  $default,) {final _that = this;
switch (_that) {
case _CheesyScoringStatus():
return $default(_that.refereeScoreReady,_that.positionStatuses);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'RefereeScoreReady')  bool refereeScoreReady, @JsonKey(name: 'PositionStatuses')  Map<String, CheesyPositionStatus> positionStatuses)?  $default,) {final _that = this;
switch (_that) {
case _CheesyScoringStatus() when $default != null:
return $default(_that.refereeScoreReady,_that.positionStatuses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyScoringStatus implements CheesyScoringStatus {
  const _CheesyScoringStatus({@JsonKey(name: 'RefereeScoreReady') this.refereeScoreReady = false, @JsonKey(name: 'PositionStatuses') required final  Map<String, CheesyPositionStatus> positionStatuses}): _positionStatuses = positionStatuses;
  factory _CheesyScoringStatus.fromJson(Map<String, dynamic> json) => _$CheesyScoringStatusFromJson(json);

@override@JsonKey(name: 'RefereeScoreReady') final  bool refereeScoreReady;
 final  Map<String, CheesyPositionStatus> _positionStatuses;
@override@JsonKey(name: 'PositionStatuses') Map<String, CheesyPositionStatus> get positionStatuses {
  if (_positionStatuses is EqualUnmodifiableMapView) return _positionStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_positionStatuses);
}


/// Create a copy of CheesyScoringStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyScoringStatusCopyWith<_CheesyScoringStatus> get copyWith => __$CheesyScoringStatusCopyWithImpl<_CheesyScoringStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyScoringStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyScoringStatus&&(identical(other.refereeScoreReady, refereeScoreReady) || other.refereeScoreReady == refereeScoreReady)&&const DeepCollectionEquality().equals(other._positionStatuses, _positionStatuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refereeScoreReady,const DeepCollectionEquality().hash(_positionStatuses));

@override
String toString() {
  return 'CheesyScoringStatus(refereeScoreReady: $refereeScoreReady, positionStatuses: $positionStatuses)';
}


}

/// @nodoc
abstract mixin class _$CheesyScoringStatusCopyWith<$Res> implements $CheesyScoringStatusCopyWith<$Res> {
  factory _$CheesyScoringStatusCopyWith(_CheesyScoringStatus value, $Res Function(_CheesyScoringStatus) _then) = __$CheesyScoringStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'RefereeScoreReady') bool refereeScoreReady,@JsonKey(name: 'PositionStatuses') Map<String, CheesyPositionStatus> positionStatuses
});




}
/// @nodoc
class __$CheesyScoringStatusCopyWithImpl<$Res>
    implements _$CheesyScoringStatusCopyWith<$Res> {
  __$CheesyScoringStatusCopyWithImpl(this._self, this._then);

  final _CheesyScoringStatus _self;
  final $Res Function(_CheesyScoringStatus) _then;

/// Create a copy of CheesyScoringStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refereeScoreReady = null,Object? positionStatuses = null,}) {
  return _then(_CheesyScoringStatus(
refereeScoreReady: null == refereeScoreReady ? _self.refereeScoreReady : refereeScoreReady // ignore: cast_nullable_to_non_nullable
as bool,positionStatuses: null == positionStatuses ? _self._positionStatuses : positionStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyPositionStatus>,
  ));
}


}


/// @nodoc
mixin _$CheesyPositionStatus {

@JsonKey(name: 'Ready') bool get ready;@JsonKey(name: 'NumPanels') int get numPanels;@JsonKey(name: 'NumPanelsReady') int get numPanelsReady;
/// Create a copy of CheesyPositionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyPositionStatusCopyWith<CheesyPositionStatus> get copyWith => _$CheesyPositionStatusCopyWithImpl<CheesyPositionStatus>(this as CheesyPositionStatus, _$identity);

  /// Serializes this CheesyPositionStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyPositionStatus&&(identical(other.ready, ready) || other.ready == ready)&&(identical(other.numPanels, numPanels) || other.numPanels == numPanels)&&(identical(other.numPanelsReady, numPanelsReady) || other.numPanelsReady == numPanelsReady));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ready,numPanels,numPanelsReady);

@override
String toString() {
  return 'CheesyPositionStatus(ready: $ready, numPanels: $numPanels, numPanelsReady: $numPanelsReady)';
}


}

/// @nodoc
abstract mixin class $CheesyPositionStatusCopyWith<$Res>  {
  factory $CheesyPositionStatusCopyWith(CheesyPositionStatus value, $Res Function(CheesyPositionStatus) _then) = _$CheesyPositionStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Ready') bool ready,@JsonKey(name: 'NumPanels') int numPanels,@JsonKey(name: 'NumPanelsReady') int numPanelsReady
});




}
/// @nodoc
class _$CheesyPositionStatusCopyWithImpl<$Res>
    implements $CheesyPositionStatusCopyWith<$Res> {
  _$CheesyPositionStatusCopyWithImpl(this._self, this._then);

  final CheesyPositionStatus _self;
  final $Res Function(CheesyPositionStatus) _then;

/// Create a copy of CheesyPositionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ready = null,Object? numPanels = null,Object? numPanelsReady = null,}) {
  return _then(_self.copyWith(
ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as bool,numPanels: null == numPanels ? _self.numPanels : numPanels // ignore: cast_nullable_to_non_nullable
as int,numPanelsReady: null == numPanelsReady ? _self.numPanelsReady : numPanelsReady // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyPositionStatus].
extension CheesyPositionStatusPatterns on CheesyPositionStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyPositionStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyPositionStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyPositionStatus value)  $default,){
final _that = this;
switch (_that) {
case _CheesyPositionStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyPositionStatus value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyPositionStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Ready')  bool ready, @JsonKey(name: 'NumPanels')  int numPanels, @JsonKey(name: 'NumPanelsReady')  int numPanelsReady)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyPositionStatus() when $default != null:
return $default(_that.ready,_that.numPanels,_that.numPanelsReady);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Ready')  bool ready, @JsonKey(name: 'NumPanels')  int numPanels, @JsonKey(name: 'NumPanelsReady')  int numPanelsReady)  $default,) {final _that = this;
switch (_that) {
case _CheesyPositionStatus():
return $default(_that.ready,_that.numPanels,_that.numPanelsReady);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Ready')  bool ready, @JsonKey(name: 'NumPanels')  int numPanels, @JsonKey(name: 'NumPanelsReady')  int numPanelsReady)?  $default,) {final _that = this;
switch (_that) {
case _CheesyPositionStatus() when $default != null:
return $default(_that.ready,_that.numPanels,_that.numPanelsReady);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyPositionStatus implements CheesyPositionStatus {
  const _CheesyPositionStatus({@JsonKey(name: 'Ready') this.ready = false, @JsonKey(name: 'NumPanels') this.numPanels = 0, @JsonKey(name: 'NumPanelsReady') this.numPanelsReady = 0});
  factory _CheesyPositionStatus.fromJson(Map<String, dynamic> json) => _$CheesyPositionStatusFromJson(json);

@override@JsonKey(name: 'Ready') final  bool ready;
@override@JsonKey(name: 'NumPanels') final  int numPanels;
@override@JsonKey(name: 'NumPanelsReady') final  int numPanelsReady;

/// Create a copy of CheesyPositionStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyPositionStatusCopyWith<_CheesyPositionStatus> get copyWith => __$CheesyPositionStatusCopyWithImpl<_CheesyPositionStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyPositionStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyPositionStatus&&(identical(other.ready, ready) || other.ready == ready)&&(identical(other.numPanels, numPanels) || other.numPanels == numPanels)&&(identical(other.numPanelsReady, numPanelsReady) || other.numPanelsReady == numPanelsReady));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ready,numPanels,numPanelsReady);

@override
String toString() {
  return 'CheesyPositionStatus(ready: $ready, numPanels: $numPanels, numPanelsReady: $numPanelsReady)';
}


}

/// @nodoc
abstract mixin class _$CheesyPositionStatusCopyWith<$Res> implements $CheesyPositionStatusCopyWith<$Res> {
  factory _$CheesyPositionStatusCopyWith(_CheesyPositionStatus value, $Res Function(_CheesyPositionStatus) _then) = __$CheesyPositionStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Ready') bool ready,@JsonKey(name: 'NumPanels') int numPanels,@JsonKey(name: 'NumPanelsReady') int numPanelsReady
});




}
/// @nodoc
class __$CheesyPositionStatusCopyWithImpl<$Res>
    implements _$CheesyPositionStatusCopyWith<$Res> {
  __$CheesyPositionStatusCopyWithImpl(this._self, this._then);

  final _CheesyPositionStatus _self;
  final $Res Function(_CheesyPositionStatus) _then;

/// Create a copy of CheesyPositionStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ready = null,Object? numPanels = null,Object? numPanelsReady = null,}) {
  return _then(_CheesyPositionStatus(
ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as bool,numPanels: null == numPanels ? _self.numPanels : numPanels // ignore: cast_nullable_to_non_nullable
as int,numPanelsReady: null == numPanelsReady ? _self.numPanelsReady : numPanelsReady // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheesyScorePosted {

@JsonKey(name: 'Match') CheesyMatch? get match;@JsonKey(name: 'RedScoreSummary') CheesyScoreSummary? get redScoreSummary;@JsonKey(name: 'BlueScoreSummary') CheesyScoreSummary? get blueScoreSummary;@JsonKey(name: 'RedRankingPoints') int get redRankingPoints;@JsonKey(name: 'BlueRankingPoints') int get blueRankingPoints;@JsonKey(name: 'RedFouls') List<CheesyFoul> get redFouls;@JsonKey(name: 'BlueFouls') List<CheesyFoul> get blueFouls;@JsonKey(name: 'RedCards') Map<String, String> get redCards;@JsonKey(name: 'BlueCards') Map<String, String> get blueCards;@JsonKey(name: 'RedRankings') Map<String, CheesyTeamRanking?> get redRankings;@JsonKey(name: 'BlueRankings') Map<String, CheesyTeamRanking?> get blueRankings;@JsonKey(name: 'RedOffFieldTeamIds') List<int> get redOffFieldTeamIds;@JsonKey(name: 'BlueOffFieldTeamIds') List<int> get blueOffFieldTeamIds;@JsonKey(name: 'RedWon') bool get redWon;@JsonKey(name: 'BlueWon') bool get blueWon;@JsonKey(name: 'RedWins') int get redWins;@JsonKey(name: 'BlueWins') int get blueWins;@JsonKey(name: 'RedDestination') String get redDestination;@JsonKey(name: 'BlueDestination') String get blueDestination;@JsonKey(name: 'CoopertitionEnabled') bool get coopertitionEnabled;
/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyScorePostedCopyWith<CheesyScorePosted> get copyWith => _$CheesyScorePostedCopyWithImpl<CheesyScorePosted>(this as CheesyScorePosted, _$identity);

  /// Serializes this CheesyScorePosted to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyScorePosted&&(identical(other.match, match) || other.match == match)&&(identical(other.redScoreSummary, redScoreSummary) || other.redScoreSummary == redScoreSummary)&&(identical(other.blueScoreSummary, blueScoreSummary) || other.blueScoreSummary == blueScoreSummary)&&(identical(other.redRankingPoints, redRankingPoints) || other.redRankingPoints == redRankingPoints)&&(identical(other.blueRankingPoints, blueRankingPoints) || other.blueRankingPoints == blueRankingPoints)&&const DeepCollectionEquality().equals(other.redFouls, redFouls)&&const DeepCollectionEquality().equals(other.blueFouls, blueFouls)&&const DeepCollectionEquality().equals(other.redCards, redCards)&&const DeepCollectionEquality().equals(other.blueCards, blueCards)&&const DeepCollectionEquality().equals(other.redRankings, redRankings)&&const DeepCollectionEquality().equals(other.blueRankings, blueRankings)&&const DeepCollectionEquality().equals(other.redOffFieldTeamIds, redOffFieldTeamIds)&&const DeepCollectionEquality().equals(other.blueOffFieldTeamIds, blueOffFieldTeamIds)&&(identical(other.redWon, redWon) || other.redWon == redWon)&&(identical(other.blueWon, blueWon) || other.blueWon == blueWon)&&(identical(other.redWins, redWins) || other.redWins == redWins)&&(identical(other.blueWins, blueWins) || other.blueWins == blueWins)&&(identical(other.redDestination, redDestination) || other.redDestination == redDestination)&&(identical(other.blueDestination, blueDestination) || other.blueDestination == blueDestination)&&(identical(other.coopertitionEnabled, coopertitionEnabled) || other.coopertitionEnabled == coopertitionEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,match,redScoreSummary,blueScoreSummary,redRankingPoints,blueRankingPoints,const DeepCollectionEquality().hash(redFouls),const DeepCollectionEquality().hash(blueFouls),const DeepCollectionEquality().hash(redCards),const DeepCollectionEquality().hash(blueCards),const DeepCollectionEquality().hash(redRankings),const DeepCollectionEquality().hash(blueRankings),const DeepCollectionEquality().hash(redOffFieldTeamIds),const DeepCollectionEquality().hash(blueOffFieldTeamIds),redWon,blueWon,redWins,blueWins,redDestination,blueDestination,coopertitionEnabled]);

@override
String toString() {
  return 'CheesyScorePosted(match: $match, redScoreSummary: $redScoreSummary, blueScoreSummary: $blueScoreSummary, redRankingPoints: $redRankingPoints, blueRankingPoints: $blueRankingPoints, redFouls: $redFouls, blueFouls: $blueFouls, redCards: $redCards, blueCards: $blueCards, redRankings: $redRankings, blueRankings: $blueRankings, redOffFieldTeamIds: $redOffFieldTeamIds, blueOffFieldTeamIds: $blueOffFieldTeamIds, redWon: $redWon, blueWon: $blueWon, redWins: $redWins, blueWins: $blueWins, redDestination: $redDestination, blueDestination: $blueDestination, coopertitionEnabled: $coopertitionEnabled)';
}


}

/// @nodoc
abstract mixin class $CheesyScorePostedCopyWith<$Res>  {
  factory $CheesyScorePostedCopyWith(CheesyScorePosted value, $Res Function(CheesyScorePosted) _then) = _$CheesyScorePostedCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Match') CheesyMatch? match,@JsonKey(name: 'RedScoreSummary') CheesyScoreSummary? redScoreSummary,@JsonKey(name: 'BlueScoreSummary') CheesyScoreSummary? blueScoreSummary,@JsonKey(name: 'RedRankingPoints') int redRankingPoints,@JsonKey(name: 'BlueRankingPoints') int blueRankingPoints,@JsonKey(name: 'RedFouls') List<CheesyFoul> redFouls,@JsonKey(name: 'BlueFouls') List<CheesyFoul> blueFouls,@JsonKey(name: 'RedCards') Map<String, String> redCards,@JsonKey(name: 'BlueCards') Map<String, String> blueCards,@JsonKey(name: 'RedRankings') Map<String, CheesyTeamRanking?> redRankings,@JsonKey(name: 'BlueRankings') Map<String, CheesyTeamRanking?> blueRankings,@JsonKey(name: 'RedOffFieldTeamIds') List<int> redOffFieldTeamIds,@JsonKey(name: 'BlueOffFieldTeamIds') List<int> blueOffFieldTeamIds,@JsonKey(name: 'RedWon') bool redWon,@JsonKey(name: 'BlueWon') bool blueWon,@JsonKey(name: 'RedWins') int redWins,@JsonKey(name: 'BlueWins') int blueWins,@JsonKey(name: 'RedDestination') String redDestination,@JsonKey(name: 'BlueDestination') String blueDestination,@JsonKey(name: 'CoopertitionEnabled') bool coopertitionEnabled
});


$CheesyMatchCopyWith<$Res>? get match;$CheesyScoreSummaryCopyWith<$Res>? get redScoreSummary;$CheesyScoreSummaryCopyWith<$Res>? get blueScoreSummary;

}
/// @nodoc
class _$CheesyScorePostedCopyWithImpl<$Res>
    implements $CheesyScorePostedCopyWith<$Res> {
  _$CheesyScorePostedCopyWithImpl(this._self, this._then);

  final CheesyScorePosted _self;
  final $Res Function(CheesyScorePosted) _then;

/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? match = freezed,Object? redScoreSummary = freezed,Object? blueScoreSummary = freezed,Object? redRankingPoints = null,Object? blueRankingPoints = null,Object? redFouls = null,Object? blueFouls = null,Object? redCards = null,Object? blueCards = null,Object? redRankings = null,Object? blueRankings = null,Object? redOffFieldTeamIds = null,Object? blueOffFieldTeamIds = null,Object? redWon = null,Object? blueWon = null,Object? redWins = null,Object? blueWins = null,Object? redDestination = null,Object? blueDestination = null,Object? coopertitionEnabled = null,}) {
  return _then(_self.copyWith(
match: freezed == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as CheesyMatch?,redScoreSummary: freezed == redScoreSummary ? _self.redScoreSummary : redScoreSummary // ignore: cast_nullable_to_non_nullable
as CheesyScoreSummary?,blueScoreSummary: freezed == blueScoreSummary ? _self.blueScoreSummary : blueScoreSummary // ignore: cast_nullable_to_non_nullable
as CheesyScoreSummary?,redRankingPoints: null == redRankingPoints ? _self.redRankingPoints : redRankingPoints // ignore: cast_nullable_to_non_nullable
as int,blueRankingPoints: null == blueRankingPoints ? _self.blueRankingPoints : blueRankingPoints // ignore: cast_nullable_to_non_nullable
as int,redFouls: null == redFouls ? _self.redFouls : redFouls // ignore: cast_nullable_to_non_nullable
as List<CheesyFoul>,blueFouls: null == blueFouls ? _self.blueFouls : blueFouls // ignore: cast_nullable_to_non_nullable
as List<CheesyFoul>,redCards: null == redCards ? _self.redCards : redCards // ignore: cast_nullable_to_non_nullable
as Map<String, String>,blueCards: null == blueCards ? _self.blueCards : blueCards // ignore: cast_nullable_to_non_nullable
as Map<String, String>,redRankings: null == redRankings ? _self.redRankings : redRankings // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyTeamRanking?>,blueRankings: null == blueRankings ? _self.blueRankings : blueRankings // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyTeamRanking?>,redOffFieldTeamIds: null == redOffFieldTeamIds ? _self.redOffFieldTeamIds : redOffFieldTeamIds // ignore: cast_nullable_to_non_nullable
as List<int>,blueOffFieldTeamIds: null == blueOffFieldTeamIds ? _self.blueOffFieldTeamIds : blueOffFieldTeamIds // ignore: cast_nullable_to_non_nullable
as List<int>,redWon: null == redWon ? _self.redWon : redWon // ignore: cast_nullable_to_non_nullable
as bool,blueWon: null == blueWon ? _self.blueWon : blueWon // ignore: cast_nullable_to_non_nullable
as bool,redWins: null == redWins ? _self.redWins : redWins // ignore: cast_nullable_to_non_nullable
as int,blueWins: null == blueWins ? _self.blueWins : blueWins // ignore: cast_nullable_to_non_nullable
as int,redDestination: null == redDestination ? _self.redDestination : redDestination // ignore: cast_nullable_to_non_nullable
as String,blueDestination: null == blueDestination ? _self.blueDestination : blueDestination // ignore: cast_nullable_to_non_nullable
as String,coopertitionEnabled: null == coopertitionEnabled ? _self.coopertitionEnabled : coopertitionEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyMatchCopyWith<$Res>? get match {
    if (_self.match == null) {
    return null;
  }

  return $CheesyMatchCopyWith<$Res>(_self.match!, (value) {
    return _then(_self.copyWith(match: value));
  });
}/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyScoreSummaryCopyWith<$Res>? get redScoreSummary {
    if (_self.redScoreSummary == null) {
    return null;
  }

  return $CheesyScoreSummaryCopyWith<$Res>(_self.redScoreSummary!, (value) {
    return _then(_self.copyWith(redScoreSummary: value));
  });
}/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyScoreSummaryCopyWith<$Res>? get blueScoreSummary {
    if (_self.blueScoreSummary == null) {
    return null;
  }

  return $CheesyScoreSummaryCopyWith<$Res>(_self.blueScoreSummary!, (value) {
    return _then(_self.copyWith(blueScoreSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheesyScorePosted].
extension CheesyScorePostedPatterns on CheesyScorePosted {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyScorePosted value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyScorePosted() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyScorePosted value)  $default,){
final _that = this;
switch (_that) {
case _CheesyScorePosted():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyScorePosted value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyScorePosted() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Match')  CheesyMatch? match, @JsonKey(name: 'RedScoreSummary')  CheesyScoreSummary? redScoreSummary, @JsonKey(name: 'BlueScoreSummary')  CheesyScoreSummary? blueScoreSummary, @JsonKey(name: 'RedRankingPoints')  int redRankingPoints, @JsonKey(name: 'BlueRankingPoints')  int blueRankingPoints, @JsonKey(name: 'RedFouls')  List<CheesyFoul> redFouls, @JsonKey(name: 'BlueFouls')  List<CheesyFoul> blueFouls, @JsonKey(name: 'RedCards')  Map<String, String> redCards, @JsonKey(name: 'BlueCards')  Map<String, String> blueCards, @JsonKey(name: 'RedRankings')  Map<String, CheesyTeamRanking?> redRankings, @JsonKey(name: 'BlueRankings')  Map<String, CheesyTeamRanking?> blueRankings, @JsonKey(name: 'RedOffFieldTeamIds')  List<int> redOffFieldTeamIds, @JsonKey(name: 'BlueOffFieldTeamIds')  List<int> blueOffFieldTeamIds, @JsonKey(name: 'RedWon')  bool redWon, @JsonKey(name: 'BlueWon')  bool blueWon, @JsonKey(name: 'RedWins')  int redWins, @JsonKey(name: 'BlueWins')  int blueWins, @JsonKey(name: 'RedDestination')  String redDestination, @JsonKey(name: 'BlueDestination')  String blueDestination, @JsonKey(name: 'CoopertitionEnabled')  bool coopertitionEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyScorePosted() when $default != null:
return $default(_that.match,_that.redScoreSummary,_that.blueScoreSummary,_that.redRankingPoints,_that.blueRankingPoints,_that.redFouls,_that.blueFouls,_that.redCards,_that.blueCards,_that.redRankings,_that.blueRankings,_that.redOffFieldTeamIds,_that.blueOffFieldTeamIds,_that.redWon,_that.blueWon,_that.redWins,_that.blueWins,_that.redDestination,_that.blueDestination,_that.coopertitionEnabled);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Match')  CheesyMatch? match, @JsonKey(name: 'RedScoreSummary')  CheesyScoreSummary? redScoreSummary, @JsonKey(name: 'BlueScoreSummary')  CheesyScoreSummary? blueScoreSummary, @JsonKey(name: 'RedRankingPoints')  int redRankingPoints, @JsonKey(name: 'BlueRankingPoints')  int blueRankingPoints, @JsonKey(name: 'RedFouls')  List<CheesyFoul> redFouls, @JsonKey(name: 'BlueFouls')  List<CheesyFoul> blueFouls, @JsonKey(name: 'RedCards')  Map<String, String> redCards, @JsonKey(name: 'BlueCards')  Map<String, String> blueCards, @JsonKey(name: 'RedRankings')  Map<String, CheesyTeamRanking?> redRankings, @JsonKey(name: 'BlueRankings')  Map<String, CheesyTeamRanking?> blueRankings, @JsonKey(name: 'RedOffFieldTeamIds')  List<int> redOffFieldTeamIds, @JsonKey(name: 'BlueOffFieldTeamIds')  List<int> blueOffFieldTeamIds, @JsonKey(name: 'RedWon')  bool redWon, @JsonKey(name: 'BlueWon')  bool blueWon, @JsonKey(name: 'RedWins')  int redWins, @JsonKey(name: 'BlueWins')  int blueWins, @JsonKey(name: 'RedDestination')  String redDestination, @JsonKey(name: 'BlueDestination')  String blueDestination, @JsonKey(name: 'CoopertitionEnabled')  bool coopertitionEnabled)  $default,) {final _that = this;
switch (_that) {
case _CheesyScorePosted():
return $default(_that.match,_that.redScoreSummary,_that.blueScoreSummary,_that.redRankingPoints,_that.blueRankingPoints,_that.redFouls,_that.blueFouls,_that.redCards,_that.blueCards,_that.redRankings,_that.blueRankings,_that.redOffFieldTeamIds,_that.blueOffFieldTeamIds,_that.redWon,_that.blueWon,_that.redWins,_that.blueWins,_that.redDestination,_that.blueDestination,_that.coopertitionEnabled);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Match')  CheesyMatch? match, @JsonKey(name: 'RedScoreSummary')  CheesyScoreSummary? redScoreSummary, @JsonKey(name: 'BlueScoreSummary')  CheesyScoreSummary? blueScoreSummary, @JsonKey(name: 'RedRankingPoints')  int redRankingPoints, @JsonKey(name: 'BlueRankingPoints')  int blueRankingPoints, @JsonKey(name: 'RedFouls')  List<CheesyFoul> redFouls, @JsonKey(name: 'BlueFouls')  List<CheesyFoul> blueFouls, @JsonKey(name: 'RedCards')  Map<String, String> redCards, @JsonKey(name: 'BlueCards')  Map<String, String> blueCards, @JsonKey(name: 'RedRankings')  Map<String, CheesyTeamRanking?> redRankings, @JsonKey(name: 'BlueRankings')  Map<String, CheesyTeamRanking?> blueRankings, @JsonKey(name: 'RedOffFieldTeamIds')  List<int> redOffFieldTeamIds, @JsonKey(name: 'BlueOffFieldTeamIds')  List<int> blueOffFieldTeamIds, @JsonKey(name: 'RedWon')  bool redWon, @JsonKey(name: 'BlueWon')  bool blueWon, @JsonKey(name: 'RedWins')  int redWins, @JsonKey(name: 'BlueWins')  int blueWins, @JsonKey(name: 'RedDestination')  String redDestination, @JsonKey(name: 'BlueDestination')  String blueDestination, @JsonKey(name: 'CoopertitionEnabled')  bool coopertitionEnabled)?  $default,) {final _that = this;
switch (_that) {
case _CheesyScorePosted() when $default != null:
return $default(_that.match,_that.redScoreSummary,_that.blueScoreSummary,_that.redRankingPoints,_that.blueRankingPoints,_that.redFouls,_that.blueFouls,_that.redCards,_that.blueCards,_that.redRankings,_that.blueRankings,_that.redOffFieldTeamIds,_that.blueOffFieldTeamIds,_that.redWon,_that.blueWon,_that.redWins,_that.blueWins,_that.redDestination,_that.blueDestination,_that.coopertitionEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyScorePosted implements CheesyScorePosted {
  const _CheesyScorePosted({@JsonKey(name: 'Match') this.match, @JsonKey(name: 'RedScoreSummary') this.redScoreSummary, @JsonKey(name: 'BlueScoreSummary') this.blueScoreSummary, @JsonKey(name: 'RedRankingPoints') this.redRankingPoints = 0, @JsonKey(name: 'BlueRankingPoints') this.blueRankingPoints = 0, @JsonKey(name: 'RedFouls') final  List<CheesyFoul> redFouls = const [], @JsonKey(name: 'BlueFouls') final  List<CheesyFoul> blueFouls = const [], @JsonKey(name: 'RedCards') final  Map<String, String> redCards = const {}, @JsonKey(name: 'BlueCards') final  Map<String, String> blueCards = const {}, @JsonKey(name: 'RedRankings') final  Map<String, CheesyTeamRanking?> redRankings = const {}, @JsonKey(name: 'BlueRankings') final  Map<String, CheesyTeamRanking?> blueRankings = const {}, @JsonKey(name: 'RedOffFieldTeamIds') final  List<int> redOffFieldTeamIds = const [], @JsonKey(name: 'BlueOffFieldTeamIds') final  List<int> blueOffFieldTeamIds = const [], @JsonKey(name: 'RedWon') this.redWon = false, @JsonKey(name: 'BlueWon') this.blueWon = false, @JsonKey(name: 'RedWins') this.redWins = 0, @JsonKey(name: 'BlueWins') this.blueWins = 0, @JsonKey(name: 'RedDestination') this.redDestination = '', @JsonKey(name: 'BlueDestination') this.blueDestination = '', @JsonKey(name: 'CoopertitionEnabled') this.coopertitionEnabled = false}): _redFouls = redFouls,_blueFouls = blueFouls,_redCards = redCards,_blueCards = blueCards,_redRankings = redRankings,_blueRankings = blueRankings,_redOffFieldTeamIds = redOffFieldTeamIds,_blueOffFieldTeamIds = blueOffFieldTeamIds;
  factory _CheesyScorePosted.fromJson(Map<String, dynamic> json) => _$CheesyScorePostedFromJson(json);

@override@JsonKey(name: 'Match') final  CheesyMatch? match;
@override@JsonKey(name: 'RedScoreSummary') final  CheesyScoreSummary? redScoreSummary;
@override@JsonKey(name: 'BlueScoreSummary') final  CheesyScoreSummary? blueScoreSummary;
@override@JsonKey(name: 'RedRankingPoints') final  int redRankingPoints;
@override@JsonKey(name: 'BlueRankingPoints') final  int blueRankingPoints;
 final  List<CheesyFoul> _redFouls;
@override@JsonKey(name: 'RedFouls') List<CheesyFoul> get redFouls {
  if (_redFouls is EqualUnmodifiableListView) return _redFouls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_redFouls);
}

 final  List<CheesyFoul> _blueFouls;
@override@JsonKey(name: 'BlueFouls') List<CheesyFoul> get blueFouls {
  if (_blueFouls is EqualUnmodifiableListView) return _blueFouls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blueFouls);
}

 final  Map<String, String> _redCards;
@override@JsonKey(name: 'RedCards') Map<String, String> get redCards {
  if (_redCards is EqualUnmodifiableMapView) return _redCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_redCards);
}

 final  Map<String, String> _blueCards;
@override@JsonKey(name: 'BlueCards') Map<String, String> get blueCards {
  if (_blueCards is EqualUnmodifiableMapView) return _blueCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_blueCards);
}

 final  Map<String, CheesyTeamRanking?> _redRankings;
@override@JsonKey(name: 'RedRankings') Map<String, CheesyTeamRanking?> get redRankings {
  if (_redRankings is EqualUnmodifiableMapView) return _redRankings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_redRankings);
}

 final  Map<String, CheesyTeamRanking?> _blueRankings;
@override@JsonKey(name: 'BlueRankings') Map<String, CheesyTeamRanking?> get blueRankings {
  if (_blueRankings is EqualUnmodifiableMapView) return _blueRankings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_blueRankings);
}

 final  List<int> _redOffFieldTeamIds;
@override@JsonKey(name: 'RedOffFieldTeamIds') List<int> get redOffFieldTeamIds {
  if (_redOffFieldTeamIds is EqualUnmodifiableListView) return _redOffFieldTeamIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_redOffFieldTeamIds);
}

 final  List<int> _blueOffFieldTeamIds;
@override@JsonKey(name: 'BlueOffFieldTeamIds') List<int> get blueOffFieldTeamIds {
  if (_blueOffFieldTeamIds is EqualUnmodifiableListView) return _blueOffFieldTeamIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blueOffFieldTeamIds);
}

@override@JsonKey(name: 'RedWon') final  bool redWon;
@override@JsonKey(name: 'BlueWon') final  bool blueWon;
@override@JsonKey(name: 'RedWins') final  int redWins;
@override@JsonKey(name: 'BlueWins') final  int blueWins;
@override@JsonKey(name: 'RedDestination') final  String redDestination;
@override@JsonKey(name: 'BlueDestination') final  String blueDestination;
@override@JsonKey(name: 'CoopertitionEnabled') final  bool coopertitionEnabled;

/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyScorePostedCopyWith<_CheesyScorePosted> get copyWith => __$CheesyScorePostedCopyWithImpl<_CheesyScorePosted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyScorePostedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyScorePosted&&(identical(other.match, match) || other.match == match)&&(identical(other.redScoreSummary, redScoreSummary) || other.redScoreSummary == redScoreSummary)&&(identical(other.blueScoreSummary, blueScoreSummary) || other.blueScoreSummary == blueScoreSummary)&&(identical(other.redRankingPoints, redRankingPoints) || other.redRankingPoints == redRankingPoints)&&(identical(other.blueRankingPoints, blueRankingPoints) || other.blueRankingPoints == blueRankingPoints)&&const DeepCollectionEquality().equals(other._redFouls, _redFouls)&&const DeepCollectionEquality().equals(other._blueFouls, _blueFouls)&&const DeepCollectionEquality().equals(other._redCards, _redCards)&&const DeepCollectionEquality().equals(other._blueCards, _blueCards)&&const DeepCollectionEquality().equals(other._redRankings, _redRankings)&&const DeepCollectionEquality().equals(other._blueRankings, _blueRankings)&&const DeepCollectionEquality().equals(other._redOffFieldTeamIds, _redOffFieldTeamIds)&&const DeepCollectionEquality().equals(other._blueOffFieldTeamIds, _blueOffFieldTeamIds)&&(identical(other.redWon, redWon) || other.redWon == redWon)&&(identical(other.blueWon, blueWon) || other.blueWon == blueWon)&&(identical(other.redWins, redWins) || other.redWins == redWins)&&(identical(other.blueWins, blueWins) || other.blueWins == blueWins)&&(identical(other.redDestination, redDestination) || other.redDestination == redDestination)&&(identical(other.blueDestination, blueDestination) || other.blueDestination == blueDestination)&&(identical(other.coopertitionEnabled, coopertitionEnabled) || other.coopertitionEnabled == coopertitionEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,match,redScoreSummary,blueScoreSummary,redRankingPoints,blueRankingPoints,const DeepCollectionEquality().hash(_redFouls),const DeepCollectionEquality().hash(_blueFouls),const DeepCollectionEquality().hash(_redCards),const DeepCollectionEquality().hash(_blueCards),const DeepCollectionEquality().hash(_redRankings),const DeepCollectionEquality().hash(_blueRankings),const DeepCollectionEquality().hash(_redOffFieldTeamIds),const DeepCollectionEquality().hash(_blueOffFieldTeamIds),redWon,blueWon,redWins,blueWins,redDestination,blueDestination,coopertitionEnabled]);

@override
String toString() {
  return 'CheesyScorePosted(match: $match, redScoreSummary: $redScoreSummary, blueScoreSummary: $blueScoreSummary, redRankingPoints: $redRankingPoints, blueRankingPoints: $blueRankingPoints, redFouls: $redFouls, blueFouls: $blueFouls, redCards: $redCards, blueCards: $blueCards, redRankings: $redRankings, blueRankings: $blueRankings, redOffFieldTeamIds: $redOffFieldTeamIds, blueOffFieldTeamIds: $blueOffFieldTeamIds, redWon: $redWon, blueWon: $blueWon, redWins: $redWins, blueWins: $blueWins, redDestination: $redDestination, blueDestination: $blueDestination, coopertitionEnabled: $coopertitionEnabled)';
}


}

/// @nodoc
abstract mixin class _$CheesyScorePostedCopyWith<$Res> implements $CheesyScorePostedCopyWith<$Res> {
  factory _$CheesyScorePostedCopyWith(_CheesyScorePosted value, $Res Function(_CheesyScorePosted) _then) = __$CheesyScorePostedCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Match') CheesyMatch? match,@JsonKey(name: 'RedScoreSummary') CheesyScoreSummary? redScoreSummary,@JsonKey(name: 'BlueScoreSummary') CheesyScoreSummary? blueScoreSummary,@JsonKey(name: 'RedRankingPoints') int redRankingPoints,@JsonKey(name: 'BlueRankingPoints') int blueRankingPoints,@JsonKey(name: 'RedFouls') List<CheesyFoul> redFouls,@JsonKey(name: 'BlueFouls') List<CheesyFoul> blueFouls,@JsonKey(name: 'RedCards') Map<String, String> redCards,@JsonKey(name: 'BlueCards') Map<String, String> blueCards,@JsonKey(name: 'RedRankings') Map<String, CheesyTeamRanking?> redRankings,@JsonKey(name: 'BlueRankings') Map<String, CheesyTeamRanking?> blueRankings,@JsonKey(name: 'RedOffFieldTeamIds') List<int> redOffFieldTeamIds,@JsonKey(name: 'BlueOffFieldTeamIds') List<int> blueOffFieldTeamIds,@JsonKey(name: 'RedWon') bool redWon,@JsonKey(name: 'BlueWon') bool blueWon,@JsonKey(name: 'RedWins') int redWins,@JsonKey(name: 'BlueWins') int blueWins,@JsonKey(name: 'RedDestination') String redDestination,@JsonKey(name: 'BlueDestination') String blueDestination,@JsonKey(name: 'CoopertitionEnabled') bool coopertitionEnabled
});


@override $CheesyMatchCopyWith<$Res>? get match;@override $CheesyScoreSummaryCopyWith<$Res>? get redScoreSummary;@override $CheesyScoreSummaryCopyWith<$Res>? get blueScoreSummary;

}
/// @nodoc
class __$CheesyScorePostedCopyWithImpl<$Res>
    implements _$CheesyScorePostedCopyWith<$Res> {
  __$CheesyScorePostedCopyWithImpl(this._self, this._then);

  final _CheesyScorePosted _self;
  final $Res Function(_CheesyScorePosted) _then;

/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? match = freezed,Object? redScoreSummary = freezed,Object? blueScoreSummary = freezed,Object? redRankingPoints = null,Object? blueRankingPoints = null,Object? redFouls = null,Object? blueFouls = null,Object? redCards = null,Object? blueCards = null,Object? redRankings = null,Object? blueRankings = null,Object? redOffFieldTeamIds = null,Object? blueOffFieldTeamIds = null,Object? redWon = null,Object? blueWon = null,Object? redWins = null,Object? blueWins = null,Object? redDestination = null,Object? blueDestination = null,Object? coopertitionEnabled = null,}) {
  return _then(_CheesyScorePosted(
match: freezed == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as CheesyMatch?,redScoreSummary: freezed == redScoreSummary ? _self.redScoreSummary : redScoreSummary // ignore: cast_nullable_to_non_nullable
as CheesyScoreSummary?,blueScoreSummary: freezed == blueScoreSummary ? _self.blueScoreSummary : blueScoreSummary // ignore: cast_nullable_to_non_nullable
as CheesyScoreSummary?,redRankingPoints: null == redRankingPoints ? _self.redRankingPoints : redRankingPoints // ignore: cast_nullable_to_non_nullable
as int,blueRankingPoints: null == blueRankingPoints ? _self.blueRankingPoints : blueRankingPoints // ignore: cast_nullable_to_non_nullable
as int,redFouls: null == redFouls ? _self._redFouls : redFouls // ignore: cast_nullable_to_non_nullable
as List<CheesyFoul>,blueFouls: null == blueFouls ? _self._blueFouls : blueFouls // ignore: cast_nullable_to_non_nullable
as List<CheesyFoul>,redCards: null == redCards ? _self._redCards : redCards // ignore: cast_nullable_to_non_nullable
as Map<String, String>,blueCards: null == blueCards ? _self._blueCards : blueCards // ignore: cast_nullable_to_non_nullable
as Map<String, String>,redRankings: null == redRankings ? _self._redRankings : redRankings // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyTeamRanking?>,blueRankings: null == blueRankings ? _self._blueRankings : blueRankings // ignore: cast_nullable_to_non_nullable
as Map<String, CheesyTeamRanking?>,redOffFieldTeamIds: null == redOffFieldTeamIds ? _self._redOffFieldTeamIds : redOffFieldTeamIds // ignore: cast_nullable_to_non_nullable
as List<int>,blueOffFieldTeamIds: null == blueOffFieldTeamIds ? _self._blueOffFieldTeamIds : blueOffFieldTeamIds // ignore: cast_nullable_to_non_nullable
as List<int>,redWon: null == redWon ? _self.redWon : redWon // ignore: cast_nullable_to_non_nullable
as bool,blueWon: null == blueWon ? _self.blueWon : blueWon // ignore: cast_nullable_to_non_nullable
as bool,redWins: null == redWins ? _self.redWins : redWins // ignore: cast_nullable_to_non_nullable
as int,blueWins: null == blueWins ? _self.blueWins : blueWins // ignore: cast_nullable_to_non_nullable
as int,redDestination: null == redDestination ? _self.redDestination : redDestination // ignore: cast_nullable_to_non_nullable
as String,blueDestination: null == blueDestination ? _self.blueDestination : blueDestination // ignore: cast_nullable_to_non_nullable
as String,coopertitionEnabled: null == coopertitionEnabled ? _self.coopertitionEnabled : coopertitionEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyMatchCopyWith<$Res>? get match {
    if (_self.match == null) {
    return null;
  }

  return $CheesyMatchCopyWith<$Res>(_self.match!, (value) {
    return _then(_self.copyWith(match: value));
  });
}/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyScoreSummaryCopyWith<$Res>? get redScoreSummary {
    if (_self.redScoreSummary == null) {
    return null;
  }

  return $CheesyScoreSummaryCopyWith<$Res>(_self.redScoreSummary!, (value) {
    return _then(_self.copyWith(redScoreSummary: value));
  });
}/// Create a copy of CheesyScorePosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheesyScoreSummaryCopyWith<$Res>? get blueScoreSummary {
    if (_self.blueScoreSummary == null) {
    return null;
  }

  return $CheesyScoreSummaryCopyWith<$Res>(_self.blueScoreSummary!, (value) {
    return _then(_self.copyWith(blueScoreSummary: value));
  });
}
}


/// @nodoc
mixin _$CheesyTeamRanking {

@JsonKey(name: 'TeamId') int get teamId;@JsonKey(name: 'Rank') int get rank;@JsonKey(name: 'PreviousRank') int get previousRank;@JsonKey(name: 'RankingPoints') int get rankingPoints;@JsonKey(name: 'CoopertitionPoints') int get coopertitionPoints;@JsonKey(name: 'MatchPoints') int get matchPoints;@JsonKey(name: 'AutoPoints') int get autoPoints;@JsonKey(name: 'BargePoints') int get bargePoints;@JsonKey(name: 'Wins') int get wins;@JsonKey(name: 'Losses') int get losses;@JsonKey(name: 'Ties') int get ties;@JsonKey(name: 'Disqualifications') int get disqualifications;@JsonKey(name: 'Played') int get played;
/// Create a copy of CheesyTeamRanking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheesyTeamRankingCopyWith<CheesyTeamRanking> get copyWith => _$CheesyTeamRankingCopyWithImpl<CheesyTeamRanking>(this as CheesyTeamRanking, _$identity);

  /// Serializes this CheesyTeamRanking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheesyTeamRanking&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.previousRank, previousRank) || other.previousRank == previousRank)&&(identical(other.rankingPoints, rankingPoints) || other.rankingPoints == rankingPoints)&&(identical(other.coopertitionPoints, coopertitionPoints) || other.coopertitionPoints == coopertitionPoints)&&(identical(other.matchPoints, matchPoints) || other.matchPoints == matchPoints)&&(identical(other.autoPoints, autoPoints) || other.autoPoints == autoPoints)&&(identical(other.bargePoints, bargePoints) || other.bargePoints == bargePoints)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.ties, ties) || other.ties == ties)&&(identical(other.disqualifications, disqualifications) || other.disqualifications == disqualifications)&&(identical(other.played, played) || other.played == played));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,rank,previousRank,rankingPoints,coopertitionPoints,matchPoints,autoPoints,bargePoints,wins,losses,ties,disqualifications,played);

@override
String toString() {
  return 'CheesyTeamRanking(teamId: $teamId, rank: $rank, previousRank: $previousRank, rankingPoints: $rankingPoints, coopertitionPoints: $coopertitionPoints, matchPoints: $matchPoints, autoPoints: $autoPoints, bargePoints: $bargePoints, wins: $wins, losses: $losses, ties: $ties, disqualifications: $disqualifications, played: $played)';
}


}

/// @nodoc
abstract mixin class $CheesyTeamRankingCopyWith<$Res>  {
  factory $CheesyTeamRankingCopyWith(CheesyTeamRanking value, $Res Function(CheesyTeamRanking) _then) = _$CheesyTeamRankingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'TeamId') int teamId,@JsonKey(name: 'Rank') int rank,@JsonKey(name: 'PreviousRank') int previousRank,@JsonKey(name: 'RankingPoints') int rankingPoints,@JsonKey(name: 'CoopertitionPoints') int coopertitionPoints,@JsonKey(name: 'MatchPoints') int matchPoints,@JsonKey(name: 'AutoPoints') int autoPoints,@JsonKey(name: 'BargePoints') int bargePoints,@JsonKey(name: 'Wins') int wins,@JsonKey(name: 'Losses') int losses,@JsonKey(name: 'Ties') int ties,@JsonKey(name: 'Disqualifications') int disqualifications,@JsonKey(name: 'Played') int played
});




}
/// @nodoc
class _$CheesyTeamRankingCopyWithImpl<$Res>
    implements $CheesyTeamRankingCopyWith<$Res> {
  _$CheesyTeamRankingCopyWithImpl(this._self, this._then);

  final CheesyTeamRanking _self;
  final $Res Function(CheesyTeamRanking) _then;

/// Create a copy of CheesyTeamRanking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamId = null,Object? rank = null,Object? previousRank = null,Object? rankingPoints = null,Object? coopertitionPoints = null,Object? matchPoints = null,Object? autoPoints = null,Object? bargePoints = null,Object? wins = null,Object? losses = null,Object? ties = null,Object? disqualifications = null,Object? played = null,}) {
  return _then(_self.copyWith(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,previousRank: null == previousRank ? _self.previousRank : previousRank // ignore: cast_nullable_to_non_nullable
as int,rankingPoints: null == rankingPoints ? _self.rankingPoints : rankingPoints // ignore: cast_nullable_to_non_nullable
as int,coopertitionPoints: null == coopertitionPoints ? _self.coopertitionPoints : coopertitionPoints // ignore: cast_nullable_to_non_nullable
as int,matchPoints: null == matchPoints ? _self.matchPoints : matchPoints // ignore: cast_nullable_to_non_nullable
as int,autoPoints: null == autoPoints ? _self.autoPoints : autoPoints // ignore: cast_nullable_to_non_nullable
as int,bargePoints: null == bargePoints ? _self.bargePoints : bargePoints // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,ties: null == ties ? _self.ties : ties // ignore: cast_nullable_to_non_nullable
as int,disqualifications: null == disqualifications ? _self.disqualifications : disqualifications // ignore: cast_nullable_to_non_nullable
as int,played: null == played ? _self.played : played // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheesyTeamRanking].
extension CheesyTeamRankingPatterns on CheesyTeamRanking {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheesyTeamRanking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheesyTeamRanking() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheesyTeamRanking value)  $default,){
final _that = this;
switch (_that) {
case _CheesyTeamRanking():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheesyTeamRanking value)?  $default,){
final _that = this;
switch (_that) {
case _CheesyTeamRanking() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'TeamId')  int teamId, @JsonKey(name: 'Rank')  int rank, @JsonKey(name: 'PreviousRank')  int previousRank, @JsonKey(name: 'RankingPoints')  int rankingPoints, @JsonKey(name: 'CoopertitionPoints')  int coopertitionPoints, @JsonKey(name: 'MatchPoints')  int matchPoints, @JsonKey(name: 'AutoPoints')  int autoPoints, @JsonKey(name: 'BargePoints')  int bargePoints, @JsonKey(name: 'Wins')  int wins, @JsonKey(name: 'Losses')  int losses, @JsonKey(name: 'Ties')  int ties, @JsonKey(name: 'Disqualifications')  int disqualifications, @JsonKey(name: 'Played')  int played)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheesyTeamRanking() when $default != null:
return $default(_that.teamId,_that.rank,_that.previousRank,_that.rankingPoints,_that.coopertitionPoints,_that.matchPoints,_that.autoPoints,_that.bargePoints,_that.wins,_that.losses,_that.ties,_that.disqualifications,_that.played);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'TeamId')  int teamId, @JsonKey(name: 'Rank')  int rank, @JsonKey(name: 'PreviousRank')  int previousRank, @JsonKey(name: 'RankingPoints')  int rankingPoints, @JsonKey(name: 'CoopertitionPoints')  int coopertitionPoints, @JsonKey(name: 'MatchPoints')  int matchPoints, @JsonKey(name: 'AutoPoints')  int autoPoints, @JsonKey(name: 'BargePoints')  int bargePoints, @JsonKey(name: 'Wins')  int wins, @JsonKey(name: 'Losses')  int losses, @JsonKey(name: 'Ties')  int ties, @JsonKey(name: 'Disqualifications')  int disqualifications, @JsonKey(name: 'Played')  int played)  $default,) {final _that = this;
switch (_that) {
case _CheesyTeamRanking():
return $default(_that.teamId,_that.rank,_that.previousRank,_that.rankingPoints,_that.coopertitionPoints,_that.matchPoints,_that.autoPoints,_that.bargePoints,_that.wins,_that.losses,_that.ties,_that.disqualifications,_that.played);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'TeamId')  int teamId, @JsonKey(name: 'Rank')  int rank, @JsonKey(name: 'PreviousRank')  int previousRank, @JsonKey(name: 'RankingPoints')  int rankingPoints, @JsonKey(name: 'CoopertitionPoints')  int coopertitionPoints, @JsonKey(name: 'MatchPoints')  int matchPoints, @JsonKey(name: 'AutoPoints')  int autoPoints, @JsonKey(name: 'BargePoints')  int bargePoints, @JsonKey(name: 'Wins')  int wins, @JsonKey(name: 'Losses')  int losses, @JsonKey(name: 'Ties')  int ties, @JsonKey(name: 'Disqualifications')  int disqualifications, @JsonKey(name: 'Played')  int played)?  $default,) {final _that = this;
switch (_that) {
case _CheesyTeamRanking() when $default != null:
return $default(_that.teamId,_that.rank,_that.previousRank,_that.rankingPoints,_that.coopertitionPoints,_that.matchPoints,_that.autoPoints,_that.bargePoints,_that.wins,_that.losses,_that.ties,_that.disqualifications,_that.played);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheesyTeamRanking implements CheesyTeamRanking {
  const _CheesyTeamRanking({@JsonKey(name: 'TeamId') required this.teamId, @JsonKey(name: 'Rank') this.rank = 0, @JsonKey(name: 'PreviousRank') this.previousRank = 0, @JsonKey(name: 'RankingPoints') this.rankingPoints = 0, @JsonKey(name: 'CoopertitionPoints') this.coopertitionPoints = 0, @JsonKey(name: 'MatchPoints') this.matchPoints = 0, @JsonKey(name: 'AutoPoints') this.autoPoints = 0, @JsonKey(name: 'BargePoints') this.bargePoints = 0, @JsonKey(name: 'Wins') this.wins = 0, @JsonKey(name: 'Losses') this.losses = 0, @JsonKey(name: 'Ties') this.ties = 0, @JsonKey(name: 'Disqualifications') this.disqualifications = 0, @JsonKey(name: 'Played') this.played = 0});
  factory _CheesyTeamRanking.fromJson(Map<String, dynamic> json) => _$CheesyTeamRankingFromJson(json);

@override@JsonKey(name: 'TeamId') final  int teamId;
@override@JsonKey(name: 'Rank') final  int rank;
@override@JsonKey(name: 'PreviousRank') final  int previousRank;
@override@JsonKey(name: 'RankingPoints') final  int rankingPoints;
@override@JsonKey(name: 'CoopertitionPoints') final  int coopertitionPoints;
@override@JsonKey(name: 'MatchPoints') final  int matchPoints;
@override@JsonKey(name: 'AutoPoints') final  int autoPoints;
@override@JsonKey(name: 'BargePoints') final  int bargePoints;
@override@JsonKey(name: 'Wins') final  int wins;
@override@JsonKey(name: 'Losses') final  int losses;
@override@JsonKey(name: 'Ties') final  int ties;
@override@JsonKey(name: 'Disqualifications') final  int disqualifications;
@override@JsonKey(name: 'Played') final  int played;

/// Create a copy of CheesyTeamRanking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheesyTeamRankingCopyWith<_CheesyTeamRanking> get copyWith => __$CheesyTeamRankingCopyWithImpl<_CheesyTeamRanking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheesyTeamRankingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheesyTeamRanking&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.previousRank, previousRank) || other.previousRank == previousRank)&&(identical(other.rankingPoints, rankingPoints) || other.rankingPoints == rankingPoints)&&(identical(other.coopertitionPoints, coopertitionPoints) || other.coopertitionPoints == coopertitionPoints)&&(identical(other.matchPoints, matchPoints) || other.matchPoints == matchPoints)&&(identical(other.autoPoints, autoPoints) || other.autoPoints == autoPoints)&&(identical(other.bargePoints, bargePoints) || other.bargePoints == bargePoints)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.ties, ties) || other.ties == ties)&&(identical(other.disqualifications, disqualifications) || other.disqualifications == disqualifications)&&(identical(other.played, played) || other.played == played));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,rank,previousRank,rankingPoints,coopertitionPoints,matchPoints,autoPoints,bargePoints,wins,losses,ties,disqualifications,played);

@override
String toString() {
  return 'CheesyTeamRanking(teamId: $teamId, rank: $rank, previousRank: $previousRank, rankingPoints: $rankingPoints, coopertitionPoints: $coopertitionPoints, matchPoints: $matchPoints, autoPoints: $autoPoints, bargePoints: $bargePoints, wins: $wins, losses: $losses, ties: $ties, disqualifications: $disqualifications, played: $played)';
}


}

/// @nodoc
abstract mixin class _$CheesyTeamRankingCopyWith<$Res> implements $CheesyTeamRankingCopyWith<$Res> {
  factory _$CheesyTeamRankingCopyWith(_CheesyTeamRanking value, $Res Function(_CheesyTeamRanking) _then) = __$CheesyTeamRankingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'TeamId') int teamId,@JsonKey(name: 'Rank') int rank,@JsonKey(name: 'PreviousRank') int previousRank,@JsonKey(name: 'RankingPoints') int rankingPoints,@JsonKey(name: 'CoopertitionPoints') int coopertitionPoints,@JsonKey(name: 'MatchPoints') int matchPoints,@JsonKey(name: 'AutoPoints') int autoPoints,@JsonKey(name: 'BargePoints') int bargePoints,@JsonKey(name: 'Wins') int wins,@JsonKey(name: 'Losses') int losses,@JsonKey(name: 'Ties') int ties,@JsonKey(name: 'Disqualifications') int disqualifications,@JsonKey(name: 'Played') int played
});




}
/// @nodoc
class __$CheesyTeamRankingCopyWithImpl<$Res>
    implements _$CheesyTeamRankingCopyWith<$Res> {
  __$CheesyTeamRankingCopyWithImpl(this._self, this._then);

  final _CheesyTeamRanking _self;
  final $Res Function(_CheesyTeamRanking) _then;

/// Create a copy of CheesyTeamRanking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? rank = null,Object? previousRank = null,Object? rankingPoints = null,Object? coopertitionPoints = null,Object? matchPoints = null,Object? autoPoints = null,Object? bargePoints = null,Object? wins = null,Object? losses = null,Object? ties = null,Object? disqualifications = null,Object? played = null,}) {
  return _then(_CheesyTeamRanking(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,previousRank: null == previousRank ? _self.previousRank : previousRank // ignore: cast_nullable_to_non_nullable
as int,rankingPoints: null == rankingPoints ? _self.rankingPoints : rankingPoints // ignore: cast_nullable_to_non_nullable
as int,coopertitionPoints: null == coopertitionPoints ? _self.coopertitionPoints : coopertitionPoints // ignore: cast_nullable_to_non_nullable
as int,matchPoints: null == matchPoints ? _self.matchPoints : matchPoints // ignore: cast_nullable_to_non_nullable
as int,autoPoints: null == autoPoints ? _self.autoPoints : autoPoints // ignore: cast_nullable_to_non_nullable
as int,bargePoints: null == bargePoints ? _self.bargePoints : bargePoints // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,ties: null == ties ? _self.ties : ties // ignore: cast_nullable_to_non_nullable
as int,disqualifications: null == disqualifications ? _self.disqualifications : disqualifications // ignore: cast_nullable_to_non_nullable
as int,played: null == played ? _self.played : played // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
