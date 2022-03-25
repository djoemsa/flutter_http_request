import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  final String? name;
  final String? job;
  final String? id;
  final String? created; // contoh var yg namanya tidak sesuai dengan API

  PostResult({this.name, this.job, this.id, this.created});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        name: object['name'],
        job: object['job'],
        id: object['id'],
        created: object['createdAt']); // yang penting bener KEY -nya
  }

  //<PostResult> adalah agar hanya bisa return type tersebut.
  static Future<PostResult> connectToAPI(String name, String job) async {
    var urlAPI = 'https://reqres.in/api/users';

    var resultAPI =
        await http.post(Uri.parse(urlAPI), body: {"name": name, "job": job});
    var jsonObject = json.decode(resultAPI.body);

    return PostResult.createPostResult(jsonObject);
  }
}
