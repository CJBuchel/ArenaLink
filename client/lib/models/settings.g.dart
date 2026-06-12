// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  arenaType:
      $enumDecodeNullable(_$ArenaTypeEnumMap, json['arenaType']) ??
      ArenaType.cheesy,
  arenaHost: json['arenaHost'] as String? ?? 'localhost',
  arenaPort: (json['arenaPort'] as num?)?.toInt() ?? 8080,
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'arenaType': _$ArenaTypeEnumMap[instance.arenaType]!,
      'arenaHost': instance.arenaHost,
      'arenaPort': instance.arenaPort,
    };

const _$ArenaTypeEnumMap = {ArenaType.cheesy: 'cheesy'};
