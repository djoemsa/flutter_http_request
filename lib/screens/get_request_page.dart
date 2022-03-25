import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../method/get_data_model.dart';

class GetPage extends StatefulWidget {
  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  TextEditingController numberTextContorller = TextEditingController();
  dynamic getResult = null;
  void refreshState() {
    getResult = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get HTTP Request'),
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
                        Text((getResult == null) ? 'belum get' : getResult.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        Text((getResult == null) ? 'belum get' : getResult.id,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        Text(
                            (getResult == null) ? 'belum get' : getResult.email,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                )),
            Spacer(flex: 5),
            Container(
              width: MediaQuery.of(context).size.width * 0.15,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: numberTextContorller,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            Spacer(flex: 9),
            ElevatedButton(
                onPressed: () {
                  (numberTextContorller.text.isEmpty)
                      ? refreshState()
                      : GetDataResult.connectToAPI(
                          numberTextContorller.text.toString(),
                        ).then((value) {
                          getResult = value;
                          setState(() {});
                        });
                  // setState(() {});
                },
                child: Text('GET REQUEST')),
            Spacer(flex: 9),
          ],
        ),
      ),
    );
  }
}
