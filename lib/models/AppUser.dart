import 'package:checklist_app/utils/URL.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AppUser.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {

  static AppUser anonymous = AppUser(userName: "Anonymous", photoURL: URL.dog, isAnon: true);

  String userName;
  String photoURL;
  bool isAnon;

  AppUser({this.userName, this.photoURL, this.isAnon});


  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}



