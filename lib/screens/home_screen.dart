import 'package:provider/provider.dart';
import 'package:todo/providers/tasks_provider.dart';
import 'package:todo/widgets/adding_task_dialog.dart';
import 'package:todo/widgets/clear_tasks_dialog.dart';
import 'package:todo/widgets/task_card.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<TasksProvider>(context, listen: false).getTasksFromStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, tasksConsumer, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "ToDo App",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const ClearTasksDialog();
                      });
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(labelStyle: TextStyle(color: Colors.blue), tabs: [
                Tab(
                  text: "Waintig Tasks",
                ),
                Tab(
                  text: "Completed Tasks",
                )
              ]),
              Expanded(
                child: TabBarView(children: [
                  // Waiting tasks
                  tasksConsumer.waitingTasks.isEmpty
                      ? const Center(
                          child: Text("There is no waiting tasks"),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: tasksConsumer.waitingTasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TaskCard(
                              taskModel: tasksConsumer.waitingTasks[index],
                            );
                          },
                        ),

                  // Completed Tasks
                  tasksConsumer.completedTasks.isEmpty
                      ? const Center(child: Text("You didnt complete any task"))
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: tasksConsumer.completedTasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TaskCard(
                              taskModel: tasksConsumer.completedTasks[index],
                            );
                          },
                        ),
                ]),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const AddingTaskDialog();
                });
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
