// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
  final String userId;
  final String userName;
  final String userMail;
  final String userPsw;
  final DateTime userCreateDate;
  final DateTime userLastLoginDate;
  final String userStatus;
  final String userEmailApproval;
  final String userKvkkApproval;

  User({
    required this.userId,
    required this.userName,
    required this.userMail,
    required this.userPsw,
    required this.userCreateDate,
    required this.userLastLoginDate,
    required this.userStatus,
    required this.userEmailApproval,
    required this.userKvkkApproval,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        userName: json["user_name"],
        userMail: json["user_mail"],
        userPsw: json["user_psw"],
        userCreateDate: DateTime.parse(json["user_createDate"]),
        userLastLoginDate: DateTime.parse(json["user_lastLoginDate"]),
        userStatus: json["user_status"],
        userEmailApproval: json["user_email_approval"],
        userKvkkApproval: json["user_kvkk_approval"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_mail": userMail,
        "user_psw": userPsw,
        "user_createDate": userCreateDate.toIso8601String(),
        "user_lastLoginDate": userLastLoginDate.toIso8601String(),
        "user_status": userStatus,
        "user_email_approval": userEmailApproval,
        "user_kvkk_approval": userKvkkApproval,
      };
}
