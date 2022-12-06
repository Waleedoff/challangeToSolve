// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp_firebase/controller/controller.dart';
import 'package:todoapp_firebase/utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? taskCnt;

    String? updateTask;
    int? index;

    String? updateValue;

    // final TextEditingController takscontroller = TextEditingController();
    var controller001 = TextEditingController();

    final controller = Get.put(TaskTodoList());
    print('list');
    print(controller.box.read("list"));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blackColor,
          actions: [
            IconButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  height: 300,
                  color: Colors.white,
                  child: Column(children: [
                    TextField(
                      controller: controller001,
                      onChanged: (value) {
                        taskCnt = value;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Enter your task?'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      icon: (const Icon(Icons.done)),
                      onPressed: () {
                        controller.addTask(taskCnt);
                        print(controller.box.read("list"));
                        final Task = controller001.text;
                        createTask(Task: Task);
                        Get.back();
                      },
                    )
                  ]),
                ));
              },
              icon: const Icon(Icons.add),
            ),
          ],
          title: const Text('to do app'),
        ),
        body: Obx(
          () => ListView.builder(
            itemBuilder: ((context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 50,
                  child: Card(
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          width: 310,
                          child: Text(controller.box.read("list")[index]),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.bottomSheet(Container(
                              height: 300,
                              color: Colors.white,
                              child: Column(children: [
                                TextField(
                                  // onChanged: (value) {
                                  //   updateTask = value;
                                  // },
                                  decoration: const InputDecoration(
                                      hintText: 'Enter your daily task?'),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                IconButton(
                                  icon: (const Icon(Icons.done)),
                                  onPressed: () {
                                    controller.editTask(updateTask, index);

                                    Get.back();
                                    Get.snackbar('Task Added',
                                        '${controller.list[index]}',
                                        backgroundColor: blackColor,
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM);
                                  },
                                )
                              ]),
                            ));
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 18,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.deletTask(index);
                              // controller.box.remove('list');
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                ),
              );
            }),
            itemCount: controller.list.length,
          ),
        ),
      ),
    );
  }

  Future createTask({required String Task}) async {
    final docTask = FirebaseFirestore.instance.collection('Task').doc();
    final json = {
      'Task': Task,
      'id': 12,
    };
    await docTask.set(json);
  }
}
