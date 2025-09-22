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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HabitTrackerScreen(),
    );
  }
}

// 2ND CLASS: VIEW
class HabitTrackerScreen extends StatelessWidget {
  const HabitTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habit Tracker")),
      body: const Column(
        children: const [
          Expanded(
            child: Padding(padding: EdgeInsets.all(16.0), child: HabitTable()),
          ),
          AddHabit(),
          ViewButton(),
        ],
      ),
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

// 4TH CLASS INPUT FILED
class AddHabit extends StatelessWidget {
  const AddHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Colors.grey,
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter new habit...",
        ),
      ),
    );
  }
}

// 5TH CLASS: BUTTON STYLE
class ViewButton extends StatelessWidget {
  const ViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      },
      child: const Text('Add'),
    );
  }
}
