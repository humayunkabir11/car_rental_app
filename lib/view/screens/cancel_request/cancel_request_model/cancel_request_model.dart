import 'dart:convert';

CancelRequestModel cancelRequestModelFromJson(String str) => CancelRequestModel.fromJson(json.decode(str));

String cancelRequestModelToJson(CancelRequestModel data) => json.encode(data.toJson());

class CancelRequestModel {
  String? message;
  Rents? rents;

  CancelRequestModel({
    this.message,
    this.rents,
  });

  factory CancelRequestModel.fromJson(Map<String, dynamic> json) => CancelRequestModel(
    message: json["message"],
    rents: json["rents"] == null ? null : Rents.fromJson(json["rents"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "rents": rents?.toJson(),
  };
}

class Rents {
  String? id;
  String? rentTripNumber;
  String? totalAmount;
  String? totalHours;
  String? requestStatus;
  String? sentRequest;
  String? startDate;
  String? endDate;
  String? payment;
  String? userId;
  CarId? carId;
  HostId? hostId;
  String? createdAt;
  String? updatedAt;
  int? v;

  Rents({
    this.id,
    this.rentTripNumber,
    this.totalAmount,
    this.totalHours,
    this.requestStatus,
    this.sentRequest,
    this.startDate,
    this.endDate,
    this.payment,
    this.userId,
    this.carId,
    this.hostId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Rents.fromJson(Map<String, dynamic> json) => Rents(
    id: json["_id"],
    rentTripNumber: json["rentTripNumber"],
    totalAmount: json["totalAmount"],
    totalHours: json["totalHours"],
    requestStatus: json["requestStatus"],
    sentRequest: json["sentRequest"],
    startDate: json["startDate"].toString(),
    endDate: json["endDate"].toString(),
    payment: json["payment"],
    userId: json["userId"],
    carId: json["carId"] == null ? null : CarId.fromJson(json["carId"]),
    hostId: json["hostId"] == null ? null : HostId.fromJson(json["hostId"]),
    createdAt: json["createdAt"].toString(),
    updatedAt: json["updatedAt"].toString(),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "rentTripNumber": rentTripNumber,
    "totalAmount": totalAmount,
    "totalHours": totalHours,
    "requestStatus": requestStatus,
    "sentRequest": sentRequest,
    "startDate": startDate,
    "endDate": endDate,
    "payment": payment,
    "userId": userId,
    "carId": carId?.toJson(),
    "hostId": hostId?.toJson(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
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
  String? createdAt;
  String? updatedAt;
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
    createdAt: json["createdAt"].toString(),
    updatedAt: json["updatedAt"].toString(),
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
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class HostId {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
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
  dynamic oneTimeCode;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? creaditCardNumber;

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
    this.role,
    this.emailVerified,
    this.approved,
    this.isBanned,
    this.oneTimeCode,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.creaditCardNumber,
  });

  factory HostId.fromJson(Map<String, dynamic> json) => HostId(
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
    createdAt: json["createdAt"].toString(),
    updatedAt: json["updatedAt"].toString(),
    v: json["__v"],
    creaditCardNumber: json["creaditCardNumber"],
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
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "creaditCardNumber": creaditCardNumber,
  };
}
