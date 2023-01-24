import 'package:todo/constants/colors.dart';
import 'package:todo/controller/todo_controller.dart';
import 'package:todo/widgets/appbar.dart';
import 'package:todo/widgets/todo_item.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/toogle.dart';

/// ToDo View
class ToDoView extends GetView<ToDoController> {
  const ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ToDoController());
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: buildAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Obx(
              () => controller.isTodosLoaded() == false
                  ? controller.searchList().isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 25,
                            horizontal: 15,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.searchList().length,
                          itemBuilder: ((context, index) {
                            return Obx(
                              () => ToDoItem(
                                todo: controller.searchList[index],
                                onToDoChanged: () {
                                  controller.searchList[index].isDone =
                                      !controller.searchList[index].isDone;
                                  controller.searchList.refresh();
                                },
                                onDeleteItem: () {
                                  controller.deleteToDoItem(
                                    controller.searchList[index].id ?? '',
                                  );
                                },
                              ),
                            );
                          }),
                        )
                      : Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'No todos found',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.sentiment_very_dissatisfied,
                                size: 40,
                              )
                            ],
                          ),
                        )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.teal,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller.todoController,
                    decoration: const InputDecoration(
                      hintText: 'Add a new todo ',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    controller.addToDoItem(controller.todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: const Size(60, 60),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
