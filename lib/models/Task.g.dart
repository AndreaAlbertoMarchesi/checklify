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
    deadline: json['deadline'] == null
        ? null
        : DateTime.parse(json['deadline'] as String),
    isStarred: json['isStarred'] as bool,
    progressType:
        _$enumDecodeNullable(_$ProgressTypeEnumMap, json['progressType']),
    counterMax: json['counterMax'] as int,
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
      'isStarred': instance.isStarred,
      'progressType': _$ProgressTypeEnumMap[instance.progressType],
      'counterMax': instance.counterMax,
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
