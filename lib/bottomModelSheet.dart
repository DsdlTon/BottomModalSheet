import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomModelSheet extends StatefulWidget {
  @override
  _BottomModelSheetState createState() => _BottomModelSheetState();
}

class _BottomModelSheetState extends State<BottomModelSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(),
      body: Center(
        child: Text('homepage'),
      ),
    );
  }
}

class MyFloatingActionButton extends StatefulWidget {
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  bool showFab = true;
  @override
  Widget build(BuildContext context) {
    return showFab
        ? FloatingActionButton(
            onPressed: () {
              var bottomSheetController = showBottomSheet(
                context: context,
                builder: (context) => Container(
                  color: Colors.grey[900],
                  height: 250,
                ),
              );
              showFoatingActionButton(false);
              bottomSheetController.closed.then(
                (value) {
                  showFoatingActionButton(true);
                },
              );
            },
          )
        : Container();
  }

  void showFoatingActionButton(bool value) {
    setState(() {
      showFab = value;
    });
  }
}

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      height: 160,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedContainer(),
          SheetButton(),
        ],
      ),
    );
  }
}

class DecoratedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text('Received Coupon'));
  }
}

class SheetButton extends StatefulWidget {
  _SheetButtonState createState() => _SheetButtonState();
}

class _SheetButtonState extends State<SheetButton> {
  bool checkingFlight = false;
  bool success = false;
  @override
  Widget build(BuildContext context) {
    return !checkingFlight
        ? MaterialButton(
            color: Colors.grey[800],
            onPressed: () {
              MaterialButton(
                onPressed: () async {
                  setState(
                    () {
                      checkingFlight = true;
                    },
                  );
                  await Future.delayed(Duration(seconds: 1));
                  setState(
                    () {
                      success = true;
                    },
                  );
                  await Future.delayed(Duration(milliseconds: 500));
                  Navigator.pop(context);
                },
              );
            },
            child: Text(
              'Check Flight',
              style: TextStyle(color: Colors.white),
            ),
          )
        : !success
            ? CircularProgressIndicator()
            : Icon(
                Icons.check,
                color: Colors.green,
              );
  }
}
