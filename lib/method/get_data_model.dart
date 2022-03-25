import 'dart:convert';

import 'package:http/http.dart' as http;

class GetDataResult {
  final String? id;
  final String? name;
  final String? email;

  GetDataResult({this.id, this.name, this.email});

  factory GetDataResult.createGetDataResult(Map<String, dynamic> object) {
    return GetDataResult(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name'],
        email: object['email']);
  }

  static Future<GetDataResult> connectToAPI(String id) async {
    var urlAPI = "https://reqres.in/api/users/$id";
    //get menggunakan get, bukan post
    var resultAPI = await http.get(Uri.parse(urlAPI));
    var jsonObject = json.decode(resultAPI.body);

    //mengubah data json ke tipe Map
    Map<String, dynamic> userData = (jsonObject as Map)['data'];

    return GetDataResult.createGetDataResult(userData);
  }
}
