import 'package:ejercicio_componentes/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliders and Checks")
      ),
      body: SingleChildScrollView (
        child: Column(
          children: [
            Slider.adaptive (
              min: 50,
              max: 400,
              activeColor: AppTheme.primary,
              divisions: 10,
              value: _sliderValue,
              onChanged: _sliderEnabled ? (value) {
                _sliderValue = value;
                setState((){});
              } : null
            ),

/*
            Checkbox(
              activeColor: AppTheme.primary,
              value: _sliderEnabled,
              onChanged: (value) {
                _sliderEnabled = value ?? true;
                setState((){});
              }
            ),

            Switch(
              activeColor: AppTheme.primary,
              value: _sliderEnabled,
              onChanged: (value) {
                setState((){
                  _sliderEnabled = value;
                });
              }
            ),
*/

            CheckboxListTile.adaptive(
              activeColor: AppTheme.primary,
              title: Text("Habilitar Slider"),
              value: _sliderEnabled,
              onChanged: (value) {
                setState((){
                  _sliderEnabled = value ?? true;
                });
              }
            ),

            SwitchListTile.adaptive(
              activeColor: AppTheme.primary,
              title: Text("Habilitar Slider"),
              value: _sliderEnabled,
              onChanged: (value) {
                setState((){
                  _sliderEnabled = value;
                });
              }
            ),

            const AboutListTile(),

            SingleChildScrollView (
              child: Image(
                image: NetworkImage("https://swebtoon-phinf.pstatic.net/20181117_218/1542460915047niGCp_JPEG/thumbnail.jpg"),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ],
        ),
      )
    );
  }
}