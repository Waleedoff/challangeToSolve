import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp_firebase/controller/controller.dart';
import 'package:todoapp_firebase/utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? taskCnt;

    // final TextEditingController takscontroller = TextEditingController();
    // var taskController = TextEditingController();

    final controller = Get.put(TaskTodoList());
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
            itemBuilder: ((context, index) {
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
                          child: Text(
                            controller.list[index],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.bottomSheet(Container(
                              height: 300,
                              color: Colors.white,
                              child: Column(children: [
                                TextField(
                                  onChanged: (value) {
                                    taskCnt = value;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'Enter your task?'),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                IconButton(
                                  icon: (const Icon(Icons.done)),
                                  onPressed: () {
                                    controller.addTask(taskCnt);
                                    Get.back();
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
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete))
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
}
