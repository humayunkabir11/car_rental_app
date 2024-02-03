class AboutUsModel {
  AboutUsModel({
      String? message, 
      About? about,}){
    _message = message;
    _about = about;
}

  AboutUsModel.fromJson(dynamic json) {
    _message = json['message'];
    _about = json['about'] != null ? About.fromJson(json['about']) : null;
  }
  String? _message;
  About? _about;

  String? get message => _message;
  About? get about => _about;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_about != null) {
      map['about'] = _about?.toJson();
    }
    return map;
  }

}

class About {
  About({
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

  About.fromJson(dynamic json) {
    _id = json['_id'].toString();
    _content = json['content'].toString();
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