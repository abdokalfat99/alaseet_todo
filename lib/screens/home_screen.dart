import '../models/task_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Hello People
  List<TaskModel> waitingTasks = [];
  List<TaskModel> completedTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
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
                waitingTasks.isEmpty
                    ? const Center(
                        child: Text("There is no waiting tasks"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: waitingTasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              title: Text(waitingTasks[index].title),
                              subtitle: Text(waitingTasks[index].decsreption),
                              trailing: Checkbox(
                                value: waitingTasks[index].isDone,
                                onChanged: (value) {
                                  setState(() {
                                    waitingTasks[index].isDone =
                                        !waitingTasks[index].isDone;
                                    completedTasks.add(waitingTasks[index]);
                                    waitingTasks.remove(waitingTasks[index]);
                                  });
                                },
                              ));
                        },
                      ),

                // Completed Tasks
                completedTasks.isEmpty
                    ? const Center(child: Text("You didnt complete any task"))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: completedTasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              title: Text(completedTasks[index].title),
                              subtitle: Text(completedTasks[index].decsreption),
                              trailing: Checkbox(
                                value: completedTasks[index].isDone,
                                onChanged: (value) {
                                  setState(() {
                                    completedTasks[index].isDone =
                                        !completedTasks[index].isDone;
                                    waitingTasks.add(completedTasks[index]);
                                    completedTasks
                                        .remove(completedTasks[index]);
                                  });
                                },
                              ));
                        },
                      ),
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            waitingTasks.add(TaskModel(
                title: "title ${waitingTasks.length}",
                decsreption: "descreption ${waitingTasks.length}",
                createdAt: DateTime.now()));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
