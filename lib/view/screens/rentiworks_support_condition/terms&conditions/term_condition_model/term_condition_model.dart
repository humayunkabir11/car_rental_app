class TermConditionModel {
  TermConditionModel({
      String? message, 
      TermsCondition? termsCondition,}){
    _message = message;
    _termsCondition = termsCondition;
}

  TermConditionModel.fromJson(dynamic json) {
    _message = json['message'];
    _termsCondition = json['termsCondition'] != null ? TermsCondition.fromJson(json['termsCondition']) : null;
  }
  String? _message;
  TermsCondition? _termsCondition;

  String? get message => _message;
  TermsCondition? get termsCondition => _termsCondition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_termsCondition != null) {
      map['termsCondition'] = _termsCondition?.toJson();
    }
    return map;
  }

}

class TermsCondition {
  TermsCondition({
      String? id, 
      String? content, 
      String? createdAt, 
      String? updatedAt, 
      int? v,}){
    _id = id;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  TermsCondition.fromJson(dynamic json) {
    _id = json['_id'];
    _content = json['content'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  String? get id => _id;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['content'] = _content;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}