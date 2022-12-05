import 'package:get/get.dart';

class TaskTodoList extends GetxController {
  final list = ['demo'].obs;

  addTask(value) {
    list.add(value);
    // update();
  }

  void deletTask(dd) {
    list.removeAt(dd);
  }

  void editTask(value, index) {
    list[index] = value;
  }
}
