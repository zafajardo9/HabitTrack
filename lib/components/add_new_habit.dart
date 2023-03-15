import 'package:flutter/material.dart';
import 'package:habit_tracker/colors/colors.dart';

class AddNewHabit extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const AddNewHabit({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(enabledBorder: OutlineInputBorder()),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          color: AppColors.buttonBackground,
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white70),
          ),
        ),
        MaterialButton(
          onPressed: onCancel,
          color: AppColors.buttonBackground,
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
