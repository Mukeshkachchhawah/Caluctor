import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NextScreen(),
    );
  }
}

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  String result = "0";
  List inputDate = [];

  String tempNumber = "";
  bool inShowResutl = false;
  buttonPressed(String Number) {
    // All Number Print
    //  print(Number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caluctor"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(result),
                ),
              ))),
          Expanded(
              flex: 7,
              child: Container(
                  color: Color.fromARGB(255, 0, 0, 0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton("1"),
                            MaterialButton("2"),
                            MaterialButton("3"),
                            MaterialButton("/")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton("4"),
                            MaterialButton("5"),
                            MaterialButton("6"),
                            MaterialButton("*")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton("7"),
                            MaterialButton("8"),
                            MaterialButton("9"),
                            MaterialButton("-")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton("."),
                            MaterialButton("0"),
                            MaterialButton("00"),
                            MaterialButton("+")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton("Clear"),
                            MaterialButton("Back"),
                            MaterialButton("%"),
                            MaterialButton("=")
                          ],
                        ),
                      ]),
                    ),
                  )))
        ],
      ),
    );
  }

  Widget MaterialButton(String Number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          child: Text(
            Number,
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {
            buttonPressed(Number);

            if (Number == "Clear") {
              return clear();
            }
            if (Number == "Back") {
              return removeLastNumber();
            }

            if (result == "0") {
              result = "";
            }

            if (Number == "+" ||
                Number == "-" ||
                Number == "*" ||
                Number == "/" ||
                Number == "%") {
              inputDate.add(tempNumber);
              inputDate.add(Number);

              tempNumber = "";
            }
            if (Number == "=") {
              inputDate.add(tempNumber);
              return calutation();
            }

            result = result + Number;
            if (Number == "+" ||
                Number == "-" ||
                Number == "*" ||
                Number == "/" ||
                Number == "%") {
            } else {
              tempNumber = tempNumber + Number;
            }
            setState(() {});
          }),
    );
  }

  void clear() {
    result = "0";
    tempNumber = "";
    inputDate.clear();
    setState(() {});
    return;
  }

  void removeLastNumber() {
    if (result.length > 0) {
      result = result.substring(0, result.length - 1);
      setState(() {});
    }
  }

  void calutation() {
    var isShowResult = true;

    print("inputDate $inputDate");
    double a = int.parse(inputDate.first).toDouble();
    double b = int.parse(inputDate.last).toDouble();

    String getSymol = inputDate[1];

    if (getSymol == "+") {
      result = addNum(a, b).toString();
    } else if (getSymol == "-") {
      result = addNum(a, b).toString();
    } else if (getSymol == "*") {
      result = addNum(a, b).toString();
    } else if (getSymol == "/") {
      result = addNum(a, b).toString();
    } else if (getSymol == "%") {
      result = addNum(a, b).toString();
    }
    setState(() {});
  }

  addNum(a, b) {
    return a + b;
  }

  minaus(a, b) {
    return a - b;
  }

  maltiple(a, b) {
    return a * b;
  }

  divid(a, b) {
    return a / b;
  }

  parsent(a, b) {
    return a % b;
  }
}
