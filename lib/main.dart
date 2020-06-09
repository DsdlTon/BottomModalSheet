// import 'dart:js';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final promoCode = TextEditingController();
  String promoValue;
  //Array for store promoValue
  List<String> promoArray = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Show'),
              onPressed: () => _onButtonPressed(),
            ),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 500.0,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Colors.grey[300],
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15.0, top: 10.0),
                width: 150.0,
                child: Text(
                  'โค้ดส่วนลด',
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 28.0,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        // ),
        Row(
          children: <Widget>[
            Container(
              width: 270.0,
              height: 50.0,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                controller: promoCode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  hintText: 'Promotion code',
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                color: Colors.lightBlue,
                width: 90.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  color: Colors.indigo,
                  onPressed: () {
                    // print(promoCode.text);
                    promoArray.add(promoCode.text);
                    // print(promoArray);
                    promoValue = _printPromoCodeValue();
                    promoCode.clear();
                  },
                  
                  textColor: Colors.white,
                  child: Container(
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // LISTVIEW ZONE
        Container(
          width: 270.0,
          height: 180.0,
          child: ListView.builder(
            itemCount: promoArray.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(promoArray[i])
              );
            },
          ),
        ),
      ],
    );
  }

  String _printPromoCodeValue() {
    print("Promotion Code: ${promoCode.text}");
    print("PromoArray: $promoArray");
  }
}
