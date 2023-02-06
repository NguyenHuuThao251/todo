import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTitle extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTitle({Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),

            )
          ],
        ),

        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),

            )
          ],
        ),

        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              activeColor: Colors.blue,
              checkColor: Colors.white,
            ),
            Expanded(
                child: Text(
                  taskName,
                  maxLines: 200,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: Colors.purple,
                    decorationThickness: 1,
                    color: taskCompleted ? Color.fromARGB(147, 255, 255, 255) : Colors.white,
                    fontSize: 14,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
  
}