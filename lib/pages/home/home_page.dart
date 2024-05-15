import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elogbook/pages/home/home_controller.dart';
import 'package:elogbook/utils/app_constants.dart';
import 'package:elogbook/utils/app_extension.dart';
import 'package:elogbook/utils/ui_helper.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Center(
            child: Obx(
              () {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '${UiHelper.greetText}${controller.userName}',
                    style: const TextStyle().medium,
                  ),
                );
              },
            ),
          ),
          leadingWidth: 200,
          // popup menu button
          actions: [
            popupMenu(context),
          ],
        ),
        body: Obx(
          () => Visibility(
            visible: controller.todoList.isNotEmpty,
            replacement: Center(
              child: Text(
                AppConstants.noTodoFind,
                style: const TextStyle().medium,
              ),
            ),
            child: ListView.separated(
              itemBuilder: (c, i) {
                var item = controller.todoList[i];
                return ListTile(
                  leading: Checkbox(
                    value: item.isComplete,
                    onChanged: (bool? value) => controller.tapOnCheck(i),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  title: Text(
                    item.todo,
                    style: item.isComplete
                        ? const TextStyle().medium.copyWith(
                              decoration: TextDecoration.lineThrough,
                            )
                        : const TextStyle().medium,
                  ),
                  trailing: IconButton(
                    onPressed: () => controller.removeTodo(i),
                    icon: Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red.shade400,
                    ),
                  ),
                );
              },
              separatorBuilder: (c, i) => const Divider(
                color: Colors.black12,
                height: 2,
                thickness: 1.5,
                indent: 12,
                endIndent: 12,
              ),
              itemCount: controller.todoList.length,
            ),
          ),
        ),
        floatingActionButton: Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: IconButton(
            onPressed: () => showTodoDialog(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget popupMenu(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        // popupmenu item 1
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Row(
            children: [
              const Icon(
                Icons.power_settings_new,
                color: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppConstants.signOut,
                style: const TextStyle().medium.copyWith(
                    // color: Colors.white,
                    ),
              )
            ],
          ),
        ),
      ],
      offset: const Offset(0, 60),
      color: Colors.white,
      elevation: 2,
      // on selected we show the dialog box
      onSelected: (value) {
        // if value 1 show dialog
        if (value == 1) {
          UiHelper.showLogoutDialog(context);
        }
      },
    );
  }

  void showTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          title: Text(
            AppConstants.createTodo,
            style: const TextStyle().medium,
          ),
          content: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiHelper.smallVerticalSpace(),
                TextFormField(
                  controller: controller.todoDescriptionController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return AppConstants.pleaseEnterTodoDescription;
                    }
                    return null;
                  },
                  decoration: const InputDecoration().txtFieldStyle(
                    hintText: AppConstants.todoDescription,
                    labelName: AppConstants.todoDescription,
                  ),
                  minLines: 1,
                  maxLines: 10,
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              child: const Text(AppConstants.cancel),
              onPressed: () {
                Navigator.of(context).pop();
                controller.todoDescriptionController.clear();
              },
            ),
            MaterialButton(
              child: const Text(AppConstants.addTodo),
              onPressed: () {
                controller.addTodo(context);
              },
            ),
          ],
        );
      },
    );
  }
}
