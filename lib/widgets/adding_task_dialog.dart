import 'package:provider/provider.dart';
import 'package:todo/models/task_model.dart';

import '../providers/tasks_provider.dart';
import 'package:flutter/material.dart';

class AddingTaskDialog extends StatefulWidget {
  const AddingTaskDialog({super.key});

  @override
  State<AddingTaskDialog> createState() => _AddingTaskDialogState();
}

class _AddingTaskDialogState extends State<AddingTaskDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

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
                  "Add Task",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Title",
                )),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
                controller: subtitleController,
                decoration: const InputDecoration(
                  hintText: "Subtitle",
                )),
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
                      if (titleController.text.isNotEmpty &&
                          subtitleController.text.isNotEmpty) {
                        Provider.of<TasksProvider>(context, listen: false)
                            .addNewTask(TaskModel(
                                title: titleController.text,
                                subtitle: subtitleController.text,
                                createdAt: DateTime.now().toString(),
                                isDone: false));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Add")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
