import '../models/task_model.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskModel, required this.onChange});
  final TaskModel taskModel;
  final Function onChange;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.taskModel.title),
        subtitle: Text(widget.taskModel.decsreption),
        trailing: Checkbox(
          value: widget.taskModel.isDone,
          onChanged: (value) {
            widget.onChange();
          },
        ));
  }
}
