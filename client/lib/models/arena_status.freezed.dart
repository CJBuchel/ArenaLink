// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arena_status.dart';

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
mixin _$ArenaStatus {

@JsonKey(name: 'MatchId') int get matchId;@JsonKey(name: 'AllianceStations') Map<String, AllianceStation> get allianceStations;@JsonKey(name: 'MatchState') int get matchState;@JsonKey(name: 'CanStartMatch') bool get canStartMatch;@JsonKey(name: 'PlcIsHealthy') bool get plcIsHealthy;@JsonKey(name: 'FieldEStop') bool get fieldEStop;@JsonKey(name: 'AccessPointStatus') String get accessPointStatus;@JsonKey(name: 'SwitchStatus') String get switchStatus;@JsonKey(name: 'RedSCCStatus') String get redSccStatus;@JsonKey(name: 'BlueSCCStatus') String get blueSccStatus;@JsonKey(name: 'PlcArmorBlockStatuses') Map<String, bool>? get plcArmorBlockStatuses;
/// Create a copy of ArenaStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArenaStatusCopyWith<ArenaStatus> get copyWith => _$ArenaStatusCopyWithImpl<ArenaStatus>(this as ArenaStatus, _$identity);

  /// Serializes this ArenaStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArenaStatus&&(identical(other.matchId, matchId) || other.matchId == matchId)&&const DeepCollectionEquality().equals(other.allianceStations, allianceStations)&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.canStartMatch, canStartMatch) || other.canStartMatch == canStartMatch)&&(identical(other.plcIsHealthy, plcIsHealthy) || other.plcIsHealthy == plcIsHealthy)&&(identical(other.fieldEStop, fieldEStop) || other.fieldEStop == fieldEStop)&&(identical(other.accessPointStatus, accessPointStatus) || other.accessPointStatus == accessPointStatus)&&(identical(other.switchStatus, switchStatus) || other.switchStatus == switchStatus)&&(identical(other.redSccStatus, redSccStatus) || other.redSccStatus == redSccStatus)&&(identical(other.blueSccStatus, blueSccStatus) || other.blueSccStatus == blueSccStatus)&&const DeepCollectionEquality().equals(other.plcArmorBlockStatuses, plcArmorBlockStatuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,const DeepCollectionEquality().hash(allianceStations),matchState,canStartMatch,plcIsHealthy,fieldEStop,accessPointStatus,switchStatus,redSccStatus,blueSccStatus,const DeepCollectionEquality().hash(plcArmorBlockStatuses));

@override
String toString() {
  return 'ArenaStatus(matchId: $matchId, allianceStations: $allianceStations, matchState: $matchState, canStartMatch: $canStartMatch, plcIsHealthy: $plcIsHealthy, fieldEStop: $fieldEStop, accessPointStatus: $accessPointStatus, switchStatus: $switchStatus, redSccStatus: $redSccStatus, blueSccStatus: $blueSccStatus, plcArmorBlockStatuses: $plcArmorBlockStatuses)';
}


}

/// @nodoc
abstract mixin class $ArenaStatusCopyWith<$Res>  {
  factory $ArenaStatusCopyWith(ArenaStatus value, $Res Function(ArenaStatus) _then) = _$ArenaStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MatchId') int matchId,@JsonKey(name: 'AllianceStations') Map<String, AllianceStation> allianceStations,@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'CanStartMatch') bool canStartMatch,@JsonKey(name: 'PlcIsHealthy') bool plcIsHealthy,@JsonKey(name: 'FieldEStop') bool fieldEStop,@JsonKey(name: 'AccessPointStatus') String accessPointStatus,@JsonKey(name: 'SwitchStatus') String switchStatus,@JsonKey(name: 'RedSCCStatus') String redSccStatus,@JsonKey(name: 'BlueSCCStatus') String blueSccStatus,@JsonKey(name: 'PlcArmorBlockStatuses') Map<String, bool>? plcArmorBlockStatuses
});




}
/// @nodoc
class _$ArenaStatusCopyWithImpl<$Res>
    implements $ArenaStatusCopyWith<$Res> {
  _$ArenaStatusCopyWithImpl(this._self, this._then);

  final ArenaStatus _self;
  final $Res Function(ArenaStatus) _then;

/// Create a copy of ArenaStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchId = null,Object? allianceStations = null,Object? matchState = null,Object? canStartMatch = null,Object? plcIsHealthy = null,Object? fieldEStop = null,Object? accessPointStatus = null,Object? switchStatus = null,Object? redSccStatus = null,Object? blueSccStatus = null,Object? plcArmorBlockStatuses = freezed,}) {
  return _then(_self.copyWith(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,allianceStations: null == allianceStations ? _self.allianceStations : allianceStations // ignore: cast_nullable_to_non_nullable
as Map<String, AllianceStation>,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [ArenaStatus].
extension ArenaStatusPatterns on ArenaStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArenaStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArenaStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArenaStatus value)  $default,){
final _that = this;
switch (_that) {
case _ArenaStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArenaStatus value)?  $default,){
final _that = this;
switch (_that) {
case _ArenaStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'MatchId')  int matchId, @JsonKey(name: 'AllianceStations')  Map<String, AllianceStation> allianceStations, @JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'CanStartMatch')  bool canStartMatch, @JsonKey(name: 'PlcIsHealthy')  bool plcIsHealthy, @JsonKey(name: 'FieldEStop')  bool fieldEStop, @JsonKey(name: 'AccessPointStatus')  String accessPointStatus, @JsonKey(name: 'SwitchStatus')  String switchStatus, @JsonKey(name: 'RedSCCStatus')  String redSccStatus, @JsonKey(name: 'BlueSCCStatus')  String blueSccStatus, @JsonKey(name: 'PlcArmorBlockStatuses')  Map<String, bool>? plcArmorBlockStatuses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArenaStatus() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'MatchId')  int matchId, @JsonKey(name: 'AllianceStations')  Map<String, AllianceStation> allianceStations, @JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'CanStartMatch')  bool canStartMatch, @JsonKey(name: 'PlcIsHealthy')  bool plcIsHealthy, @JsonKey(name: 'FieldEStop')  bool fieldEStop, @JsonKey(name: 'AccessPointStatus')  String accessPointStatus, @JsonKey(name: 'SwitchStatus')  String switchStatus, @JsonKey(name: 'RedSCCStatus')  String redSccStatus, @JsonKey(name: 'BlueSCCStatus')  String blueSccStatus, @JsonKey(name: 'PlcArmorBlockStatuses')  Map<String, bool>? plcArmorBlockStatuses)  $default,) {final _that = this;
switch (_that) {
case _ArenaStatus():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'MatchId')  int matchId, @JsonKey(name: 'AllianceStations')  Map<String, AllianceStation> allianceStations, @JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'CanStartMatch')  bool canStartMatch, @JsonKey(name: 'PlcIsHealthy')  bool plcIsHealthy, @JsonKey(name: 'FieldEStop')  bool fieldEStop, @JsonKey(name: 'AccessPointStatus')  String accessPointStatus, @JsonKey(name: 'SwitchStatus')  String switchStatus, @JsonKey(name: 'RedSCCStatus')  String redSccStatus, @JsonKey(name: 'BlueSCCStatus')  String blueSccStatus, @JsonKey(name: 'PlcArmorBlockStatuses')  Map<String, bool>? plcArmorBlockStatuses)?  $default,) {final _that = this;
switch (_that) {
case _ArenaStatus() when $default != null:
return $default(_that.matchId,_that.allianceStations,_that.matchState,_that.canStartMatch,_that.plcIsHealthy,_that.fieldEStop,_that.accessPointStatus,_that.switchStatus,_that.redSccStatus,_that.blueSccStatus,_that.plcArmorBlockStatuses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArenaStatus implements ArenaStatus {
  const _ArenaStatus({@JsonKey(name: 'MatchId') required this.matchId, @JsonKey(name: 'AllianceStations') required final  Map<String, AllianceStation> allianceStations, @JsonKey(name: 'MatchState') required this.matchState, @JsonKey(name: 'CanStartMatch') required this.canStartMatch, @JsonKey(name: 'PlcIsHealthy') required this.plcIsHealthy, @JsonKey(name: 'FieldEStop') required this.fieldEStop, @JsonKey(name: 'AccessPointStatus') this.accessPointStatus = 'UNKNOWN', @JsonKey(name: 'SwitchStatus') this.switchStatus = 'UNKNOWN', @JsonKey(name: 'RedSCCStatus') this.redSccStatus = 'UNKNOWN', @JsonKey(name: 'BlueSCCStatus') this.blueSccStatus = 'UNKNOWN', @JsonKey(name: 'PlcArmorBlockStatuses') final  Map<String, bool>? plcArmorBlockStatuses}): _allianceStations = allianceStations,_plcArmorBlockStatuses = plcArmorBlockStatuses;
  factory _ArenaStatus.fromJson(Map<String, dynamic> json) => _$ArenaStatusFromJson(json);

@override@JsonKey(name: 'MatchId') final  int matchId;
 final  Map<String, AllianceStation> _allianceStations;
@override@JsonKey(name: 'AllianceStations') Map<String, AllianceStation> get allianceStations {
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


/// Create a copy of ArenaStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArenaStatusCopyWith<_ArenaStatus> get copyWith => __$ArenaStatusCopyWithImpl<_ArenaStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArenaStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArenaStatus&&(identical(other.matchId, matchId) || other.matchId == matchId)&&const DeepCollectionEquality().equals(other._allianceStations, _allianceStations)&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.canStartMatch, canStartMatch) || other.canStartMatch == canStartMatch)&&(identical(other.plcIsHealthy, plcIsHealthy) || other.plcIsHealthy == plcIsHealthy)&&(identical(other.fieldEStop, fieldEStop) || other.fieldEStop == fieldEStop)&&(identical(other.accessPointStatus, accessPointStatus) || other.accessPointStatus == accessPointStatus)&&(identical(other.switchStatus, switchStatus) || other.switchStatus == switchStatus)&&(identical(other.redSccStatus, redSccStatus) || other.redSccStatus == redSccStatus)&&(identical(other.blueSccStatus, blueSccStatus) || other.blueSccStatus == blueSccStatus)&&const DeepCollectionEquality().equals(other._plcArmorBlockStatuses, _plcArmorBlockStatuses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,const DeepCollectionEquality().hash(_allianceStations),matchState,canStartMatch,plcIsHealthy,fieldEStop,accessPointStatus,switchStatus,redSccStatus,blueSccStatus,const DeepCollectionEquality().hash(_plcArmorBlockStatuses));

@override
String toString() {
  return 'ArenaStatus(matchId: $matchId, allianceStations: $allianceStations, matchState: $matchState, canStartMatch: $canStartMatch, plcIsHealthy: $plcIsHealthy, fieldEStop: $fieldEStop, accessPointStatus: $accessPointStatus, switchStatus: $switchStatus, redSccStatus: $redSccStatus, blueSccStatus: $blueSccStatus, plcArmorBlockStatuses: $plcArmorBlockStatuses)';
}


}

/// @nodoc
abstract mixin class _$ArenaStatusCopyWith<$Res> implements $ArenaStatusCopyWith<$Res> {
  factory _$ArenaStatusCopyWith(_ArenaStatus value, $Res Function(_ArenaStatus) _then) = __$ArenaStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MatchId') int matchId,@JsonKey(name: 'AllianceStations') Map<String, AllianceStation> allianceStations,@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'CanStartMatch') bool canStartMatch,@JsonKey(name: 'PlcIsHealthy') bool plcIsHealthy,@JsonKey(name: 'FieldEStop') bool fieldEStop,@JsonKey(name: 'AccessPointStatus') String accessPointStatus,@JsonKey(name: 'SwitchStatus') String switchStatus,@JsonKey(name: 'RedSCCStatus') String redSccStatus,@JsonKey(name: 'BlueSCCStatus') String blueSccStatus,@JsonKey(name: 'PlcArmorBlockStatuses') Map<String, bool>? plcArmorBlockStatuses
});




}
/// @nodoc
class __$ArenaStatusCopyWithImpl<$Res>
    implements _$ArenaStatusCopyWith<$Res> {
  __$ArenaStatusCopyWithImpl(this._self, this._then);

  final _ArenaStatus _self;
  final $Res Function(_ArenaStatus) _then;

/// Create a copy of ArenaStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? allianceStations = null,Object? matchState = null,Object? canStartMatch = null,Object? plcIsHealthy = null,Object? fieldEStop = null,Object? accessPointStatus = null,Object? switchStatus = null,Object? redSccStatus = null,Object? blueSccStatus = null,Object? plcArmorBlockStatuses = freezed,}) {
  return _then(_ArenaStatus(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,allianceStations: null == allianceStations ? _self._allianceStations : allianceStations // ignore: cast_nullable_to_non_nullable
as Map<String, AllianceStation>,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
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
mixin _$EventStatus {

@JsonKey(name: 'CycleTime') String get cycleTime;@JsonKey(name: 'EarlyLateMessage') String get earlyLateMessage;
/// Create a copy of EventStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventStatusCopyWith<EventStatus> get copyWith => _$EventStatusCopyWithImpl<EventStatus>(this as EventStatus, _$identity);

  /// Serializes this EventStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventStatus&&(identical(other.cycleTime, cycleTime) || other.cycleTime == cycleTime)&&(identical(other.earlyLateMessage, earlyLateMessage) || other.earlyLateMessage == earlyLateMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cycleTime,earlyLateMessage);

@override
String toString() {
  return 'EventStatus(cycleTime: $cycleTime, earlyLateMessage: $earlyLateMessage)';
}


}

/// @nodoc
abstract mixin class $EventStatusCopyWith<$Res>  {
  factory $EventStatusCopyWith(EventStatus value, $Res Function(EventStatus) _then) = _$EventStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'CycleTime') String cycleTime,@JsonKey(name: 'EarlyLateMessage') String earlyLateMessage
});




}
/// @nodoc
class _$EventStatusCopyWithImpl<$Res>
    implements $EventStatusCopyWith<$Res> {
  _$EventStatusCopyWithImpl(this._self, this._then);

  final EventStatus _self;
  final $Res Function(EventStatus) _then;

/// Create a copy of EventStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cycleTime = null,Object? earlyLateMessage = null,}) {
  return _then(_self.copyWith(
cycleTime: null == cycleTime ? _self.cycleTime : cycleTime // ignore: cast_nullable_to_non_nullable
as String,earlyLateMessage: null == earlyLateMessage ? _self.earlyLateMessage : earlyLateMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EventStatus].
extension EventStatusPatterns on EventStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventStatus value)  $default,){
final _that = this;
switch (_that) {
case _EventStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventStatus value)?  $default,){
final _that = this;
switch (_that) {
case _EventStatus() when $default != null:
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
case _EventStatus() when $default != null:
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
case _EventStatus():
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
case _EventStatus() when $default != null:
return $default(_that.cycleTime,_that.earlyLateMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventStatus implements EventStatus {
  const _EventStatus({@JsonKey(name: 'CycleTime') this.cycleTime = '', @JsonKey(name: 'EarlyLateMessage') this.earlyLateMessage = ''});
  factory _EventStatus.fromJson(Map<String, dynamic> json) => _$EventStatusFromJson(json);

@override@JsonKey(name: 'CycleTime') final  String cycleTime;
@override@JsonKey(name: 'EarlyLateMessage') final  String earlyLateMessage;

/// Create a copy of EventStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventStatusCopyWith<_EventStatus> get copyWith => __$EventStatusCopyWithImpl<_EventStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventStatus&&(identical(other.cycleTime, cycleTime) || other.cycleTime == cycleTime)&&(identical(other.earlyLateMessage, earlyLateMessage) || other.earlyLateMessage == earlyLateMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cycleTime,earlyLateMessage);

@override
String toString() {
  return 'EventStatus(cycleTime: $cycleTime, earlyLateMessage: $earlyLateMessage)';
}


}

/// @nodoc
abstract mixin class _$EventStatusCopyWith<$Res> implements $EventStatusCopyWith<$Res> {
  factory _$EventStatusCopyWith(_EventStatus value, $Res Function(_EventStatus) _then) = __$EventStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'CycleTime') String cycleTime,@JsonKey(name: 'EarlyLateMessage') String earlyLateMessage
});




}
/// @nodoc
class __$EventStatusCopyWithImpl<$Res>
    implements _$EventStatusCopyWith<$Res> {
  __$EventStatusCopyWithImpl(this._self, this._then);

  final _EventStatus _self;
  final $Res Function(_EventStatus) _then;

/// Create a copy of EventStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cycleTime = null,Object? earlyLateMessage = null,}) {
  return _then(_EventStatus(
cycleTime: null == cycleTime ? _self.cycleTime : cycleTime // ignore: cast_nullable_to_non_nullable
as String,earlyLateMessage: null == earlyLateMessage ? _self.earlyLateMessage : earlyLateMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MatchTimeMessage {

@JsonKey(name: 'MatchState') int get matchState;@JsonKey(name: 'MatchTimeSec') int get matchTimeSec;
/// Create a copy of MatchTimeMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchTimeMessageCopyWith<MatchTimeMessage> get copyWith => _$MatchTimeMessageCopyWithImpl<MatchTimeMessage>(this as MatchTimeMessage, _$identity);

  /// Serializes this MatchTimeMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchTimeMessage&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.matchTimeSec, matchTimeSec) || other.matchTimeSec == matchTimeSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchState,matchTimeSec);

@override
String toString() {
  return 'MatchTimeMessage(matchState: $matchState, matchTimeSec: $matchTimeSec)';
}


}

/// @nodoc
abstract mixin class $MatchTimeMessageCopyWith<$Res>  {
  factory $MatchTimeMessageCopyWith(MatchTimeMessage value, $Res Function(MatchTimeMessage) _then) = _$MatchTimeMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'MatchTimeSec') int matchTimeSec
});




}
/// @nodoc
class _$MatchTimeMessageCopyWithImpl<$Res>
    implements $MatchTimeMessageCopyWith<$Res> {
  _$MatchTimeMessageCopyWithImpl(this._self, this._then);

  final MatchTimeMessage _self;
  final $Res Function(MatchTimeMessage) _then;

/// Create a copy of MatchTimeMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchState = null,Object? matchTimeSec = null,}) {
  return _then(_self.copyWith(
matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,matchTimeSec: null == matchTimeSec ? _self.matchTimeSec : matchTimeSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchTimeMessage].
extension MatchTimeMessagePatterns on MatchTimeMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchTimeMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchTimeMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchTimeMessage value)  $default,){
final _that = this;
switch (_that) {
case _MatchTimeMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchTimeMessage value)?  $default,){
final _that = this;
switch (_that) {
case _MatchTimeMessage() when $default != null:
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
case _MatchTimeMessage() when $default != null:
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
case _MatchTimeMessage():
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
case _MatchTimeMessage() when $default != null:
return $default(_that.matchState,_that.matchTimeSec);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchTimeMessage implements MatchTimeMessage {
  const _MatchTimeMessage({@JsonKey(name: 'MatchState') required this.matchState, @JsonKey(name: 'MatchTimeSec') required this.matchTimeSec});
  factory _MatchTimeMessage.fromJson(Map<String, dynamic> json) => _$MatchTimeMessageFromJson(json);

@override@JsonKey(name: 'MatchState') final  int matchState;
@override@JsonKey(name: 'MatchTimeSec') final  int matchTimeSec;

/// Create a copy of MatchTimeMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchTimeMessageCopyWith<_MatchTimeMessage> get copyWith => __$MatchTimeMessageCopyWithImpl<_MatchTimeMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchTimeMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchTimeMessage&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.matchTimeSec, matchTimeSec) || other.matchTimeSec == matchTimeSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchState,matchTimeSec);

@override
String toString() {
  return 'MatchTimeMessage(matchState: $matchState, matchTimeSec: $matchTimeSec)';
}


}

/// @nodoc
abstract mixin class _$MatchTimeMessageCopyWith<$Res> implements $MatchTimeMessageCopyWith<$Res> {
  factory _$MatchTimeMessageCopyWith(_MatchTimeMessage value, $Res Function(_MatchTimeMessage) _then) = __$MatchTimeMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'MatchTimeSec') int matchTimeSec
});




}
/// @nodoc
class __$MatchTimeMessageCopyWithImpl<$Res>
    implements _$MatchTimeMessageCopyWith<$Res> {
  __$MatchTimeMessageCopyWithImpl(this._self, this._then);

  final _MatchTimeMessage _self;
  final $Res Function(_MatchTimeMessage) _then;

/// Create a copy of MatchTimeMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchState = null,Object? matchTimeSec = null,}) {
  return _then(_MatchTimeMessage(
matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,matchTimeSec: null == matchTimeSec ? _self.matchTimeSec : matchTimeSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AllianceStation {

@JsonKey(name: 'DsConn') DriverStationConnection? get dsConn;@JsonKey(name: 'Ethernet') bool get ethernet;@JsonKey(name: 'AStop') bool get aStop;@JsonKey(name: 'EStop') bool get eStop;@JsonKey(name: 'Bypass') bool get bypass;@JsonKey(name: 'Team') Team? get team;@JsonKey(name: 'WifiStatus') WifiStatus get wifiStatus;@JsonKey(name: 'GameData') String get gameData;
/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllianceStationCopyWith<AllianceStation> get copyWith => _$AllianceStationCopyWithImpl<AllianceStation>(this as AllianceStation, _$identity);

  /// Serializes this AllianceStation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllianceStation&&(identical(other.dsConn, dsConn) || other.dsConn == dsConn)&&(identical(other.ethernet, ethernet) || other.ethernet == ethernet)&&(identical(other.aStop, aStop) || other.aStop == aStop)&&(identical(other.eStop, eStop) || other.eStop == eStop)&&(identical(other.bypass, bypass) || other.bypass == bypass)&&(identical(other.team, team) || other.team == team)&&(identical(other.wifiStatus, wifiStatus) || other.wifiStatus == wifiStatus)&&(identical(other.gameData, gameData) || other.gameData == gameData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsConn,ethernet,aStop,eStop,bypass,team,wifiStatus,gameData);

@override
String toString() {
  return 'AllianceStation(dsConn: $dsConn, ethernet: $ethernet, aStop: $aStop, eStop: $eStop, bypass: $bypass, team: $team, wifiStatus: $wifiStatus, gameData: $gameData)';
}


}

/// @nodoc
abstract mixin class $AllianceStationCopyWith<$Res>  {
  factory $AllianceStationCopyWith(AllianceStation value, $Res Function(AllianceStation) _then) = _$AllianceStationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'DsConn') DriverStationConnection? dsConn,@JsonKey(name: 'Ethernet') bool ethernet,@JsonKey(name: 'AStop') bool aStop,@JsonKey(name: 'EStop') bool eStop,@JsonKey(name: 'Bypass') bool bypass,@JsonKey(name: 'Team') Team? team,@JsonKey(name: 'WifiStatus') WifiStatus wifiStatus,@JsonKey(name: 'GameData') String gameData
});


$DriverStationConnectionCopyWith<$Res>? get dsConn;$TeamCopyWith<$Res>? get team;$WifiStatusCopyWith<$Res> get wifiStatus;

}
/// @nodoc
class _$AllianceStationCopyWithImpl<$Res>
    implements $AllianceStationCopyWith<$Res> {
  _$AllianceStationCopyWithImpl(this._self, this._then);

  final AllianceStation _self;
  final $Res Function(AllianceStation) _then;

/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dsConn = freezed,Object? ethernet = null,Object? aStop = null,Object? eStop = null,Object? bypass = null,Object? team = freezed,Object? wifiStatus = null,Object? gameData = null,}) {
  return _then(_self.copyWith(
dsConn: freezed == dsConn ? _self.dsConn : dsConn // ignore: cast_nullable_to_non_nullable
as DriverStationConnection?,ethernet: null == ethernet ? _self.ethernet : ethernet // ignore: cast_nullable_to_non_nullable
as bool,aStop: null == aStop ? _self.aStop : aStop // ignore: cast_nullable_to_non_nullable
as bool,eStop: null == eStop ? _self.eStop : eStop // ignore: cast_nullable_to_non_nullable
as bool,bypass: null == bypass ? _self.bypass : bypass // ignore: cast_nullable_to_non_nullable
as bool,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team?,wifiStatus: null == wifiStatus ? _self.wifiStatus : wifiStatus // ignore: cast_nullable_to_non_nullable
as WifiStatus,gameData: null == gameData ? _self.gameData : gameData // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverStationConnectionCopyWith<$Res>? get dsConn {
    if (_self.dsConn == null) {
    return null;
  }

  return $DriverStationConnectionCopyWith<$Res>(_self.dsConn!, (value) {
    return _then(_self.copyWith(dsConn: value));
  });
}/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res>? get team {
    if (_self.team == null) {
    return null;
  }

  return $TeamCopyWith<$Res>(_self.team!, (value) {
    return _then(_self.copyWith(team: value));
  });
}/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WifiStatusCopyWith<$Res> get wifiStatus {
  
  return $WifiStatusCopyWith<$Res>(_self.wifiStatus, (value) {
    return _then(_self.copyWith(wifiStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [AllianceStation].
extension AllianceStationPatterns on AllianceStation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllianceStation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllianceStation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllianceStation value)  $default,){
final _that = this;
switch (_that) {
case _AllianceStation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllianceStation value)?  $default,){
final _that = this;
switch (_that) {
case _AllianceStation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsConn')  DriverStationConnection? dsConn, @JsonKey(name: 'Ethernet')  bool ethernet, @JsonKey(name: 'AStop')  bool aStop, @JsonKey(name: 'EStop')  bool eStop, @JsonKey(name: 'Bypass')  bool bypass, @JsonKey(name: 'Team')  Team? team, @JsonKey(name: 'WifiStatus')  WifiStatus wifiStatus, @JsonKey(name: 'GameData')  String gameData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllianceStation() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsConn')  DriverStationConnection? dsConn, @JsonKey(name: 'Ethernet')  bool ethernet, @JsonKey(name: 'AStop')  bool aStop, @JsonKey(name: 'EStop')  bool eStop, @JsonKey(name: 'Bypass')  bool bypass, @JsonKey(name: 'Team')  Team? team, @JsonKey(name: 'WifiStatus')  WifiStatus wifiStatus, @JsonKey(name: 'GameData')  String gameData)  $default,) {final _that = this;
switch (_that) {
case _AllianceStation():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'DsConn')  DriverStationConnection? dsConn, @JsonKey(name: 'Ethernet')  bool ethernet, @JsonKey(name: 'AStop')  bool aStop, @JsonKey(name: 'EStop')  bool eStop, @JsonKey(name: 'Bypass')  bool bypass, @JsonKey(name: 'Team')  Team? team, @JsonKey(name: 'WifiStatus')  WifiStatus wifiStatus, @JsonKey(name: 'GameData')  String gameData)?  $default,) {final _that = this;
switch (_that) {
case _AllianceStation() when $default != null:
return $default(_that.dsConn,_that.ethernet,_that.aStop,_that.eStop,_that.bypass,_that.team,_that.wifiStatus,_that.gameData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AllianceStation implements AllianceStation {
  const _AllianceStation({@JsonKey(name: 'DsConn') this.dsConn, @JsonKey(name: 'Ethernet') required this.ethernet, @JsonKey(name: 'AStop') required this.aStop, @JsonKey(name: 'EStop') required this.eStop, @JsonKey(name: 'Bypass') required this.bypass, @JsonKey(name: 'Team') this.team, @JsonKey(name: 'WifiStatus') required this.wifiStatus, @JsonKey(name: 'GameData') this.gameData = ''});
  factory _AllianceStation.fromJson(Map<String, dynamic> json) => _$AllianceStationFromJson(json);

@override@JsonKey(name: 'DsConn') final  DriverStationConnection? dsConn;
@override@JsonKey(name: 'Ethernet') final  bool ethernet;
@override@JsonKey(name: 'AStop') final  bool aStop;
@override@JsonKey(name: 'EStop') final  bool eStop;
@override@JsonKey(name: 'Bypass') final  bool bypass;
@override@JsonKey(name: 'Team') final  Team? team;
@override@JsonKey(name: 'WifiStatus') final  WifiStatus wifiStatus;
@override@JsonKey(name: 'GameData') final  String gameData;

/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllianceStationCopyWith<_AllianceStation> get copyWith => __$AllianceStationCopyWithImpl<_AllianceStation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AllianceStationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllianceStation&&(identical(other.dsConn, dsConn) || other.dsConn == dsConn)&&(identical(other.ethernet, ethernet) || other.ethernet == ethernet)&&(identical(other.aStop, aStop) || other.aStop == aStop)&&(identical(other.eStop, eStop) || other.eStop == eStop)&&(identical(other.bypass, bypass) || other.bypass == bypass)&&(identical(other.team, team) || other.team == team)&&(identical(other.wifiStatus, wifiStatus) || other.wifiStatus == wifiStatus)&&(identical(other.gameData, gameData) || other.gameData == gameData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsConn,ethernet,aStop,eStop,bypass,team,wifiStatus,gameData);

@override
String toString() {
  return 'AllianceStation(dsConn: $dsConn, ethernet: $ethernet, aStop: $aStop, eStop: $eStop, bypass: $bypass, team: $team, wifiStatus: $wifiStatus, gameData: $gameData)';
}


}

/// @nodoc
abstract mixin class _$AllianceStationCopyWith<$Res> implements $AllianceStationCopyWith<$Res> {
  factory _$AllianceStationCopyWith(_AllianceStation value, $Res Function(_AllianceStation) _then) = __$AllianceStationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'DsConn') DriverStationConnection? dsConn,@JsonKey(name: 'Ethernet') bool ethernet,@JsonKey(name: 'AStop') bool aStop,@JsonKey(name: 'EStop') bool eStop,@JsonKey(name: 'Bypass') bool bypass,@JsonKey(name: 'Team') Team? team,@JsonKey(name: 'WifiStatus') WifiStatus wifiStatus,@JsonKey(name: 'GameData') String gameData
});


@override $DriverStationConnectionCopyWith<$Res>? get dsConn;@override $TeamCopyWith<$Res>? get team;@override $WifiStatusCopyWith<$Res> get wifiStatus;

}
/// @nodoc
class __$AllianceStationCopyWithImpl<$Res>
    implements _$AllianceStationCopyWith<$Res> {
  __$AllianceStationCopyWithImpl(this._self, this._then);

  final _AllianceStation _self;
  final $Res Function(_AllianceStation) _then;

/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dsConn = freezed,Object? ethernet = null,Object? aStop = null,Object? eStop = null,Object? bypass = null,Object? team = freezed,Object? wifiStatus = null,Object? gameData = null,}) {
  return _then(_AllianceStation(
dsConn: freezed == dsConn ? _self.dsConn : dsConn // ignore: cast_nullable_to_non_nullable
as DriverStationConnection?,ethernet: null == ethernet ? _self.ethernet : ethernet // ignore: cast_nullable_to_non_nullable
as bool,aStop: null == aStop ? _self.aStop : aStop // ignore: cast_nullable_to_non_nullable
as bool,eStop: null == eStop ? _self.eStop : eStop // ignore: cast_nullable_to_non_nullable
as bool,bypass: null == bypass ? _self.bypass : bypass // ignore: cast_nullable_to_non_nullable
as bool,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team?,wifiStatus: null == wifiStatus ? _self.wifiStatus : wifiStatus // ignore: cast_nullable_to_non_nullable
as WifiStatus,gameData: null == gameData ? _self.gameData : gameData // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverStationConnectionCopyWith<$Res>? get dsConn {
    if (_self.dsConn == null) {
    return null;
  }

  return $DriverStationConnectionCopyWith<$Res>(_self.dsConn!, (value) {
    return _then(_self.copyWith(dsConn: value));
  });
}/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res>? get team {
    if (_self.team == null) {
    return null;
  }

  return $TeamCopyWith<$Res>(_self.team!, (value) {
    return _then(_self.copyWith(team: value));
  });
}/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WifiStatusCopyWith<$Res> get wifiStatus {
  
  return $WifiStatusCopyWith<$Res>(_self.wifiStatus, (value) {
    return _then(_self.copyWith(wifiStatus: value));
  });
}
}


/// @nodoc
mixin _$WifiStatus {

@JsonKey(name: 'TeamId') int get teamId;@JsonKey(name: 'RadioLinked') bool get radioLinked;@JsonKey(name: 'MBits', fromJson: _numToDouble) double get mBits;@JsonKey(name: 'RxRate', fromJson: _numToDouble) double get rxRate;@JsonKey(name: 'TxRate', fromJson: _numToDouble) double get txRate;@JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) double get signalNoiseRatio;@JsonKey(name: 'ConnectionQuality') int get connectionQuality;
/// Create a copy of WifiStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiStatusCopyWith<WifiStatus> get copyWith => _$WifiStatusCopyWithImpl<WifiStatus>(this as WifiStatus, _$identity);

  /// Serializes this WifiStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiStatus&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.mBits, mBits) || other.mBits == mBits)&&(identical(other.rxRate, rxRate) || other.rxRate == rxRate)&&(identical(other.txRate, txRate) || other.txRate == txRate)&&(identical(other.signalNoiseRatio, signalNoiseRatio) || other.signalNoiseRatio == signalNoiseRatio)&&(identical(other.connectionQuality, connectionQuality) || other.connectionQuality == connectionQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,radioLinked,mBits,rxRate,txRate,signalNoiseRatio,connectionQuality);

@override
String toString() {
  return 'WifiStatus(teamId: $teamId, radioLinked: $radioLinked, mBits: $mBits, rxRate: $rxRate, txRate: $txRate, signalNoiseRatio: $signalNoiseRatio, connectionQuality: $connectionQuality)';
}


}

/// @nodoc
abstract mixin class $WifiStatusCopyWith<$Res>  {
  factory $WifiStatusCopyWith(WifiStatus value, $Res Function(WifiStatus) _then) = _$WifiStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'TeamId') int teamId,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'MBits', fromJson: _numToDouble) double mBits,@JsonKey(name: 'RxRate', fromJson: _numToDouble) double rxRate,@JsonKey(name: 'TxRate', fromJson: _numToDouble) double txRate,@JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) double signalNoiseRatio,@JsonKey(name: 'ConnectionQuality') int connectionQuality
});




}
/// @nodoc
class _$WifiStatusCopyWithImpl<$Res>
    implements $WifiStatusCopyWith<$Res> {
  _$WifiStatusCopyWithImpl(this._self, this._then);

  final WifiStatus _self;
  final $Res Function(WifiStatus) _then;

/// Create a copy of WifiStatus
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


/// Adds pattern-matching-related methods to [WifiStatus].
extension WifiStatusPatterns on WifiStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiStatus value)  $default,){
final _that = this;
switch (_that) {
case _WifiStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiStatus value)?  $default,){
final _that = this;
switch (_that) {
case _WifiStatus() when $default != null:
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
case _WifiStatus() when $default != null:
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
case _WifiStatus():
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
case _WifiStatus() when $default != null:
return $default(_that.teamId,_that.radioLinked,_that.mBits,_that.rxRate,_that.txRate,_that.signalNoiseRatio,_that.connectionQuality);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WifiStatus implements WifiStatus {
  const _WifiStatus({@JsonKey(name: 'TeamId') required this.teamId, @JsonKey(name: 'RadioLinked') required this.radioLinked, @JsonKey(name: 'MBits', fromJson: _numToDouble) this.mBits = 0.0, @JsonKey(name: 'RxRate', fromJson: _numToDouble) this.rxRate = 0.0, @JsonKey(name: 'TxRate', fromJson: _numToDouble) this.txRate = 0.0, @JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) this.signalNoiseRatio = 0.0, @JsonKey(name: 'ConnectionQuality') this.connectionQuality = 0});
  factory _WifiStatus.fromJson(Map<String, dynamic> json) => _$WifiStatusFromJson(json);

@override@JsonKey(name: 'TeamId') final  int teamId;
@override@JsonKey(name: 'RadioLinked') final  bool radioLinked;
@override@JsonKey(name: 'MBits', fromJson: _numToDouble) final  double mBits;
@override@JsonKey(name: 'RxRate', fromJson: _numToDouble) final  double rxRate;
@override@JsonKey(name: 'TxRate', fromJson: _numToDouble) final  double txRate;
@override@JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) final  double signalNoiseRatio;
@override@JsonKey(name: 'ConnectionQuality') final  int connectionQuality;

/// Create a copy of WifiStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiStatusCopyWith<_WifiStatus> get copyWith => __$WifiStatusCopyWithImpl<_WifiStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WifiStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiStatus&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.mBits, mBits) || other.mBits == mBits)&&(identical(other.rxRate, rxRate) || other.rxRate == rxRate)&&(identical(other.txRate, txRate) || other.txRate == txRate)&&(identical(other.signalNoiseRatio, signalNoiseRatio) || other.signalNoiseRatio == signalNoiseRatio)&&(identical(other.connectionQuality, connectionQuality) || other.connectionQuality == connectionQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,radioLinked,mBits,rxRate,txRate,signalNoiseRatio,connectionQuality);

@override
String toString() {
  return 'WifiStatus(teamId: $teamId, radioLinked: $radioLinked, mBits: $mBits, rxRate: $rxRate, txRate: $txRate, signalNoiseRatio: $signalNoiseRatio, connectionQuality: $connectionQuality)';
}


}

/// @nodoc
abstract mixin class _$WifiStatusCopyWith<$Res> implements $WifiStatusCopyWith<$Res> {
  factory _$WifiStatusCopyWith(_WifiStatus value, $Res Function(_WifiStatus) _then) = __$WifiStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'TeamId') int teamId,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'MBits', fromJson: _numToDouble) double mBits,@JsonKey(name: 'RxRate', fromJson: _numToDouble) double rxRate,@JsonKey(name: 'TxRate', fromJson: _numToDouble) double txRate,@JsonKey(name: 'SignalNoiseRatio', fromJson: _numToDouble) double signalNoiseRatio,@JsonKey(name: 'ConnectionQuality') int connectionQuality
});




}
/// @nodoc
class __$WifiStatusCopyWithImpl<$Res>
    implements _$WifiStatusCopyWith<$Res> {
  __$WifiStatusCopyWithImpl(this._self, this._then);

  final _WifiStatus _self;
  final $Res Function(_WifiStatus) _then;

/// Create a copy of WifiStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? radioLinked = null,Object? mBits = null,Object? rxRate = null,Object? txRate = null,Object? signalNoiseRatio = null,Object? connectionQuality = null,}) {
  return _then(_WifiStatus(
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
mixin _$DriverStationConnection {

@JsonKey(name: 'DsLinked') bool get dsLinked;@JsonKey(name: 'RioLinked') bool get rioLinked;@JsonKey(name: 'RobotLinked') bool get robotLinked;@JsonKey(name: 'RadioLinked') bool get radioLinked;@JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) double get batteryVoltage;@JsonKey(name: 'DsRobotTripTimeMs') int get dsRobotTripTimeMs;@JsonKey(name: 'MissedPacketCount') int get missedPacketCount;
/// Create a copy of DriverStationConnection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverStationConnectionCopyWith<DriverStationConnection> get copyWith => _$DriverStationConnectionCopyWithImpl<DriverStationConnection>(this as DriverStationConnection, _$identity);

  /// Serializes this DriverStationConnection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverStationConnection&&(identical(other.dsLinked, dsLinked) || other.dsLinked == dsLinked)&&(identical(other.rioLinked, rioLinked) || other.rioLinked == rioLinked)&&(identical(other.robotLinked, robotLinked) || other.robotLinked == robotLinked)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.batteryVoltage, batteryVoltage) || other.batteryVoltage == batteryVoltage)&&(identical(other.dsRobotTripTimeMs, dsRobotTripTimeMs) || other.dsRobotTripTimeMs == dsRobotTripTimeMs)&&(identical(other.missedPacketCount, missedPacketCount) || other.missedPacketCount == missedPacketCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsLinked,rioLinked,robotLinked,radioLinked,batteryVoltage,dsRobotTripTimeMs,missedPacketCount);

@override
String toString() {
  return 'DriverStationConnection(dsLinked: $dsLinked, rioLinked: $rioLinked, robotLinked: $robotLinked, radioLinked: $radioLinked, batteryVoltage: $batteryVoltage, dsRobotTripTimeMs: $dsRobotTripTimeMs, missedPacketCount: $missedPacketCount)';
}


}

/// @nodoc
abstract mixin class $DriverStationConnectionCopyWith<$Res>  {
  factory $DriverStationConnectionCopyWith(DriverStationConnection value, $Res Function(DriverStationConnection) _then) = _$DriverStationConnectionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'DsLinked') bool dsLinked,@JsonKey(name: 'RioLinked') bool rioLinked,@JsonKey(name: 'RobotLinked') bool robotLinked,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) double batteryVoltage,@JsonKey(name: 'DsRobotTripTimeMs') int dsRobotTripTimeMs,@JsonKey(name: 'MissedPacketCount') int missedPacketCount
});




}
/// @nodoc
class _$DriverStationConnectionCopyWithImpl<$Res>
    implements $DriverStationConnectionCopyWith<$Res> {
  _$DriverStationConnectionCopyWithImpl(this._self, this._then);

  final DriverStationConnection _self;
  final $Res Function(DriverStationConnection) _then;

/// Create a copy of DriverStationConnection
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


/// Adds pattern-matching-related methods to [DriverStationConnection].
extension DriverStationConnectionPatterns on DriverStationConnection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverStationConnection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverStationConnection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverStationConnection value)  $default,){
final _that = this;
switch (_that) {
case _DriverStationConnection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverStationConnection value)?  $default,){
final _that = this;
switch (_that) {
case _DriverStationConnection() when $default != null:
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
case _DriverStationConnection() when $default != null:
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
case _DriverStationConnection():
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
case _DriverStationConnection() when $default != null:
return $default(_that.dsLinked,_that.rioLinked,_that.robotLinked,_that.radioLinked,_that.batteryVoltage,_that.dsRobotTripTimeMs,_that.missedPacketCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverStationConnection implements DriverStationConnection {
  const _DriverStationConnection({@JsonKey(name: 'DsLinked') required this.dsLinked, @JsonKey(name: 'RioLinked') this.rioLinked = false, @JsonKey(name: 'RobotLinked') required this.robotLinked, @JsonKey(name: 'RadioLinked') required this.radioLinked, @JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) required this.batteryVoltage, @JsonKey(name: 'DsRobotTripTimeMs') required this.dsRobotTripTimeMs, @JsonKey(name: 'MissedPacketCount') required this.missedPacketCount});
  factory _DriverStationConnection.fromJson(Map<String, dynamic> json) => _$DriverStationConnectionFromJson(json);

@override@JsonKey(name: 'DsLinked') final  bool dsLinked;
@override@JsonKey(name: 'RioLinked') final  bool rioLinked;
@override@JsonKey(name: 'RobotLinked') final  bool robotLinked;
@override@JsonKey(name: 'RadioLinked') final  bool radioLinked;
@override@JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) final  double batteryVoltage;
@override@JsonKey(name: 'DsRobotTripTimeMs') final  int dsRobotTripTimeMs;
@override@JsonKey(name: 'MissedPacketCount') final  int missedPacketCount;

/// Create a copy of DriverStationConnection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverStationConnectionCopyWith<_DriverStationConnection> get copyWith => __$DriverStationConnectionCopyWithImpl<_DriverStationConnection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverStationConnectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverStationConnection&&(identical(other.dsLinked, dsLinked) || other.dsLinked == dsLinked)&&(identical(other.rioLinked, rioLinked) || other.rioLinked == rioLinked)&&(identical(other.robotLinked, robotLinked) || other.robotLinked == robotLinked)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.batteryVoltage, batteryVoltage) || other.batteryVoltage == batteryVoltage)&&(identical(other.dsRobotTripTimeMs, dsRobotTripTimeMs) || other.dsRobotTripTimeMs == dsRobotTripTimeMs)&&(identical(other.missedPacketCount, missedPacketCount) || other.missedPacketCount == missedPacketCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsLinked,rioLinked,robotLinked,radioLinked,batteryVoltage,dsRobotTripTimeMs,missedPacketCount);

@override
String toString() {
  return 'DriverStationConnection(dsLinked: $dsLinked, rioLinked: $rioLinked, robotLinked: $robotLinked, radioLinked: $radioLinked, batteryVoltage: $batteryVoltage, dsRobotTripTimeMs: $dsRobotTripTimeMs, missedPacketCount: $missedPacketCount)';
}


}

/// @nodoc
abstract mixin class _$DriverStationConnectionCopyWith<$Res> implements $DriverStationConnectionCopyWith<$Res> {
  factory _$DriverStationConnectionCopyWith(_DriverStationConnection value, $Res Function(_DriverStationConnection) _then) = __$DriverStationConnectionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'DsLinked') bool dsLinked,@JsonKey(name: 'RioLinked') bool rioLinked,@JsonKey(name: 'RobotLinked') bool robotLinked,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'BatteryVoltage', fromJson: _numToDouble) double batteryVoltage,@JsonKey(name: 'DsRobotTripTimeMs') int dsRobotTripTimeMs,@JsonKey(name: 'MissedPacketCount') int missedPacketCount
});




}
/// @nodoc
class __$DriverStationConnectionCopyWithImpl<$Res>
    implements _$DriverStationConnectionCopyWith<$Res> {
  __$DriverStationConnectionCopyWithImpl(this._self, this._then);

  final _DriverStationConnection _self;
  final $Res Function(_DriverStationConnection) _then;

/// Create a copy of DriverStationConnection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dsLinked = null,Object? rioLinked = null,Object? robotLinked = null,Object? radioLinked = null,Object? batteryVoltage = null,Object? dsRobotTripTimeMs = null,Object? missedPacketCount = null,}) {
  return _then(_DriverStationConnection(
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
mixin _$Team {

@JsonKey(name: 'Id') int get id;@JsonKey(name: 'Name') String get name;@JsonKey(name: 'Nickname') String get nickname;@JsonKey(name: 'City') String get city;@JsonKey(name: 'StateProv') String get stateProv;@JsonKey(name: 'Country') String get country;@JsonKey(name: 'SchoolName') String get schoolName;@JsonKey(name: 'RookieYear') int get rookieYear;@JsonKey(name: 'RobotName') String get robotName;@JsonKey(name: 'YellowCard') bool get yellowCard;@JsonKey(name: 'HasConnected') bool get hasConnected;@JsonKey(name: 'FtaNotes') String get ftaNotes;
/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamCopyWith<Team> get copyWith => _$TeamCopyWithImpl<Team>(this as Team, _$identity);

  /// Serializes this Team to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Team&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.city, city) || other.city == city)&&(identical(other.stateProv, stateProv) || other.stateProv == stateProv)&&(identical(other.country, country) || other.country == country)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.rookieYear, rookieYear) || other.rookieYear == rookieYear)&&(identical(other.robotName, robotName) || other.robotName == robotName)&&(identical(other.yellowCard, yellowCard) || other.yellowCard == yellowCard)&&(identical(other.hasConnected, hasConnected) || other.hasConnected == hasConnected)&&(identical(other.ftaNotes, ftaNotes) || other.ftaNotes == ftaNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nickname,city,stateProv,country,schoolName,rookieYear,robotName,yellowCard,hasConnected,ftaNotes);

@override
String toString() {
  return 'Team(id: $id, name: $name, nickname: $nickname, city: $city, stateProv: $stateProv, country: $country, schoolName: $schoolName, rookieYear: $rookieYear, robotName: $robotName, yellowCard: $yellowCard, hasConnected: $hasConnected, ftaNotes: $ftaNotes)';
}


}

/// @nodoc
abstract mixin class $TeamCopyWith<$Res>  {
  factory $TeamCopyWith(Team value, $Res Function(Team) _then) = _$TeamCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name') String name,@JsonKey(name: 'Nickname') String nickname,@JsonKey(name: 'City') String city,@JsonKey(name: 'StateProv') String stateProv,@JsonKey(name: 'Country') String country,@JsonKey(name: 'SchoolName') String schoolName,@JsonKey(name: 'RookieYear') int rookieYear,@JsonKey(name: 'RobotName') String robotName,@JsonKey(name: 'YellowCard') bool yellowCard,@JsonKey(name: 'HasConnected') bool hasConnected,@JsonKey(name: 'FtaNotes') String ftaNotes
});




}
/// @nodoc
class _$TeamCopyWithImpl<$Res>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._self, this._then);

  final Team _self;
  final $Res Function(Team) _then;

/// Create a copy of Team
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


/// Adds pattern-matching-related methods to [Team].
extension TeamPatterns on Team {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Team value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Team() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Team value)  $default,){
final _that = this;
switch (_that) {
case _Team():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Team value)?  $default,){
final _that = this;
switch (_that) {
case _Team() when $default != null:
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
case _Team() when $default != null:
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
case _Team():
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
case _Team() when $default != null:
return $default(_that.id,_that.name,_that.nickname,_that.city,_that.stateProv,_that.country,_that.schoolName,_that.rookieYear,_that.robotName,_that.yellowCard,_that.hasConnected,_that.ftaNotes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Team implements Team {
  const _Team({@JsonKey(name: 'Id') required this.id, @JsonKey(name: 'Name') required this.name, @JsonKey(name: 'Nickname') this.nickname = '', @JsonKey(name: 'City') this.city = '', @JsonKey(name: 'StateProv') this.stateProv = '', @JsonKey(name: 'Country') this.country = '', @JsonKey(name: 'SchoolName') this.schoolName = '', @JsonKey(name: 'RookieYear') this.rookieYear = 0, @JsonKey(name: 'RobotName') this.robotName = '', @JsonKey(name: 'YellowCard') this.yellowCard = false, @JsonKey(name: 'HasConnected') this.hasConnected = false, @JsonKey(name: 'FtaNotes') this.ftaNotes = ''});
  factory _Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

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

/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamCopyWith<_Team> get copyWith => __$TeamCopyWithImpl<_Team>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Team&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.city, city) || other.city == city)&&(identical(other.stateProv, stateProv) || other.stateProv == stateProv)&&(identical(other.country, country) || other.country == country)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.rookieYear, rookieYear) || other.rookieYear == rookieYear)&&(identical(other.robotName, robotName) || other.robotName == robotName)&&(identical(other.yellowCard, yellowCard) || other.yellowCard == yellowCard)&&(identical(other.hasConnected, hasConnected) || other.hasConnected == hasConnected)&&(identical(other.ftaNotes, ftaNotes) || other.ftaNotes == ftaNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nickname,city,stateProv,country,schoolName,rookieYear,robotName,yellowCard,hasConnected,ftaNotes);

@override
String toString() {
  return 'Team(id: $id, name: $name, nickname: $nickname, city: $city, stateProv: $stateProv, country: $country, schoolName: $schoolName, rookieYear: $rookieYear, robotName: $robotName, yellowCard: $yellowCard, hasConnected: $hasConnected, ftaNotes: $ftaNotes)';
}


}

/// @nodoc
abstract mixin class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) _then) = __$TeamCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name') String name,@JsonKey(name: 'Nickname') String nickname,@JsonKey(name: 'City') String city,@JsonKey(name: 'StateProv') String stateProv,@JsonKey(name: 'Country') String country,@JsonKey(name: 'SchoolName') String schoolName,@JsonKey(name: 'RookieYear') int rookieYear,@JsonKey(name: 'RobotName') String robotName,@JsonKey(name: 'YellowCard') bool yellowCard,@JsonKey(name: 'HasConnected') bool hasConnected,@JsonKey(name: 'FtaNotes') String ftaNotes
});




}
/// @nodoc
class __$TeamCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(this._self, this._then);

  final _Team _self;
  final $Res Function(_Team) _then;

/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nickname = null,Object? city = null,Object? stateProv = null,Object? country = null,Object? schoolName = null,Object? rookieYear = null,Object? robotName = null,Object? yellowCard = null,Object? hasConnected = null,Object? ftaNotes = null,}) {
  return _then(_Team(
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

// dart format on
