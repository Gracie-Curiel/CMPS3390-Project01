import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // CENTER AREA
        body: Center(
          // BOX SIZE
          child: SizedBox(
            width: 100,
            height: 100,
            // BOX ACTION
            child: FloatingActionButton(
              backgroundColor: Colors.green[600],
              child: Text('Hello World', textAlign: TextAlign.center),
              // TO DO: When the "Hello" button is clicked it
              //        should launch a new view/model/alert.
              onPressed: () {
                Text('hello world');
              },
            ),
          ),
        ),
      ),
    );
  }
}
