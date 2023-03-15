import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit_tile.dart';

import '../components/add_new_habit.dart';
import '../components/my_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list
  List todaysHabitList = [
    ["Morning Run", false],
    ["Read Notes", false],
  ];

  //if the chechbox is tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

  //let user create or add
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    //show diag
    showDialog(
      context: context,
      builder: (context) {
        return AddNewHabit(
          controller: _newHabitNameController,
          onSave: saveNewHabit,
          onCancel: cancelNewHabit,
        );
      },
    );
  }

  //functions in showdialog
  void saveNewHabit() {
    //adding
    setState(() {
      todaysHabitList.add([_newHabitNameController.text, false]);
    });

    //+++
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void cancelNewHabit() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: createNewHabit,
      ),
      body: ListView.builder(
        itemCount: todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habitName: todaysHabitList[index][0],
            habitCompleted: todaysHabitList[index][1],
            onChanged: (value) => checkBoxTapped(value, index),
          );
        },
      ),
    );
  }
}
