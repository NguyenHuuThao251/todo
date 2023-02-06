import 'package:hive_flutter/hive_flutter.dart';


class ToDoDataBase {
  List toDoList = [];


  final _myBox = Hive.box("mybox");

  void createInitialData() {
    toDoList = [
      ["Welcome to our Todo App", false],
      ["Create your day todo", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}

