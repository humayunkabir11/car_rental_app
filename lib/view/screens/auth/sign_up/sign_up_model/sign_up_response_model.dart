class SignUpResponseModel {
  SignUpResponseModel({
      String? message,}){
    _message = message;
}

  SignUpResponseModel.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}