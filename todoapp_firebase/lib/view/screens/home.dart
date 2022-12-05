import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todoapp_firebase/controller/controller.dart';
import 'package:todoapp_firebase/utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? newTask;
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
                        onChanged: ((value) => newTask = value),
                        decoration:
                            InputDecoration(hintText: 'Enter your task?'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        icon: (Icon(Icons.done)),
                        onPressed: () {
                          controller.addTask(newTask);
                        },
                      )
                    ]),
                  ));
                },
                icon: Icon(Icons.add))
          ],
          title: Text('to do app'),
        ),
        body: Obx(
          () => ListView.builder(
            itemBuilder: ((context, index) {
              return Text(controller.list[index]);
            }),
            itemCount: controller.list.length,
          ),
        ),
      ),
    );
  }
}
