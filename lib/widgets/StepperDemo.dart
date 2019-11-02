import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NINGHAO'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => debugPrint('Search button is pressed.'),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Stepper(
              onStepTapped: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              currentStep: _currentIndex,
              onStepContinue: () {
                setState(() {
                  _currentIndex < 2 ? _currentIndex += 1 : _currentIndex = 0;
                });
              },
              onStepCancel: () {
                setState(() {
                  _currentIndex > 0 ? _currentIndex -= 1 : _currentIndex = 2;
                });
              },
              steps: [
                Step(
                  title: Text('Login'),
                  content: Text('out'),
                  isActive: _currentIndex == 0,
                ),
                Step(
                  title: Text('Login'),
                  content: Text('out'),
                  isActive: _currentIndex == 1,
                ),
                Step(
                  title: Text('Login'),
                  content: Text('out'),
                  isActive: _currentIndex == 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
