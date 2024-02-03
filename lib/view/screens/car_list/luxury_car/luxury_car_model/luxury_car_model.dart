// To parse this JSON data, do
//
//     final luxuryCarModel = luxuryCarModelFromJson(jsonString);

import 'dart:convert';

LuxuryCarModel luxuryCarModelFromJson(String str) => LuxuryCarModel.fromJson(json.decode(str));

String luxuryCarModelToJson(LuxuryCarModel data) => json.encode(data.toJson());

class LuxuryCarModel {
  String? message;
  List<LuxuryCar>? luxuryCars;
  Pagination? pagination;

  LuxuryCarModel({
    this.message,
    this.luxuryCars,
    this.pagination,
  });

  factory LuxuryCarModel.fromJson(Map<String, dynamic> json) => LuxuryCarModel(
    message: json["message"],
    luxuryCars: json["luxuryCars"] == null ? [] : List<LuxuryCar>.from(json["luxuryCars"]!.map((x) => LuxuryCar.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "luxuryCars": luxuryCars == null ? [] : List<dynamic>.from(luxuryCars!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class LuxuryCar {
  String? id;
  String? carModelName;
  List<String>? image;
  int? year;
  String? carLicenseNumber;
  String? carDescription;
  String? insuranceStartDate;
  String? insuranceEndDate;
  List<String>? kyc;
  String? carColor;
  String? carDoors;
  String? carSeats;
  String? totalRun;
  String? hourlyRate;
  String? offerHourlyRate;
  String? registrationDate;
  int? popularity;
  String? gearType;
  String? carType;
  String? specialCharacteristics;
  bool? activeReserve;
  String? tripStatus;
  CarOwner? carOwner;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? paymentId;
  List<String>? carImage;
  String? userId;

  LuxuryCar({
    this.id,
    this.carModelName,
    this.image,
    this.year,
    this.carLicenseNumber,
    this.carDescription,
    this.insuranceStartDate,
    this.insuranceEndDate,
    this.kyc,
    this.carColor,
    this.carDoors,
    this.carSeats,
    this.totalRun,
    this.hourlyRate,
    this.offerHourlyRate,
    this.registrationDate,
    this.popularity,
    this.gearType,
    this.carType,
    this.specialCharacteristics,
    this.activeReserve,
    this.tripStatus,
    this.carOwner,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.paymentId,
    this.carImage,
    this.userId,
  });

  factory LuxuryCar.fromJson(Map<String, dynamic> json) => LuxuryCar(
    id: json["_id"],
    carModelName: json["carModelName"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    year: json["year"],
    carLicenseNumber: json["carLicenseNumber"],
    carDescription: json["carDescription"],
    insuranceStartDate: json["insuranceStartDate"],
    insuranceEndDate: json["insuranceEndDate"],
    kyc: json["KYC"] == null ? [] : List<String>.from(json["KYC"]!.map((x) => x)),
    carColor: json["carColor"],
    carDoors: json["carDoors"],
    carSeats: json["carSeats"],
    totalRun: json["totalRun"],
    hourlyRate: json["hourlyRate"],
    offerHourlyRate: json["offerHourlyRate"],
    registrationDate: json["registrationDate"],
    popularity: json["popularity"],
    gearType: json["gearType"],
    carType: json["carType"],
    specialCharacteristics: json["specialCharacteristics"],
    activeReserve: json["activeReserve"],
    tripStatus: json["tripStatus"],
    carOwner: json["carOwner"] == null ? null : CarOwner.fromJson(json["carOwner"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    paymentId: json["paymentId"],
    carImage: json["carImage"] == null ? [] : List<String>.from(json["carImage"]!.map((x) => x)),
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "carModelName": carModelName,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "year": year,
    "carLicenseNumber": carLicenseNumber,
    "carDescription": carDescription,
    "insuranceStartDate": insuranceStartDate,
    "insuranceEndDate": insuranceEndDate,
    "KYC": kyc == null ? [] : List<dynamic>.from(kyc!.map((x) => x)),
    "carColor": carColor,
    "carDoors": carDoors,
    "carSeats": carSeats,
    "totalRun": totalRun,
    "hourlyRate": hourlyRate,
    "offerHourlyRate": offerHourlyRate,
    "registrationDate": registrationDate,
    "popularity": popularity,
    "gearType": gearType,
    "carType": carType,
    "specialCharacteristics": specialCharacteristics,
    "activeReserve": activeReserve,
    "tripStatus": tripStatus,
    "carOwner": carOwner?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "paymentId": paymentId,
    "carImage": carImage == null ? [] : List<dynamic>.from(carImage!.map((x) => x)),
    "userId": userId,
  };
}

class CarOwner {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  dynamic address;
  String? dateOfBirth;
  String? password;
  List<String>? kyc;
  String? rfc;
  String? ine;
  String? image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  String? oneTimeCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? creaditCardNumber;
  BankInfo? bankInfo;
  String? stripeConnectAccountId;

  CarOwner({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.address,
    this.dateOfBirth,
    this.password,
    this.kyc,
    this.rfc,
    this.ine,
    this.image,
    this.role,
    this.emailVerified,
    this.approved,
    this.isBanned,
    this.oneTimeCode,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.creaditCardNumber,
    this.bankInfo,
    this.stripeConnectAccountId,
  });

  factory CarOwner.fromJson(Map<String, dynamic> json) => CarOwner(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    address: json["address"],
    dateOfBirth: json["dateOfBirth"],
    password: json["password"],
    kyc: json["KYC"] == null ? [] : List<String>.from(json["KYC"]!.map((x) => x)),
    rfc: json["RFC"],
    ine: json["ine"],
    image: json["image"],
    role: json["role"],
    emailVerified: json["emailVerified"],
    approved: json["approved"],
    isBanned: json["isBanned"],
    oneTimeCode: json["oneTimeCode"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    creaditCardNumber: json["creaditCardNumber"],
    bankInfo: json["bankInfo"] == null ? null : BankInfo.fromJson(json["bankInfo"]),
    stripeConnectAccountId: json["stripeConnectAccountId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "email": email,
    "phoneNumber": phoneNumber,
    "gender": gender,
    "address": address,
    "dateOfBirth": dateOfBirth,
    "password": password,
    "KYC": kyc == null ? [] : List<dynamic>.from(kyc!.map((x) => x)),
    "RFC": rfc,
    "ine": ine,
    "image": image,
    "role": role,
    "emailVerified": emailVerified,
    "approved": approved,
    "isBanned": isBanned,
    "oneTimeCode": oneTimeCode,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "creaditCardNumber": creaditCardNumber,
    "bankInfo": bankInfo?.toJson(),
    "stripeConnectAccountId": stripeConnectAccountId,
  };
}

class AddressClass {
  String? city;
  String? line1;
  String? postalCode;
  String? state;
  String? country;

  AddressClass({
    this.city,
    this.line1,
    this.postalCode,
    this.state,
    this.country,
  });

  factory AddressClass.fromJson(Map<String, dynamic> json) => AddressClass(
    city: json["city"],
    line1: json["line1"],
    postalCode: json["postal_code"],
    state: json["state"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "line1": line1,
    "postal_code": postalCode,
    "state": state,
    "country": country,
  };
}

class BankInfo {
  String? accountNumber;
  String? accountHolderName;
  String? accountHolderType;

  BankInfo({
    this.accountNumber,
    this.accountHolderName,
    this.accountHolderType,
  });

  factory BankInfo.fromJson(Map<String, dynamic> json) => BankInfo(
    accountNumber: json["account_number"],
    accountHolderName: json["account_holder_name"],
    accountHolderType: json["account_holder_type"],
  );

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "account_holder_name": accountHolderName,
    "account_holder_type": accountHolderType,
  };
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

  Map<String, dynamic> toJson() => {
    "totalDocuments": totalDocuments,
    "totalPage": totalPage,
    "currentPage": currentPage,
    "previousPage": previousPage,
    "nextPage": nextPage,
  };
}
