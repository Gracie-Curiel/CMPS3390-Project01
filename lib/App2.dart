import 'package:flutter/material.dart';

// MAIN FUNCTION
void main() {
  runApp(const MyApp());
}

// 1ST CLASS: ROOT
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HabitTrackerScreen());
  }
}

// 2ND CLASS: VIEW
class HabitTrackerScreen extends StatelessWidget {
  const HabitTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habit Tracker")),
      body: const Padding(padding: EdgeInsets.all(16.0), child: HabitTable()),
    );
  }
}

// 3RD CLASS: HABIT TABLE
class HabitTable extends StatelessWidget {
  const HabitTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.green),
      columnWidths: const {0: FixedColumnWidth(100), 1: FixedColumnWidth(100)},
      children: [
        TableRow(
          decoration: const BoxDecoration(color: Colors.white),
          children: const [
            // FIRST COLUMN
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Habit",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            // SECOND COLUMN
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Date",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const TableRow(
          children: [
            // FIRST ROW
            Padding(padding: EdgeInsets.all(8.0), child: Text("")),

            // SECOND ROW
            Padding(padding: EdgeInsets.all(8.0), child: Text("")),
          ],
        ),
      ],
    );
  }
}
