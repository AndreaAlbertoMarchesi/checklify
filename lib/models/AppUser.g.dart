// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return AppUser(
    userName: json['userName'] as String,
    photoURL: json['photoURL'] as String,
    isAnon: json['isAnon'] as bool,
  );
}

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'userName': instance.userName,
      'photoURL': instance.photoURL,
      'isAnon': instance.isAnon,
    };
