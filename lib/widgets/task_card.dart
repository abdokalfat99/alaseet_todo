import 'package:provider/provider.dart';

import '../models/task_model.dart';
import '../providers/tasks_provider.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.taskModel.title),
        subtitle: Text(widget.taskModel.subtitle),
        trailing: Checkbox(
          value: widget.taskModel.isDone,
          onChanged: (value) {
            Provider.of<TasksProvider>(context, listen: false)
                .switchStatus(widget.taskModel);
          },
        ));
  }
}
