import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TaskTodoList extends GetxController {
  var box = GetStorage(); //create storage in your phone.
  var list = [].obs;

  @override
  void onInit() {
    readTasks();
    super.onInit();
  }

  void readTasks() async {
    await box.read('list');
    print(box.read('list'));
    list.addAll(box.read('list'));
    print(list);
  }

//knew capture.

  addTask(value) async {
    list.add(value);
    await box.write('list', list);
  }

  void deletTask(dd) {
    list.removeAt(dd);
  }

  void editTask(value, index) {
    list[index] = value;
  }
}
