import 'package:todo/providers/stupid_data.dart';
import 'package:todo/widgets/adding_task_dialog.dart';
import 'package:todo/widgets/task_card.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App" , ),
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
                          return TaskCard(
                            taskModel: waitingTasks[index],
                            onChange: () {
                              setState(() {
                                waitingTasks[index].isDone =
                                    !waitingTasks[index].isDone;
                                completedTasks.add(waitingTasks[index]);
                                waitingTasks.remove(waitingTasks[index]);
                              });
                            },
                          );
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
                          return TaskCard(
                              taskModel: completedTasks[index],
                              onChange: () {
                                setState(() {
                                  completedTasks[index].isDone =
                                      !completedTasks[index].isDone;
                                  waitingTasks.add(completedTasks[index]);
                                  completedTasks.remove(completedTasks[index]);
                                });
                              });
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
              }).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
