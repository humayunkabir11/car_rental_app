// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));


class NotificationModel {
  String? status;
  String? statusCode;
  String? type;
  String? message;
  Data? data;

  NotificationModel({
    this.status,
    this.statusCode,
    this.type,
    this.message,
    this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"],
    statusCode: json["statusCode"],
    type: json["type"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );


}

class Data {
  List<AllNotification>? allNotification;
  int? notViewed;
  Pagination? pagination;

  Data({
    this.allNotification,
    this.notViewed,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    allNotification: json["allNotification"] == null ? [] : List<AllNotification>.from(json["allNotification"]!.map((x) => AllNotification.fromJson(x))),
    notViewed: json["notViewed"],
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );


}

class AllNotification {
  String? id;
  String? receiverId;
  String? message;
  String? image;
  String? linkId;
  String? type;
  bool? viewStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  AllNotification({
    this.id,
    this.receiverId,
    this.message,
    this.image,
    this.linkId,
    this.type,
    this.viewStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AllNotification.fromJson(Map<String, dynamic> json) => AllNotification(
    id: json["_id"],
    receiverId: json["receiverId"],
    message: json["message"],
    image: json["image"]?? "",
    linkId: json["linkId"],
    type: json["type"],
    viewStatus: json["viewStatus"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

}

class Pagination {
  int? totalDocuments;
  int? totalPage;
  int? currentPage;
  dynamic previousPage;
  dynamic nextPage;

  Pagination({
    this.totalDocuments,
    this.totalPage,
    this.currentPage,
    this.previousPage,
    this.nextPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalDocuments: json["totalDocuments"],
    totalPage: json["totalPage"],
    currentPage: json["currentPage"],
    previousPage: json["previousPage"],
    nextPage: json["nextPage"],
  );


}