// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/utils/extensions.dart';

import '../model/todo.dart';
import '../constants/colors.dart';

class ToDoItem extends StatefulWidget {
  /// Class
  final ToDo todo;

  /// On change
  final Function()? onToDoChanged;

  /// on Delete
  final Function()? onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  late Timer _timer;

 int _start = 60;

  void startTimer(int start) {
    const oneSec =  Duration(seconds:1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
  void pauseTimer() {
    if (_timer != null) _timer.cancel();
  }
  void unpauseTimer() => startTimer(_start);


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [


          ListTile(
            onTap: widget.onToDoChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            tileColor: widget.todo.isDone ? Colors.teal : Colors.white,
            leading: Icon(
              widget.todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: widget.todo.isDone ? Colors.white : Colors.teal,
            ),
            title: Text(
              widget.todo.todoText ?? '',
              style: TextStyle(
                fontSize: 16,
                color: widget.todo.isDone ? Colors.white : tdBlack,
                decoration: widget.todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                startTimer(60);
              },
              child: Text("$_start"),
            ),
          ),
      Row(
        children: [
          SizedBox(width: 10.0,),
          ElevatedButton(
            onPressed: () {
              pauseTimer();
            },
            child: Text("stop"),
          ),
          SizedBox(width: 15.0,),
          ElevatedButton(
            onPressed: () {
              unpauseTimer();
            },
            child: Text("resume"),
          ),
        ],
      ),




          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                widget.todo.createdAt?.dateExtensionWithTime ??
                    DateTime.now().dateExtensionWithTime,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

