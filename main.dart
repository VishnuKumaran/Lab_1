import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Lean Body Mass Calculator',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Center(child: secondclass()
            /* child: Padding(
            padding: EdgeInsets.all(5),
            child: secondclass(),
          ),*/
            ),
      ),
    );
  }
}

class secondclass extends StatefulWidget {
  @override
  _secondclassState createState() => _secondclassState();
}

enum Gender { male, female }
enum Umur { adults, children }

class _secondclassState extends State<secondclass> {
  Gender gender = Gender.male;
  Umur age = Umur.adults;
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  double results, BFM, BFF, JFM, JFF, HFM, HFF, PFC;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          //BAHAGIAN GENDER
          Text("Gender"),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Male"),
              Radio(
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (Gender value) {
                    setState(() {
                      gender = value;
                    });
                  }),
              Text("Female"),
              Radio(
                  value: Gender.female,
                  groupValue: gender,
                  onChanged: (Gender value) {
                    setState(() {
                      gender = value;
                    });
                  })
            ],
          ),
          Padding(
            padding: new EdgeInsets.all(10.0),
          ),

          //BAHAGIAN AGE
          Text("Age Category"),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Adults"),
              Radio(
                  value: Umur.adults,
                  groupValue: age,
                  onChanged: (Umur value) {
                    setState(() {
                      age = value;
                    });
                  }),
              Text("Children"),
              Radio(
                  value: Umur.children,
                  groupValue: age,
                  onChanged: (Umur value) {
                    setState(() {
                      age = value;
                    });
                  })
            ],
          ),

          Padding(
            padding: new EdgeInsets.all(20.0),
          ),

          //BAHAGIAN TINGGI DAN BERAT
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Height :"),
              SizedBox(width: 15),
              Container(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(hintText: "in CM"),
                  controller: _heightController,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Weight :"),
              SizedBox(width: 15),
              Container(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(hintText: "in KG"),
                  controller: _weightController,
                ),
              )
            ],
          ),
          Padding(
            padding: new EdgeInsets.all(20.0),
          ),
          RaisedButton(
            color: Colors.blue[300],
            child: Text("Calculate now"),
            onPressed: _calculateMe,
          ),
          Text("Your Lean Body Mass is " + BFM.toString() + " KG "),
        ])));
  }

  void _calculateMe() {
    setState(() {
      double h = double.parse(_heightController.text);
      double w = double.parse(_weightController.text);

      BFM = 0.407 * w + 0.267 * h - 19.2;
      BFF = 0.252 * w + 0.473 * h - 48.3;
      JFM = 1.1 * w - 128 * ((w / h) * 2);
      JFF = 1.07 * w - 148 * ((w / h) * 2);
      HFM = 0.32810 * w + 0.33929 * h - 29.5336;
      HFF = 0.29569 * w + 0.41813 * h - 43.2933;
      PFC = 3.8 * (((0.0215 * w) * 0.6469) * ((h) * 0.7236));

      if ((gender.toString == "Male") && (age.toString == "Adults")) {
        print("Your Boer's Lean Body Mass is " + BFM.toString());
        print("Your James's Lean Body Mass is " + JFM.toString());
        print("Your Hume's Lean Body Mass is " + HFM.toString());
      } else if ((gender.toString == "Female") && (age.toString == "Adults")) {
        print("Your Boer's Lean Body Mass is " + BFF.toString());
        print("Your James's  Lean Body Mass is " + JFF.toString());
        print("Your Hume's Lean Body Mass is " + HFF.toString());
      } else if ((gender.toString == "Male") && (age.toString == "Children")) {
        print("Your Lean Body Mass is " + PFC.toString());
      } else {
        print("Your Lean Body Mass is " + PFC.toString());
      }
      {}
    });
  }
}
