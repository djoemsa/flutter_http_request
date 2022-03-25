import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Request'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/post');
                },
                child: Text('Post Request Page')),
            Spacer(flex: 1),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/get');
                },
                child: Text('Get Request Page')),
            Spacer(flex: 1),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                },
                child: Text('List Data Page')),
            Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
