import 'package:flutter/material.dart';

import '../method/post_result_model.dart';

class PostPage1 extends StatefulWidget {
  @override
  State<PostPage1> createState() => _PostPage1State();
}

class _PostPage1State extends State<PostPage1> {
  TextEditingController jobTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  dynamic postResult = null;
  String defStr = 'TOLONG ISI DATA';
  void refreshState() {
    postResult = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post HTTP Request'),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(flex: 6),
            Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                child: Card(
                  elevation: 7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (postResult == null) ? 'belum post' : postResult.id,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                            (postResult == null)
                                ? 'belum post'
                                : postResult.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        Text(
                            (postResult == null)
                                ? 'belum post'
                                : postResult.job,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        Text(
                            (postResult == null)
                                ? 'belum post'
                                : postResult.created.substring(0, 10),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                )),
            Spacer(flex: 14),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: nameTextController,
                decoration: InputDecoration(
                  labelText: 'NAME',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            Spacer(flex: 1),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: jobTextController,
                decoration: InputDecoration(
                  labelText: 'JOB',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            Spacer(flex: 2),
            ElevatedButton(
                onPressed: () {
                  (nameTextController.text.isEmpty &&
                          jobTextController.text.isEmpty)
                      ? refreshState()
                      : PostResult.connectToAPI(
                              nameTextController.text.toString(),
                              jobTextController.text.toString())
                          .then((value) {
                          postResult = value;
                          setState(() {});
                        });
                },
                child: Text('POST REQUEST')),
            Spacer(flex: 6),
          ],
        ),
      ),
    );
  }
}
