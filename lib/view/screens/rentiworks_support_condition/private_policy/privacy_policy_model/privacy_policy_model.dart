class PrivacyPolicyModel {
  String? message;
  PrivacyPolicy? privacyPolicy;

  PrivacyPolicyModel({this.message, this.privacyPolicy});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    privacyPolicy = json['privacyPolicy'] != null
        ? new PrivacyPolicy.fromJson(json['privacyPolicy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.privacyPolicy != null) {
      data['privacyPolicy'] = this.privacyPolicy!.toJson();
    }
    return data;
  }
}

class PrivacyPolicy {
  String? sId;
  String? content;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PrivacyPolicy(
      {this.sId, this.content, this.createdAt, this.updatedAt, this.iV});

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
