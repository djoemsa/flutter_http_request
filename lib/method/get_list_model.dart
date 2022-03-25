import 'dart:convert';

import 'package:http/http.dart' as http;

class DataList1 {
  final String? name;

  DataList1({this.name});

  factory DataList1.createDataList(Map<String, dynamic> object) {
    return DataList1(
      name: object['first_name'] + " " + object['last_name'],
    );
  }

  static Future<List<DataList1>> connectToAPI(String id) async {
    var urlAPI = "https://reqres.in/api/users?page=$id";

    var resultAPI = await http.get(Uri.parse(urlAPI));
    var jsonObject = json.decode(resultAPI.body);

    List<dynamic> listuser = (jsonObject as Map<String, dynamic>)['data'];
    List<DataList1> dataList = [];
    for (int i = 0; i < listuser.length; i++)
      dataList.add(DataList1.createDataList(listuser[i]));
    return dataList;
  }
}
