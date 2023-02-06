import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({Key? key, required this.controller, required this.onSave, required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(89, 0, 0, 0),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black)
                ),
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                labelText: "Enter Your Task",
                hintText: "Add Task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(text: "Add", onPressed: onSave),
                const SizedBox(
                  width: 10,
                ),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }

  
}