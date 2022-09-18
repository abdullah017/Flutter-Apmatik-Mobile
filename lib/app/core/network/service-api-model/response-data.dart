// ignore_for_file: file_names, unnecessary_this, non_constant_identifier_names

class ResponseData {
  bool? status;
  String? first_name;
  String? token;

  ResponseData({this.status, this.first_name,this.token});

  ResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    first_name = json['first_name'];
    token = json.containsKey("token") ? json['token'] :"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['first_name'] = this.first_name;
    data['token'] = this.token;

    return data;
  }
}
