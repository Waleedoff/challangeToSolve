import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TaskTodoList extends GetxController {
  final GetStorage box = GetStorage(); //create storage in your phone.
  var list = [].obs;

  @override
  void onInit() {
    readTasks();
    // deletTask('list');
    super.onInit();
  }

  void readTasks() async {
    await box.read('list');
    box.writeIfNull('list', list);
    list.addAll(box.read('list'));
    print(list);
  }

//knew capture.

  addTask(value) async {
    list.add(value);
    await box.write('list', list);
  }

  void deletTask(dd) async {
    list.removeAt(dd);
    await box.remove('list');
    box.writeIfNull('list', list);
  }

  Future<void> editTask(value, index) async {
    list[index] = value;
    await box.write("list", list);
  }
}
