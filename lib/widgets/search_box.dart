import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controller/todo_controller.dart';
import 'package:get/get.dart';

/// Search box widget for searching
Widget searchBox() {
  final ToDoController controller = Get.find<ToDoController>();
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      onChanged: (value) => controller.filtersTodo(value),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search todos',
        hintStyle: TextStyle(color: Colors.deepOrange),
      ),
    ),
  );
}
