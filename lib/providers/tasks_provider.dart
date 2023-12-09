import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> waitingTasks = [];
  List<TaskModel> completedTasks = [];

  addNewTask(TaskModel taskModel) {
    waitingTasks.add(taskModel);
    storeTasksToStorage();

    notifyListeners();
  }

  switchStatus(TaskModel taskModel) {
    if (taskModel.isDone) {
      taskModel.isDone = !taskModel.isDone;
      waitingTasks.add(taskModel);
      completedTasks.remove(taskModel);
    } else {
      taskModel.isDone = !taskModel.isDone;
      completedTasks.add(taskModel);
      waitingTasks.remove(taskModel);
    }
    storeTasksToStorage();
    notifyListeners();
  }

  storeTasksToStorage() async {
    if (kDebugMode) {
      print("STORE FUNCTION");
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("waiting", json.encode(waitingTasks));
    prefs.setString("completed", json.encode(completedTasks));
  }

  getTasksFromStorage() async {
    if (kDebugMode) {
      print("GET FUNCTION");
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("waiting")) {
      waitingTasks = (json.decode(prefs.getString("waiting")!) as List)
          .map((e) => TaskModel.fromJson(e))
          .toList();
    }

    if (prefs.containsKey("completed")) {
      completedTasks = (json.decode(prefs.getString("completed")!) as List)
          .map((e) => TaskModel.fromJson(e))
          .toList();
    }
    notifyListeners();
  }

  clearAllTasks() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    completedTasks.clear();
    waitingTasks.clear();
    prefs.clear();
    notifyListeners();

  }
}
