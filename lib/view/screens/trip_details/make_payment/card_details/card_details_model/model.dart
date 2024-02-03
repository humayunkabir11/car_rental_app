// To parse this JSON data, do
//
//     final cardDetailsModel = cardDetailsModelFromJson(jsonString);

import 'dart:convert';

CardDetailsModel cardDetailsModelFromJson(String str) => CardDetailsModel.fromJson(json.decode(str));

String cardDetailsModelToJson(CardDetailsModel data) => json.encode(data.toJson());

class CardDetailsModel {
  String? message;
  CardInfo? cardInfo;

  CardDetailsModel({
    this.message,
    this.cardInfo,
  });

  factory CardDetailsModel.fromJson(Map<String, dynamic> json) => CardDetailsModel(
    message: json["message"],
    cardInfo: json["cardInfo"] == null ? null : CardInfo.fromJson(json["cardInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "cardInfo": cardInfo?.toJson(),
  };
}

class CardInfo {
  String? id;
  String? creaditCardNumber;
  String? expireDate;
  String? cvv;
  String? role;

  CardInfo({
    this.id,
    this.creaditCardNumber,
    this.expireDate,
    this.cvv,
    this.role,
  });

  factory CardInfo.fromJson(Map<String, dynamic> json) => CardInfo(
    id: json["_id"],
    creaditCardNumber: json["creaditCardNumber"],
    expireDate: json["expireDate"],
    cvv: json["cvv"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "creaditCardNumber": creaditCardNumber,
    "expireDate": expireDate,
    "cvv": cvv,
    "role": role,
  };
}
