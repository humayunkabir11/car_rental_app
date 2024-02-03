import 'dart:io';

class UserPostModel{
  final String fullName;
  final String phoneNumber;
  final String email;
  final String gender;
  final String dob;
  final File? image;
  final String address;


  UserPostModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.dob,
    required this.image,
    required this.address
  });





  factory UserPostModel.fromMap(Map<String, dynamic> map) {
    return UserPostModel(
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      image: map['image'] as File,
      address: map['address'] as String,
      gender: map['gender'] as String,
      dob: map['dateOfBirth'] as String,
    );
  }
}