import 'dart:convert';

HowRentiWorksModel howRentiWorksModelFromJson(String str) => HowRentiWorksModel.fromJson(json.decode(str));

String howRentiWorksModelToJson(HowRentiWorksModel data) => json.encode(data.toJson());

class HowRentiWorksModel {
  String? message;
  HowRentiWork? howRentiWork;

  HowRentiWorksModel({
    this.message,
    this.howRentiWork,
  });

  factory HowRentiWorksModel.fromJson(Map<String, dynamic> json) => HowRentiWorksModel(
    message: json["message"],
    howRentiWork: json["howRentiWork"] == null ? null : HowRentiWork.fromJson(json["howRentiWork"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "howRentiWork": howRentiWork?.toJson(),
  };
}

class HowRentiWork {
  String? id;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  HowRentiWork({
    this.id,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory HowRentiWork.fromJson(Map<String, dynamic> json) => HowRentiWork(
    id: json["_id"],
    content: json["content"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}