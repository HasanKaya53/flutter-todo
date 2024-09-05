


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {

  const Todolist({
      super.key, 
      required this.taskName,
      required this.taskCompleted, 
      this.onCheckboxChanged, 
      this.deleteFunction
      
    });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onCheckboxChanged;
  final Function(BuildContext) ? deleteFunction;
  

  @override
  Widget build(BuildContext context) {
      return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 0
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: deleteFunction,
                    icon: Icons.delete,
                    //color: Colors.blue,
                    foregroundColor: Colors.white,
                    label: 'Delete',
                    borderRadius: BorderRadius.circular(15),
                    backgroundColor: Colors.deepPurple,
                  )
                ],
              ),
              child: Container(
               
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: taskCompleted,
                      onChanged: onCheckboxChanged,
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      side: const BorderSide(
                        color: Colors.white,
                        width: 2
                      ),
                    ),
                    Text(
                      taskName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        decorationColor: Colors.white,
                        decorationThickness: 2
                      )
                    
                    ),
                  ],
                ),
              ),
            ),
          );;
  }
}