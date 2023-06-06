import 'dart:convert';

class Request {
  final int code;
  final String mess;
  final List<dynamic>? data;

  Request({
    required this.code,
    required this.mess,
    required this.data,
  });

  factory Request.fromRawJson(String str) => Request.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        code: json["code"],
        mess: json["mess"],
        data: json["data"] != null
            ? List<dynamic>.from(json["data"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "mess": mess,
        "data": data != null ? List<dynamic>.from(data!.map((x) => x)) : null,
      };
}
