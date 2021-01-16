// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskNotification _$TaskNotificationFromJson(Map<String, dynamic> json) {
  return TaskNotification(
    json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    json['id'] as int,
  );
}

Map<String, dynamic> _$TaskNotificationToJson(TaskNotification instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'id': instance.id,
    };

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    json['title'] as String,
    notes: json['notes'] as String,
    colorValue: json['colorValue'] as int,
    deadline: json['deadline'] == null
        ? null
        : DateTime.parse(json['deadline'] as String),
    notification: json['notification'] == null
        ? null
        : TaskNotification.fromJson(
            json['notification'] as Map<String, dynamic>),
    isStarred: json['isStarred'] as bool,
    progressType:
        _$enumDecodeNullable(_$ProgressTypeEnumMap, json['progressType']),
    percentageDivisions: json['percentageDivisions'] as int,
    doesShowDailyPercentage: json['doesShowDailyPercentage'] as bool,
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
      'deadline': instance.deadline?.toIso8601String(),
      'notification': instance.notification?.toJson(),
      'isStarred': instance.isStarred,
      'doesShowDailyPercentage': instance.doesShowDailyPercentage,
      'progressType': _$ProgressTypeEnumMap[instance.progressType],
      'percentageDivisions': instance.percentageDivisions,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ProgressTypeEnumMap = {
  ProgressType.checkbox: 'checkbox',
  ProgressType.counter: 'counter',
  ProgressType.slider: 'slider',
};
