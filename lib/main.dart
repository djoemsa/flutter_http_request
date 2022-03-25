import 'package:flutter/material.dart';
import 'package:flutter_http_request/screens/get_request_page.dart';
import 'package:flutter_http_request/screens/home_page.dart';
import 'package:flutter_http_request/screens/list_data_page.dart';
import 'package:flutter_http_request/screens/post_request_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/post': (context) => PostPage1(),
        '/get': (context) => GetPage(),
        '/list': (context) => ListDataPage()
      },
    );
  }
}
