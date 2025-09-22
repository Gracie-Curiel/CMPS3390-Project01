import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// 1ST CLASS: ROOT
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HabitTrackerScreen(),
      );
}

// 2ND CLASS: VIEW (stateful: holds list + controller)
class HabitTrackerScreen extends StatefulWidget {
  const HabitTrackerScreen({super.key});
  @override
  State<HabitTrackerScreen> createState() => _HabitTrackerScreenState();
}

class _HabitTrackerScreenState extends State<HabitTrackerScreen> {
  final _controller = TextEditingController();
  final List<String> _habits = [];
  final currentDate = DateTime.now();

  void _addHabit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _habits.add(text);
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Habit Tracker ${currentDate}")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: HabitTable(habits: _habits),
            ),
          ),
          AddHabit(controller: _controller, onSubmitted: _addHabit),
          ViewButton(onAdd: _addHabit),
        ],
      ),
    );
  }
}

// 3RD CLASS: HABIT TABLE
class HabitTable extends StatelessWidget {
  final List<String> habits;
  const HabitTable({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.green),
      columnWidths: const {0: FixedColumnWidth(200)},
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Colors.white),
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("Habit", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        if (habits.isEmpty)
          const TableRow(children: [
            Padding(padding: EdgeInsets.all(8), child: Text("No habits yet")),
          ])
        else
          ...habits.map((h) => TableRow(children: [
                Padding(padding: const EdgeInsets.all(8), child: Text(h)),
              ])),
      ],
    );
  }
}

// 4TH CLASS: INPUT FIELD
class AddHabit extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmitted;
  const AddHabit({super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: "Enter new habit...",
          // Note: This puts an X on the text field for 
          // when the user wants to clear
          //suffixIcon: IconButton(onPressed: controller.clear, icon: const Icon(Icons.clear)),
        ),
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
