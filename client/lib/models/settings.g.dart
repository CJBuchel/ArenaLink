// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  serverHost: json['serverHost'] as String? ?? 'localhost',
  serverPort: (json['serverPort'] as num?)?.toInt() ?? 8080,
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'serverHost': instance.serverHost,
      'serverPort': instance.serverPort,
    };
