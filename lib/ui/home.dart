import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Planet"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[
            Image.asset(
              "img/planet.png",
              height: 135.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Your Weight On Earth",
                      hintText: "In Pounds",
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.pink,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      Text("Pluto", style: TextStyle(color: Colors.white30)),
                      Radio<int>(
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      Text("Mars", style: TextStyle(color: Colors.white30)),
                      Radio<int>(
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      Text("Venus", style: TextStyle(color: Colors.white30)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(16.0)),
                  Text(
                    _weightController.text.isEmpty
                        ? "Please insert your weight"
                        : "Your Weight is $_finalResult",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong !!");
      return int.parse("180") * 0.38;
    }
  }
}
