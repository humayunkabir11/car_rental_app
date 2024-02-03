// To parse this JSON data, do
//
//     final sentRentRequestModel = sentRentRequestModelFromJson(jsonString);

import 'dart:convert';

SentRentRequestModel sentRentRequestModelFromJson(String str) => SentRentRequestModel.fromJson(json.decode(str));

String sentRentRequestModelToJson(SentRentRequestModel data) => json.encode(data.toJson());

class SentRentRequestModel {
  String? message;
  Rents? rents;

  SentRentRequestModel({
    this.message,
    this.rents,
  });

  factory SentRentRequestModel.fromJson(Map<String, dynamic> json) => SentRentRequestModel(
    message: json["message"],
    rents: json["rents"] == null ? null : Rents.fromJson(json["rents"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "rents": rents?.toJson(),
  };
}

class Rents {
  String? rentTripNumber;
  String? totalAmount;
  String? totalHours;
  String? requestStatus;
  DateTime? startDate;
  DateTime? endDate;
  String? payment;
  UserId? userId;
  CarId? carId;
  HostId? hostId;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Rents({
    this.rentTripNumber,
    this.totalAmount,
    this.totalHours,
    this.requestStatus,
    this.startDate,
    this.endDate,
    this.payment,
    this.userId,
    this.carId,
    this.hostId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Rents.fromJson(Map<String, dynamic> json) => Rents(
    rentTripNumber: json["rentTripNumber"],
    totalAmount: json["totalAmount"],
    totalHours: json["totalHours"],
    requestStatus: json["requestStatus"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    payment: json["payment"],
    userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
    carId: json["carId"] == null ? null : CarId.fromJson(json["carId"]),
    hostId: json["hostId"] == null ? null : HostId.fromJson(json["hostId"]),
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "rentTripNumber": rentTripNumber,
    "totalAmount": totalAmount,
    "totalHours": totalHours,
    "requestStatus": requestStatus,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "payment": payment,
    "userId": userId?.toJson(),
    "carId": carId?.toJson(),
    "hostId": hostId?.toJson(),
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class CarId {
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
  String? registrationDate;
  int? popularity;
  String? gearType;
  String? carType;
  String? specialCharacteristics;
  bool? activeReserve;
  String? tripStatus;
  String? carOwner;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CarId({
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
  });

  factory CarId.fromJson(Map<String, dynamic> json) => CarId(
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
    registrationDate: json["registrationDate"],
    popularity: json["popularity"],
    gearType: json["gearType"],
    carType: json["carType"],
    specialCharacteristics: json["specialCharacteristics"],
    activeReserve: json["activeReserve"],
    tripStatus: json["tripStatus"],
    carOwner: json["carOwner"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
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
    "registrationDate": registrationDate,
    "popularity": popularity,
    "gearType": gearType,
    "carType": carType,
    "specialCharacteristics": specialCharacteristics,
    "activeReserve": activeReserve,
    "tripStatus": tripStatus,
    "carOwner": carOwner,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class HostId {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  Address? address;
  String? dateOfBirth;
  String? password;
  List<String>? kyc;
  String? rfc;
  String? ine;
  String? image;
  BankInfo? bankInfo;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  dynamic oneTimeCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? stripeConnectAccountId;

  HostId({
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
    this.bankInfo,
    this.role,
    this.emailVerified,
    this.approved,
    this.isBanned,
    this.oneTimeCode,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.stripeConnectAccountId,
  });

  factory HostId.fromJson(Map<String, dynamic> json) => HostId(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    dateOfBirth: json["dateOfBirth"],
    password: json["password"],
    kyc: json["KYC"] == null ? [] : List<String>.from(json["KYC"]!.map((x) => x)),
    rfc: json["RFC"],
    ine: json["ine"],
    image: json["image"],
    bankInfo: json["bankInfo"] == null ? null : BankInfo.fromJson(json["bankInfo"]),
    role: json["role"],
    emailVerified: json["emailVerified"],
    approved: json["approved"],
    isBanned: json["isBanned"],
    oneTimeCode: json["oneTimeCode"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    stripeConnectAccountId: json["stripeConnectAccountId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "email": email,
    "phoneNumber": phoneNumber,
    "gender": gender,
    "address": address?.toJson(),
    "dateOfBirth": dateOfBirth,
    "password": password,
    "KYC": kyc == null ? [] : List<dynamic>.from(kyc!.map((x) => x)),
    "RFC": rfc,
    "ine": ine,
    "image": image,
    "bankInfo": bankInfo?.toJson(),
    "role": role,
    "emailVerified": emailVerified,
    "approved": approved,
    "isBanned": isBanned,
    "oneTimeCode": oneTimeCode,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "stripeConnectAccountId": stripeConnectAccountId,
  };
}

class Address {
  String? city;
  String? country;
  String? line1;
  String? state;

  Address({
    this.city,
    this.country,
    this.line1,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    country: json["country"],
    line1: json["line1"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
    "line1": line1,
    "state": state,
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

class UserId {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? password;
  List<String>? kyc;
  String? ine;
  String? image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  dynamic oneTimeCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  UserId({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.address,
    this.dateOfBirth,
    this.password,
    this.kyc,
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
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    address: json["address"],
    dateOfBirth: json["dateOfBirth"],
    password: json["password"],
    kyc: json["KYC"] == null ? [] : List<String>.from(json["KYC"]!.map((x) => x)),
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
  };
}
