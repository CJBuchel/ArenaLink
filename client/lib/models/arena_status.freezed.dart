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

@JsonKey(name: 'MatchId') int get matchId;@JsonKey(name: 'AllianceStations') Map<String, AllianceStation> get allianceStations;@JsonKey(name: 'MatchState') int get matchState;@JsonKey(name: 'CanStartMatch') bool get canStartMatch;@JsonKey(name: 'PlcIsHealthy') bool get plcIsHealthy;@JsonKey(name: 'FieldEStop') bool get fieldEStop;
/// Create a copy of ArenaStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArenaStatusCopyWith<ArenaStatus> get copyWith => _$ArenaStatusCopyWithImpl<ArenaStatus>(this as ArenaStatus, _$identity);

  /// Serializes this ArenaStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArenaStatus&&(identical(other.matchId, matchId) || other.matchId == matchId)&&const DeepCollectionEquality().equals(other.allianceStations, allianceStations)&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.canStartMatch, canStartMatch) || other.canStartMatch == canStartMatch)&&(identical(other.plcIsHealthy, plcIsHealthy) || other.plcIsHealthy == plcIsHealthy)&&(identical(other.fieldEStop, fieldEStop) || other.fieldEStop == fieldEStop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,const DeepCollectionEquality().hash(allianceStations),matchState,canStartMatch,plcIsHealthy,fieldEStop);

@override
String toString() {
  return 'ArenaStatus(matchId: $matchId, allianceStations: $allianceStations, matchState: $matchState, canStartMatch: $canStartMatch, plcIsHealthy: $plcIsHealthy, fieldEStop: $fieldEStop)';
}


}

/// @nodoc
abstract mixin class $ArenaStatusCopyWith<$Res>  {
  factory $ArenaStatusCopyWith(ArenaStatus value, $Res Function(ArenaStatus) _then) = _$ArenaStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MatchId') int matchId,@JsonKey(name: 'AllianceStations') Map<String, AllianceStation> allianceStations,@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'CanStartMatch') bool canStartMatch,@JsonKey(name: 'PlcIsHealthy') bool plcIsHealthy,@JsonKey(name: 'FieldEStop') bool fieldEStop
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
@pragma('vm:prefer-inline') @override $Res call({Object? matchId = null,Object? allianceStations = null,Object? matchState = null,Object? canStartMatch = null,Object? plcIsHealthy = null,Object? fieldEStop = null,}) {
  return _then(_self.copyWith(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,allianceStations: null == allianceStations ? _self.allianceStations : allianceStations // ignore: cast_nullable_to_non_nullable
as Map<String, AllianceStation>,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,canStartMatch: null == canStartMatch ? _self.canStartMatch : canStartMatch // ignore: cast_nullable_to_non_nullable
as bool,plcIsHealthy: null == plcIsHealthy ? _self.plcIsHealthy : plcIsHealthy // ignore: cast_nullable_to_non_nullable
as bool,fieldEStop: null == fieldEStop ? _self.fieldEStop : fieldEStop // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'MatchId')  int matchId, @JsonKey(name: 'AllianceStations')  Map<String, AllianceStation> allianceStations, @JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'CanStartMatch')  bool canStartMatch, @JsonKey(name: 'PlcIsHealthy')  bool plcIsHealthy, @JsonKey(name: 'FieldEStop')  bool fieldEStop)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArenaStatus() when $default != null:
return $default(_that.matchId,_that.allianceStations,_that.matchState,_that.canStartMatch,_that.plcIsHealthy,_that.fieldEStop);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'MatchId')  int matchId, @JsonKey(name: 'AllianceStations')  Map<String, AllianceStation> allianceStations, @JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'CanStartMatch')  bool canStartMatch, @JsonKey(name: 'PlcIsHealthy')  bool plcIsHealthy, @JsonKey(name: 'FieldEStop')  bool fieldEStop)  $default,) {final _that = this;
switch (_that) {
case _ArenaStatus():
return $default(_that.matchId,_that.allianceStations,_that.matchState,_that.canStartMatch,_that.plcIsHealthy,_that.fieldEStop);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'MatchId')  int matchId, @JsonKey(name: 'AllianceStations')  Map<String, AllianceStation> allianceStations, @JsonKey(name: 'MatchState')  int matchState, @JsonKey(name: 'CanStartMatch')  bool canStartMatch, @JsonKey(name: 'PlcIsHealthy')  bool plcIsHealthy, @JsonKey(name: 'FieldEStop')  bool fieldEStop)?  $default,) {final _that = this;
switch (_that) {
case _ArenaStatus() when $default != null:
return $default(_that.matchId,_that.allianceStations,_that.matchState,_that.canStartMatch,_that.plcIsHealthy,_that.fieldEStop);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArenaStatus implements ArenaStatus {
  const _ArenaStatus({@JsonKey(name: 'MatchId') required this.matchId, @JsonKey(name: 'AllianceStations') required final  Map<String, AllianceStation> allianceStations, @JsonKey(name: 'MatchState') required this.matchState, @JsonKey(name: 'CanStartMatch') required this.canStartMatch, @JsonKey(name: 'PlcIsHealthy') required this.plcIsHealthy, @JsonKey(name: 'FieldEStop') required this.fieldEStop}): _allianceStations = allianceStations;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArenaStatus&&(identical(other.matchId, matchId) || other.matchId == matchId)&&const DeepCollectionEquality().equals(other._allianceStations, _allianceStations)&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.canStartMatch, canStartMatch) || other.canStartMatch == canStartMatch)&&(identical(other.plcIsHealthy, plcIsHealthy) || other.plcIsHealthy == plcIsHealthy)&&(identical(other.fieldEStop, fieldEStop) || other.fieldEStop == fieldEStop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,const DeepCollectionEquality().hash(_allianceStations),matchState,canStartMatch,plcIsHealthy,fieldEStop);

@override
String toString() {
  return 'ArenaStatus(matchId: $matchId, allianceStations: $allianceStations, matchState: $matchState, canStartMatch: $canStartMatch, plcIsHealthy: $plcIsHealthy, fieldEStop: $fieldEStop)';
}


}

/// @nodoc
abstract mixin class _$ArenaStatusCopyWith<$Res> implements $ArenaStatusCopyWith<$Res> {
  factory _$ArenaStatusCopyWith(_ArenaStatus value, $Res Function(_ArenaStatus) _then) = __$ArenaStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MatchId') int matchId,@JsonKey(name: 'AllianceStations') Map<String, AllianceStation> allianceStations,@JsonKey(name: 'MatchState') int matchState,@JsonKey(name: 'CanStartMatch') bool canStartMatch,@JsonKey(name: 'PlcIsHealthy') bool plcIsHealthy,@JsonKey(name: 'FieldEStop') bool fieldEStop
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
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? allianceStations = null,Object? matchState = null,Object? canStartMatch = null,Object? plcIsHealthy = null,Object? fieldEStop = null,}) {
  return _then(_ArenaStatus(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,allianceStations: null == allianceStations ? _self._allianceStations : allianceStations // ignore: cast_nullable_to_non_nullable
as Map<String, AllianceStation>,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as int,canStartMatch: null == canStartMatch ? _self.canStartMatch : canStartMatch // ignore: cast_nullable_to_non_nullable
as bool,plcIsHealthy: null == plcIsHealthy ? _self.plcIsHealthy : plcIsHealthy // ignore: cast_nullable_to_non_nullable
as bool,fieldEStop: null == fieldEStop ? _self.fieldEStop : fieldEStop // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AllianceStation {

@JsonKey(name: 'DsConn') DriverStationConnection? get dsConn;@JsonKey(name: 'Ethernet') bool get ethernet;@JsonKey(name: 'AStop') bool get aStop;@JsonKey(name: 'EStop') bool get eStop;@JsonKey(name: 'Bypass') bool get bypass;@JsonKey(name: 'Team') Team? get team;
/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllianceStationCopyWith<AllianceStation> get copyWith => _$AllianceStationCopyWithImpl<AllianceStation>(this as AllianceStation, _$identity);

  /// Serializes this AllianceStation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllianceStation&&(identical(other.dsConn, dsConn) || other.dsConn == dsConn)&&(identical(other.ethernet, ethernet) || other.ethernet == ethernet)&&(identical(other.aStop, aStop) || other.aStop == aStop)&&(identical(other.eStop, eStop) || other.eStop == eStop)&&(identical(other.bypass, bypass) || other.bypass == bypass)&&(identical(other.team, team) || other.team == team));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsConn,ethernet,aStop,eStop,bypass,team);

@override
String toString() {
  return 'AllianceStation(dsConn: $dsConn, ethernet: $ethernet, aStop: $aStop, eStop: $eStop, bypass: $bypass, team: $team)';
}


}

/// @nodoc
abstract mixin class $AllianceStationCopyWith<$Res>  {
  factory $AllianceStationCopyWith(AllianceStation value, $Res Function(AllianceStation) _then) = _$AllianceStationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'DsConn') DriverStationConnection? dsConn,@JsonKey(name: 'Ethernet') bool ethernet,@JsonKey(name: 'AStop') bool aStop,@JsonKey(name: 'EStop') bool eStop,@JsonKey(name: 'Bypass') bool bypass,@JsonKey(name: 'Team') Team? team
});


$DriverStationConnectionCopyWith<$Res>? get dsConn;$TeamCopyWith<$Res>? get team;

}
/// @nodoc
class _$AllianceStationCopyWithImpl<$Res>
    implements $AllianceStationCopyWith<$Res> {
  _$AllianceStationCopyWithImpl(this._self, this._then);

  final AllianceStation _self;
  final $Res Function(AllianceStation) _then;

/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dsConn = freezed,Object? ethernet = null,Object? aStop = null,Object? eStop = null,Object? bypass = null,Object? team = freezed,}) {
  return _then(_self.copyWith(
dsConn: freezed == dsConn ? _self.dsConn : dsConn // ignore: cast_nullable_to_non_nullable
as DriverStationConnection?,ethernet: null == ethernet ? _self.ethernet : ethernet // ignore: cast_nullable_to_non_nullable
as bool,aStop: null == aStop ? _self.aStop : aStop // ignore: cast_nullable_to_non_nullable
as bool,eStop: null == eStop ? _self.eStop : eStop // ignore: cast_nullable_to_non_nullable
as bool,bypass: null == bypass ? _self.bypass : bypass // ignore: cast_nullable_to_non_nullable
as bool,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsConn')  DriverStationConnection? dsConn, @JsonKey(name: 'Ethernet')  bool ethernet, @JsonKey(name: 'AStop')  bool aStop, @JsonKey(name: 'EStop')  bool eStop, @JsonKey(name: 'Bypass')  bool bypass, @JsonKey(name: 'Team')  Team? team)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllianceStation() when $default != null:
return $default(_that.dsConn,_that.ethernet,_that.aStop,_that.eStop,_that.bypass,_that.team);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsConn')  DriverStationConnection? dsConn, @JsonKey(name: 'Ethernet')  bool ethernet, @JsonKey(name: 'AStop')  bool aStop, @JsonKey(name: 'EStop')  bool eStop, @JsonKey(name: 'Bypass')  bool bypass, @JsonKey(name: 'Team')  Team? team)  $default,) {final _that = this;
switch (_that) {
case _AllianceStation():
return $default(_that.dsConn,_that.ethernet,_that.aStop,_that.eStop,_that.bypass,_that.team);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'DsConn')  DriverStationConnection? dsConn, @JsonKey(name: 'Ethernet')  bool ethernet, @JsonKey(name: 'AStop')  bool aStop, @JsonKey(name: 'EStop')  bool eStop, @JsonKey(name: 'Bypass')  bool bypass, @JsonKey(name: 'Team')  Team? team)?  $default,) {final _that = this;
switch (_that) {
case _AllianceStation() when $default != null:
return $default(_that.dsConn,_that.ethernet,_that.aStop,_that.eStop,_that.bypass,_that.team);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AllianceStation implements AllianceStation {
  const _AllianceStation({@JsonKey(name: 'DsConn') this.dsConn, @JsonKey(name: 'Ethernet') required this.ethernet, @JsonKey(name: 'AStop') required this.aStop, @JsonKey(name: 'EStop') required this.eStop, @JsonKey(name: 'Bypass') required this.bypass, @JsonKey(name: 'Team') this.team});
  factory _AllianceStation.fromJson(Map<String, dynamic> json) => _$AllianceStationFromJson(json);

@override@JsonKey(name: 'DsConn') final  DriverStationConnection? dsConn;
@override@JsonKey(name: 'Ethernet') final  bool ethernet;
@override@JsonKey(name: 'AStop') final  bool aStop;
@override@JsonKey(name: 'EStop') final  bool eStop;
@override@JsonKey(name: 'Bypass') final  bool bypass;
@override@JsonKey(name: 'Team') final  Team? team;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllianceStation&&(identical(other.dsConn, dsConn) || other.dsConn == dsConn)&&(identical(other.ethernet, ethernet) || other.ethernet == ethernet)&&(identical(other.aStop, aStop) || other.aStop == aStop)&&(identical(other.eStop, eStop) || other.eStop == eStop)&&(identical(other.bypass, bypass) || other.bypass == bypass)&&(identical(other.team, team) || other.team == team));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsConn,ethernet,aStop,eStop,bypass,team);

@override
String toString() {
  return 'AllianceStation(dsConn: $dsConn, ethernet: $ethernet, aStop: $aStop, eStop: $eStop, bypass: $bypass, team: $team)';
}


}

/// @nodoc
abstract mixin class _$AllianceStationCopyWith<$Res> implements $AllianceStationCopyWith<$Res> {
  factory _$AllianceStationCopyWith(_AllianceStation value, $Res Function(_AllianceStation) _then) = __$AllianceStationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'DsConn') DriverStationConnection? dsConn,@JsonKey(name: 'Ethernet') bool ethernet,@JsonKey(name: 'AStop') bool aStop,@JsonKey(name: 'EStop') bool eStop,@JsonKey(name: 'Bypass') bool bypass,@JsonKey(name: 'Team') Team? team
});


@override $DriverStationConnectionCopyWith<$Res>? get dsConn;@override $TeamCopyWith<$Res>? get team;

}
/// @nodoc
class __$AllianceStationCopyWithImpl<$Res>
    implements _$AllianceStationCopyWith<$Res> {
  __$AllianceStationCopyWithImpl(this._self, this._then);

  final _AllianceStation _self;
  final $Res Function(_AllianceStation) _then;

/// Create a copy of AllianceStation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dsConn = freezed,Object? ethernet = null,Object? aStop = null,Object? eStop = null,Object? bypass = null,Object? team = freezed,}) {
  return _then(_AllianceStation(
dsConn: freezed == dsConn ? _self.dsConn : dsConn // ignore: cast_nullable_to_non_nullable
as DriverStationConnection?,ethernet: null == ethernet ? _self.ethernet : ethernet // ignore: cast_nullable_to_non_nullable
as bool,aStop: null == aStop ? _self.aStop : aStop // ignore: cast_nullable_to_non_nullable
as bool,eStop: null == eStop ? _self.eStop : eStop // ignore: cast_nullable_to_non_nullable
as bool,bypass: null == bypass ? _self.bypass : bypass // ignore: cast_nullable_to_non_nullable
as bool,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team?,
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
}
}


/// @nodoc
mixin _$DriverStationConnection {

@JsonKey(name: 'DsLinked') bool get dsLinked;@JsonKey(name: 'RobotLinked') bool get robotLinked;@JsonKey(name: 'RadioLinked') bool get radioLinked;@JsonKey(name: 'BatteryVoltage') double get batteryVoltage;@JsonKey(name: 'DsRobotTripTimeMs') int get dsRobotTripTimeMs;@JsonKey(name: 'MissedPacketCount') int get missedPacketCount;
/// Create a copy of DriverStationConnection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverStationConnectionCopyWith<DriverStationConnection> get copyWith => _$DriverStationConnectionCopyWithImpl<DriverStationConnection>(this as DriverStationConnection, _$identity);

  /// Serializes this DriverStationConnection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverStationConnection&&(identical(other.dsLinked, dsLinked) || other.dsLinked == dsLinked)&&(identical(other.robotLinked, robotLinked) || other.robotLinked == robotLinked)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.batteryVoltage, batteryVoltage) || other.batteryVoltage == batteryVoltage)&&(identical(other.dsRobotTripTimeMs, dsRobotTripTimeMs) || other.dsRobotTripTimeMs == dsRobotTripTimeMs)&&(identical(other.missedPacketCount, missedPacketCount) || other.missedPacketCount == missedPacketCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsLinked,robotLinked,radioLinked,batteryVoltage,dsRobotTripTimeMs,missedPacketCount);

@override
String toString() {
  return 'DriverStationConnection(dsLinked: $dsLinked, robotLinked: $robotLinked, radioLinked: $radioLinked, batteryVoltage: $batteryVoltage, dsRobotTripTimeMs: $dsRobotTripTimeMs, missedPacketCount: $missedPacketCount)';
}


}

/// @nodoc
abstract mixin class $DriverStationConnectionCopyWith<$Res>  {
  factory $DriverStationConnectionCopyWith(DriverStationConnection value, $Res Function(DriverStationConnection) _then) = _$DriverStationConnectionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'DsLinked') bool dsLinked,@JsonKey(name: 'RobotLinked') bool robotLinked,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'BatteryVoltage') double batteryVoltage,@JsonKey(name: 'DsRobotTripTimeMs') int dsRobotTripTimeMs,@JsonKey(name: 'MissedPacketCount') int missedPacketCount
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
@pragma('vm:prefer-inline') @override $Res call({Object? dsLinked = null,Object? robotLinked = null,Object? radioLinked = null,Object? batteryVoltage = null,Object? dsRobotTripTimeMs = null,Object? missedPacketCount = null,}) {
  return _then(_self.copyWith(
dsLinked: null == dsLinked ? _self.dsLinked : dsLinked // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsLinked')  bool dsLinked, @JsonKey(name: 'RobotLinked')  bool robotLinked, @JsonKey(name: 'RadioLinked')  bool radioLinked, @JsonKey(name: 'BatteryVoltage')  double batteryVoltage, @JsonKey(name: 'DsRobotTripTimeMs')  int dsRobotTripTimeMs, @JsonKey(name: 'MissedPacketCount')  int missedPacketCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverStationConnection() when $default != null:
return $default(_that.dsLinked,_that.robotLinked,_that.radioLinked,_that.batteryVoltage,_that.dsRobotTripTimeMs,_that.missedPacketCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'DsLinked')  bool dsLinked, @JsonKey(name: 'RobotLinked')  bool robotLinked, @JsonKey(name: 'RadioLinked')  bool radioLinked, @JsonKey(name: 'BatteryVoltage')  double batteryVoltage, @JsonKey(name: 'DsRobotTripTimeMs')  int dsRobotTripTimeMs, @JsonKey(name: 'MissedPacketCount')  int missedPacketCount)  $default,) {final _that = this;
switch (_that) {
case _DriverStationConnection():
return $default(_that.dsLinked,_that.robotLinked,_that.radioLinked,_that.batteryVoltage,_that.dsRobotTripTimeMs,_that.missedPacketCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'DsLinked')  bool dsLinked, @JsonKey(name: 'RobotLinked')  bool robotLinked, @JsonKey(name: 'RadioLinked')  bool radioLinked, @JsonKey(name: 'BatteryVoltage')  double batteryVoltage, @JsonKey(name: 'DsRobotTripTimeMs')  int dsRobotTripTimeMs, @JsonKey(name: 'MissedPacketCount')  int missedPacketCount)?  $default,) {final _that = this;
switch (_that) {
case _DriverStationConnection() when $default != null:
return $default(_that.dsLinked,_that.robotLinked,_that.radioLinked,_that.batteryVoltage,_that.dsRobotTripTimeMs,_that.missedPacketCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverStationConnection implements DriverStationConnection {
  const _DriverStationConnection({@JsonKey(name: 'DsLinked') required this.dsLinked, @JsonKey(name: 'RobotLinked') required this.robotLinked, @JsonKey(name: 'RadioLinked') required this.radioLinked, @JsonKey(name: 'BatteryVoltage') required this.batteryVoltage, @JsonKey(name: 'DsRobotTripTimeMs') required this.dsRobotTripTimeMs, @JsonKey(name: 'MissedPacketCount') required this.missedPacketCount});
  factory _DriverStationConnection.fromJson(Map<String, dynamic> json) => _$DriverStationConnectionFromJson(json);

@override@JsonKey(name: 'DsLinked') final  bool dsLinked;
@override@JsonKey(name: 'RobotLinked') final  bool robotLinked;
@override@JsonKey(name: 'RadioLinked') final  bool radioLinked;
@override@JsonKey(name: 'BatteryVoltage') final  double batteryVoltage;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverStationConnection&&(identical(other.dsLinked, dsLinked) || other.dsLinked == dsLinked)&&(identical(other.robotLinked, robotLinked) || other.robotLinked == robotLinked)&&(identical(other.radioLinked, radioLinked) || other.radioLinked == radioLinked)&&(identical(other.batteryVoltage, batteryVoltage) || other.batteryVoltage == batteryVoltage)&&(identical(other.dsRobotTripTimeMs, dsRobotTripTimeMs) || other.dsRobotTripTimeMs == dsRobotTripTimeMs)&&(identical(other.missedPacketCount, missedPacketCount) || other.missedPacketCount == missedPacketCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dsLinked,robotLinked,radioLinked,batteryVoltage,dsRobotTripTimeMs,missedPacketCount);

@override
String toString() {
  return 'DriverStationConnection(dsLinked: $dsLinked, robotLinked: $robotLinked, radioLinked: $radioLinked, batteryVoltage: $batteryVoltage, dsRobotTripTimeMs: $dsRobotTripTimeMs, missedPacketCount: $missedPacketCount)';
}


}

/// @nodoc
abstract mixin class _$DriverStationConnectionCopyWith<$Res> implements $DriverStationConnectionCopyWith<$Res> {
  factory _$DriverStationConnectionCopyWith(_DriverStationConnection value, $Res Function(_DriverStationConnection) _then) = __$DriverStationConnectionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'DsLinked') bool dsLinked,@JsonKey(name: 'RobotLinked') bool robotLinked,@JsonKey(name: 'RadioLinked') bool radioLinked,@JsonKey(name: 'BatteryVoltage') double batteryVoltage,@JsonKey(name: 'DsRobotTripTimeMs') int dsRobotTripTimeMs,@JsonKey(name: 'MissedPacketCount') int missedPacketCount
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
@override @pragma('vm:prefer-inline') $Res call({Object? dsLinked = null,Object? robotLinked = null,Object? radioLinked = null,Object? batteryVoltage = null,Object? dsRobotTripTimeMs = null,Object? missedPacketCount = null,}) {
  return _then(_DriverStationConnection(
dsLinked: null == dsLinked ? _self.dsLinked : dsLinked // ignore: cast_nullable_to_non_nullable
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

@JsonKey(name: 'Id') int get id;@JsonKey(name: 'Name') String get name;
/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamCopyWith<Team> get copyWith => _$TeamCopyWithImpl<Team>(this as Team, _$identity);

  /// Serializes this Team to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Team&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Team(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TeamCopyWith<$Res>  {
  factory $TeamCopyWith(Team value, $Res Function(Team) _then) = _$TeamCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name') String name
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name')  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Team() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name')  String name)  $default,) {final _that = this;
switch (_that) {
case _Team():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name')  String name)?  $default,) {final _that = this;
switch (_that) {
case _Team() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Team implements Team {
  const _Team({@JsonKey(name: 'Id') required this.id, @JsonKey(name: 'Name') required this.name});
  factory _Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

@override@JsonKey(name: 'Id') final  int id;
@override@JsonKey(name: 'Name') final  String name;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Team&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Team(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) _then) = __$TeamCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name') String name
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_Team(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
