import 'package:flutter/material.dart';

// MAIN FUNCTION
void main() {
  runApp(const MyApp());
}

// 1ST CLASS: ROOT CLASS
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstView(),
    );
  }
}

// 2ND CLASS: FIRST VIEW
class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ViewButton(), 
      ),
    );
  }
}

// 3RD CLASS: BUTTON STYLE
class ViewButton extends StatelessWidget {
  const ViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( // <-- Fixed typo
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondView()),
        );
      },
      child: const Text('Hello'),
    );
  }
}

// 4TH CLASS: SECOND VIEW
class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: Center(
        child: ElevatedButton( // <-- Fixed typo
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ),
    );
  }
}
