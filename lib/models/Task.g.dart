// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    json['title'] as String,
    notes: json['notes'] as String,
    colorValue: json['colorValue'] as int,
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
  )
    ..children = (json['children'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..percentage = json['percentage'] as num;
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'title': instance.title,
      'notes': instance.notes,
      'percentage': instance.percentage,
      'colorValue': instance.colorValue,
      'dateTime': instance.dateTime?.toIso8601String(),
    };
