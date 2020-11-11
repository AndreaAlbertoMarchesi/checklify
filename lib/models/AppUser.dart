import 'package:json_annotation/json_annotation.dart';

part 'AppUser.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {

  String userName;
  String photoURL;
  bool isAnon;
  String fontSize;
  bool vibrate;

  AppUser({this.userName, this.photoURL, this.isAnon, this.fontSize, this.vibrate});


  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}



