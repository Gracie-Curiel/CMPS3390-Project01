import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// `intl` package is used for date formatting (turning DateTime into a readable string)

void main() {
  runApp(const MyApp());
  // App entry point: runApp() launches your widget tree
}

// 1ST CLASS: ROOT WIDGET
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override whenever a subclass is replacing
  // (overriding) a method or property from
  // its parent class.
  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false, // remove debug banner
    home: HabitTrackerScreen(), // first screen shown in app
  );
}

// 2ND CLASS: VIEW (StatefulWidget because we need to store & update habits)
class HabitTrackerScreen extends StatefulWidget {
  const HabitTrackerScreen({super.key});

  @override
  State<HabitTrackerScreen> createState() => _HabitTrackerScreenState();
}

class _HabitTrackerScreenState extends State<HabitTrackerScreen> {
  // Controller for reading text from the input field
  final _controller = TextEditingController();

  // Lists to store habits and the dates they were added
  final List<String> _habits = [];
  final List<String> _dates = [];

  // Function: add a habit with current timestamp
  void _addHabit() {
    final text = _controller.text.trim(); // remove spaces
    if (text.isEmpty) return; // do nothing if input is empty

    // Format the current date and time into a string
    final String dateString = DateFormat(
      //"yyyy-MM-dd hh:mm:ss", // another possible format
      "EEE MMM dd HH:mm:ss yyyy", // example: Mon Sep 22 15:42:00 2025
    ).format(DateTime.now());

    setState(() {
      // Add new habit + date to the lists
      _habits.add(text);
      _dates.add(dateString);
      _controller.clear(); // clear the input field
    });
  }

  @override
  void dispose() {
    // Clean up the controller when widget is destroyed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Habit Tracker")), // Top bar
      body: Column(
        children: [
          Expanded(
            // Table of habits + dates
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: HabitTable(habits: _habits, dates: _dates),
            ),
          ),
          // Input field to type a habit
          AddHabit(controller: _controller, onSubmitted: _addHabit),
          // Button to add a habit
          ViewButton(onAdd: _addHabit),
        ],
      ),
    );
  }
}

// 3RD CLASS: HABIT TABLE (displays habits and their dates)
class HabitTable extends StatelessWidget {
  final List<String> habits;
  final List<String> dates;
  const HabitTable({super.key, required this.habits, required this.dates});

  @override
  Widget build(BuildContext context) {
    return Table(
      // Table with green borders
      border: TableBorder.all(color: Colors.green),
      // Each column fixed width
      columnWidths: const {0: FixedColumnWidth(200), 1: FixedColumnWidth(200)},
      children: [
        // HEADER ROW (labels)
        const TableRow(
          decoration: BoxDecoration(color: Colors.white),
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Habit",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Date",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        // If no habits exist yet, show a placeholder row
        if (habits.isEmpty)
          const TableRow(
            children: [
              Padding(padding: EdgeInsets.all(8), child: Text("No habits yet")),
              Padding(padding: EdgeInsets.all(8), child: Text("???")),
            ],
          )
        else
          // Otherwise, generate a row for each habit
          ...List.generate(habits.length, (i) {
            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(habits[i]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(dates[i]),
                ),
              ],
            );
          }),
      ],
    );
  }
}

// 4TH CLASS: INPUT FIELD
class AddHabit extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmitted;

  const AddHabit({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey, // background color for input field
      child: TextField(
        controller: controller, // connects to _controller in parent
        decoration: InputDecoration(border: const OutlineInputBorder()),
        // When the user presses "Enter" (done/submit), call onSubmitted
        onSubmitted: (_) => onSubmitted(),
      ),
    );
  }
}

// 5TH CLASS: BUTTON
class ViewButton extends StatelessWidget {
  final VoidCallback onAdd;
  const ViewButton({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) =>
      ElevatedButton(onPressed: onAdd, child: const Text('Add'));
}
