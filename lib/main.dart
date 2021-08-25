import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late int firnum;
  late int secnum;
  String texttodisplay = "";
  late String res;
  late String operationtoperform;

  void btnclicked(String btntext) {
    if (btntext == "C") {
      texttodisplay = "";
      firnum = 0;
      secnum = 0;
      res = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "x" ||
        btntext == "/") {
      firnum = int.parse(texttodisplay);
      res = "";
      operationtoperform = btntext;
    } else if (btntext == "=") {
      secnum = int.parse(texttodisplay);
      if (operationtoperform == "+") {
        res = (firnum + secnum).toString();
      }
      if (operationtoperform == "-") {
        res = (firnum - secnum).toString();
      }
      if (operationtoperform == "x") {
        res = (firnum * secnum).toString();
      }
      if (operationtoperform == "/") {
        res = (firnum ~/ secnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btntext).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
        child: OutlinedButton(
      style: OutlinedButton.styleFrom(padding: EdgeInsets.all(25.0)),
      onPressed: () => btnclicked(btnval),
      child: Text(
        "$btnval",
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
