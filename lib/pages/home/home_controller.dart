import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elogbook/model/todo_model.dart';
import 'package:elogbook/utils/app_constants.dart';
import 'package:elogbook/utils/shared_pre.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController todoDescriptionController =
      TextEditingController();
  RxList<TodoModel> todoList = <TodoModel>[].obs;
  RxString userName = ''.obs;

  @override
  void onInit() {
    SharedPre.getStringValue(SharedPre.username)
        .then((value) => userName.value = value);
    super.onInit();
  }

  void addTodo(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop();
      bool isAlreadyExist = false;
      for (var element in todoList) {
        if (element.todo == todoDescriptionController.text.trim()) {
          isAlreadyExist = true;
        }
      }
      if (isAlreadyExist) {
        Get.snackbar(
          AppConstants.warning,
          AppConstants.todoAlreadyExist,
        );
      } else {
        todoList.add(
          TodoModel(
            todo: todoDescriptionController.text.trim(),
            createdTime: DateTime.now().toString(),
            isComplete: false,
          ),
        );
        todoDescriptionController.clear();
        todoList.refresh();
      }
    }
  }

  void removeTodo(int index) {
    todoList.removeAt(index);
    todoList.refresh();
  }

  void tapOnCheck(int index) {
    todoList.elementAt(index).isComplete =
        !todoList.elementAt(index).isComplete;
    todoList.refresh();
  }
}
