import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
          );
        }
    );
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });

    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 36, 36),
      appBar: AppBar(
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            Text("Animated ToDo App"),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fkhotenmien.vn%2Fcach-de-lay-lien-ket-url-cua-hinh-anh%2F&psig=AOvVaw1EruupXVJgl-izQs2_CoYf&ust=1675758963924000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIDajeC-gP0CFQAAAAAdAAAAABAh'),
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: Column(
        children: [
          Expanded(child:
              ListView.builder(
                itemCount: db.toDoList.length,
                  itemBuilder: (context, index){
                    return ToDoTitle(
                        taskName: db.toDoList[index][0],
                        taskCompleted: db.toDoList[index][1],
                        onChanged: (value) => checkBoxChanged(value, index),
                        deleteFunction: (context) => deleteTask(index)
                    );

                  }
              )
          )
        ],
      ),
    );
  }
  
}