import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/screens/add_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(TaskController());
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title : const Text('To Do List'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return addTaskmodal();
                  },
                );
              },
                child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
          itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1),
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
      bottomSheet: ElevatedButton(

        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size.fromHeight(50),
        ),
        onPressed: (){},
        child: Text('Complete',style: TextStyle(
          fontSize: screenSize.width * 0.05,
        ),),
      ),
    );
  }
}
