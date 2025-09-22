import 'package:flutter/material.dart';
// Import the Flutter Material library, which provides
// widgets (like buttons, text, layouts) that follow
// Material Design guidelines.

// MAIN FUNCTION
void main() {
  runApp(const MyApp());
  // runApp() starts the Flutter app.
  // It takes a widget (here, MyApp) and makes it the root of the app.
}

// 1ST CLASS: ROOT CLASS
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp is the overall wrapper for your app.
    // It handles navigation, theming, and more.
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // removes the debug banner in the corner
      home: FirstView(), // sets the starting screen of the app
    );
  }
}

// 2ND CLASS: FIRST VIEW (initial screen shown)
class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold gives a standard page layout (with app bar, body, etc.)
    // Here, we only use the body.
    return const Scaffold(
      body: Center(
        child: ViewButton(), // places our custom button in the center
      ),
    );
  }
}

// 3RD CLASS: BUTTON STYLE (a custom button widget)
class ViewButton extends StatelessWidget {
  const ViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // ElevatedButton = button with a raised look
      onPressed: () {
        // When pressed, this pushes (navigates) to the SecondView screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondView()),
        );
      },
      child: const Text('Hello'), // button text
    );
  }
}

// 4TH CLASS: SECOND VIEW (the new page after button press)
class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold gives us an app bar + body again
      appBar: AppBar(
        title: const Text('Hello World'), // title shown in the top bar
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pops (closes) the current page and goes back to the previous one
            Navigator.pop(context);
          },
          child: const Text('OK'), // button text
        ),
      ),
    );
  }
}
