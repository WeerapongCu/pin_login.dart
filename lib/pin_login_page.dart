import 'package:flutter/material.dart';

class PIN_LOGIN extends StatefulWidget {
  const PIN_LOGIN({Key? key}) : super(key: key);

  @override
  _PIN_LOGINState createState() => _PIN_LOGINState();
}

class _PIN_LOGINState extends State<PIN_LOGIN> {
  List<int> enteredPIN = [];
  List<String> pin = ["_", "_", "_", "_", "_", "_"];

  Widget button_num(int num, String Nn) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      width: 60,
      height: 60,
      margin: EdgeInsets.all(8),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPIN.length < 6) {
              enteredPIN.add(num);
              pin[enteredPIN.length - 1] = num.toString();
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
          foregroundColor: Colors.grey,
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
              pin[enteredPIN.length - 1] = "_";
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
            pin = ["_", "_", "_", "_", "_", "_"];
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
    String pinDisplay = pin.join(" ");
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
                children: [
                  Row(
                    
                    children: [
                      Text(pin[0],style: TextStyle(fontSize: 20),),
                      Text(pin[1],style: TextStyle(fontSize: 20)),
                      Text(pin[2],style: TextStyle(fontSize: 20)),
                      Text(pin[3],style: TextStyle(fontSize: 20)),
                      Text(pin[4],style: TextStyle(fontSize: 20)),
                      Text(pin[5],style: TextStyle(fontSize: 20)),
                    ],
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
