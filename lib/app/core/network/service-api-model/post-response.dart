// ignore_for_file: file_names

class PostResponse {
  bool? success;
  String? message;

  PostResponse({this.success, this.message});

  PostResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
