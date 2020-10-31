import 'package:json_annotation/json_annotation.dart';

part 'AppUser.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {

  String userName;
  String photoURL;
  bool isAnon;

  AppUser({this.userName, this.photoURL, this.isAnon});


  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}



