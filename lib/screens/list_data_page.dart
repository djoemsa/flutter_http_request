import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../method/get_list_model.dart';

class ListDataPage extends StatefulWidget {
  @override
  State<ListDataPage> createState() => _ListDataPageState();
}

class _ListDataPageState extends State<ListDataPage> {
  TextEditingController numberTextContorller1 = TextEditingController();
  List<dynamic> getResult = [];
  void refreshState() {
    getResult.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get List Data Request'),
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
                            (getResult.length == 0)
                                ? 'TIDAK ADA DATA'
                                : getResult[0].name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        Text(
                            (getResult.length == 0)
                                ? 'TIDAK ADA DATA'
                                : getResult[1].name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        Text(
                            (getResult.length == 0)
                                ? 'TIDAK ADA DATA'
                                : getResult[2].name,
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
                controller: numberTextContorller1,
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
                  (numberTextContorller1.text.isEmpty)
                      ? refreshState()
                      : DataList1.connectToAPI(
                          numberTextContorller1.text.toString(),
                        ).then((value) {
                          getResult = value;
                          print(getResult);
                          setState(() {});
                        });
                },
                child: Text('GET REQUEST')),
            Spacer(flex: 9),
          ],
        ),
      ),
    );
  }
}
