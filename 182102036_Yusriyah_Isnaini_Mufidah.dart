// Nama : Yusiyah Isnaini Mufidah
// NIM  : 182102036
// Prodi: S1 - Informatika

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Slider State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _hue = 180.0;
  double _saturation = 0.5;
  double _lightness = 0.5;

  void _onChangedHue(newValue) {
    setState(() {
      _hue = newValue;
    });
  }

  void _onChangedSaturation(newValue) {
    setState(() {
      _saturation = newValue;
    });
  }

  void _onChangedLightness(newValue) {
    setState(() {
      _lightness = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tugas State Management"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text('Yusriyah Isnaini M',
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text('182102036', textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              Container(
                color: HSLColor.fromAHSL(1.0, _hue, _saturation, _lightness)
                    .toColor(),
                height: 250,
                width: MediaQuery.of(context).copyWith().size.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    margin: EdgeInsets.all(10),
                    child: Text("Hue"),
                  ),
                  ColorSlider(_hue, 360.0, _onChangedHue)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    margin: EdgeInsets.all(10),
                    child: Text("Saturation"),
                  ),
                  ColorSlider(_saturation, 1.0, _onChangedSaturation)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    margin: EdgeInsets.all(10),
                    child: Text("Lightness"),
                  ),
                  ColorSlider(_lightness, 1.0, _onChangedLightness)
                ],
              ),
            ],
          ),
        ));
  }
}

class ColorSlider extends StatelessWidget {
  final double hslItem;
  final double maxValue;
  final onChanged;

  ColorSlider(this.hslItem, this.maxValue, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Slider(
        value: hslItem,
        divisions: 25,
        label: "$hslItem",
        min: 0,
        max: maxValue,
        onChanged: (newValue) {
          onChanged(newValue);
        },
      ),
    );
  }
}
