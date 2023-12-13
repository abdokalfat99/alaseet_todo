import 'package:provider/provider.dart';

import '../providers/tasks_provider.dart';
import 'package:flutter/material.dart';

class ClearTasksDialog extends StatefulWidget {
  const ClearTasksDialog({super.key});

  @override
  State<ClearTasksDialog> createState() => _ClearTasksDialogState();
}

class _ClearTasksDialogState extends State<ClearTasksDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Text(
                  "Clear Tasks",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Are you sure you want to clear all tasks?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<TasksProvider>(context, listen: false)
                          .clearAllTasks();

                      Navigator.pop(context);
                    },
                    child: const Text("Yes")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

