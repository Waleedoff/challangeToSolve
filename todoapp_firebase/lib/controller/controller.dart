// import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';

class TaskTodoList extends GetxController {
  final list = ['demo'].obs;

  addTask(value) {
    list.add(value);
    // update();
  }
}
