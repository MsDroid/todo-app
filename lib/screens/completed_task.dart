import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';

class CompletedTasts extends StatelessWidget {
  const CompletedTasts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<TaskController>();
    var screenSize = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        title : const Text('Completed Tasks'),
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor : controller.checkedArr.contains(index) ? Colors.green : Colors.grey,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: const Icon(Icons.task_outlined,color: Colors.blue,),
                title: const Text('Go to school'),
                subtitle: const Text('This is task one'),
                trailing: Obx(() =>
                    Checkbox(
                      onChanged: (val){
                        controller.checkedTask(index);
                      },
                      value: controller.checkedArr.contains(index) ? true : false,
                    ),
                ),
              ),
            );
          }
      ),

    );
  }
}
