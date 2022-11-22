import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStatefull {
  String? id;
  String? fullname;
  String? email;
  String? avatar;

  HttpStatefull({this.avatar, this.email, this.fullname, this.id});
  // String? count;
  // String? offset;
  // String? limit;
  // String? currentPage;
  // String? pagecount;
  // List<Data>? data;

  // HttpStatefull(
  //     {this.count,
  //     this.offset,
  //     this.limit,
  //     this.data,
  //     this.currentPage,
  //     this.pagecount});

  static Future<HttpStatefull> connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);
    var response = await http.get(url);

    var data = (json.decode(response.body))['data'];

    return HttpStatefull(
        id: data['id'].toString(),
        email: data['email'],
        avatar: data['avatar'],
        fullname: data['first_name']);
  }
}

class Data {
  int? id;
  int? tenantId;
  int? createdBy;
  int? updatedBy;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.tenantId,
      this.createdBy,
      this.updatedBy,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt});

  // Data.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   tenantId = json['tenant_id'];
  //   createdBy = json['created_by'];
  //   updatedBy = json['updated_by'];
  //   name = json['name'];
  //   description = json['description'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['tenant_id'] = this.tenantId;
  //   data['created_by'] = this.createdBy;
  //   data['updated_by'] = this.updatedBy;
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}
