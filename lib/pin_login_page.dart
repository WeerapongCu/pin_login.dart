import 'package:flutter/material.dart';

class PIN_LOGIN extends StatefulWidget {
  const PIN_LOGIN({Key? key}) : super(key: key);

  @override
  _PIN_LOGINState createState() => _PIN_LOGINState();
}

class _PIN_LOGINState extends State<PIN_LOGIN> {
  List<int> enteredPIN = [];

  Widget button_num(int num, String Nn) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      width: 60,
      height: 60,
      margin: EdgeInsets.all(8),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPIN.length < 6) {
              enteredPIN.add(num);
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$num",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
            Text(
              Nn,
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        style: TextButton.styleFrom(
          shape: ContinuousRectangleBorder(),
          foregroundColor: Colors.black,
        ),
      ),
    );
  }

  Widget deleteButton() {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.all(8),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPIN.isNotEmpty) {
              enteredPIN.removeLast();
            }
          });
        },
        child: Icon(
          Icons.backspace,
          size: 20,
          color: Colors.black,
        ),
        style: TextButton.styleFrom(
          shape: ContinuousRectangleBorder(),
          foregroundColor: Colors.black,
        ),
      ),
    );
  }

  Widget clearButton() {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.all(8),
      child: TextButton(
        onPressed: () {
          setState(() {
            enteredPIN.clear();
          });
        },
        child: Text(
          "X",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        style: TextButton.styleFrom(
          shape: BeveledRectangleBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String pinDisplay = enteredPIN.join(" ");
    List<String> pin = ["_","_","_","_","_","_"];
    return Scaffold(
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.security,
                    size: 60,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("PIN LOGIN")
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Row(
                    children: [Text(pin[0]),Text(pin[1]),Text(pin[2]),Text(pin[3]),Text(pin[4]),Text(pin[5])],
                  )
                  ],
                ),
              Column(
                children: [
                  Row(
                    children: [
                      button_num(1, "one"),
                      button_num(2, "two"),
                      button_num(3, "three"),
                    ],
                  ),
                  Row(
                    children: [
                      button_num(4, "four"),
                      button_num(5, "five"),
                      button_num(6, "six"),
                    ],
                  ),
                  Row(
                    children: [
                      button_num(7, "seven"),
                      button_num(8, "eight"),
                      button_num(9, "nine"),
                    ],
                  ),
                  Row(
                    children: [
                      clearButton(),
                      button_num(0, "zero"),
                      deleteButton(),
                    ],
                  )
                ],
              )
            ],
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
