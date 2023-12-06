import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/providers/stupid_data.dart';

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
                        waitingTasks.add(TaskModel(
                          title: titleController.text,
                          decsreption: subtitleController.text,
                          createdAt: DateTime.now(),
                        ));
                        setState(() {});
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
