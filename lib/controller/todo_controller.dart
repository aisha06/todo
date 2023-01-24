import 'package:flutter/cupertino.dart';
import 'package:todo/model/todo.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController {
  /// on Init Method
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      isTodosLoaded(true);
    }).whenComplete(() {
      isTodosLoaded(false);
    });
    searchList(todosList);
    searchList.refresh();
    super.onInit();
  }

  /// On Ready Method
  @override
  void onReady() {
    super.onReady();
  }

  /// On Close Method
  @override
  void onClose() {
    super.onClose();
  }

  /// TODO List
  RxList<ToDo> todosList = <ToDo>[].obs;

  /// Searched list
  RxList<ToDo> searchList = <ToDo>[].obs;

  /// Todo controller
  TextEditingController todoController = TextEditingController();

  RxBool isTodosLoaded = true.obs;

  /// Filter for search
  void filtersTodo(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    searchList(results);
    searchList.refresh();
  }

  ///  taskTODO Add method
  void addToDoItem(String toDo) {
    todosList.add(ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      todoText: toDo,
    ));
    todosList.refresh();
    todoController.clear();
  }

  /// Handle taskTODO change method
  void handleToDoChange(ToDo todo) {
    todo.isDone = !todo.isDone;
  }

  /// Delete taskTODO  method
  void deleteToDoItem(String id) {
    todosList.removeWhere((item) => item.id == id);
    todosList.refresh();
  }
}
