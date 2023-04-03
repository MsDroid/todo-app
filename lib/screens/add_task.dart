import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';

Widget addTaskmodal() {

  var controller = Get.find<TaskController>();
  final _formKey = GlobalKey<FormState>();

  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    elevation: 16,
    child: SizedBox(
      width: 12,
      height: 380,
      child: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              'Add Task',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                    controller: controller.taskNameController,
                    style: const TextStyle(
                      fontSize: 16,

                    ),

                    decoration: InputDecoration(
                      focusColor: Colors.white,


                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,



                      //create lable
                      labelText: 'Title',
                      //lable style
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter details';
                      }
                      return null;
                    },
                    controller: controller.taskDescController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: InputDecoration(


                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.blue),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      //create lable
                      labelText: 'Description',
                      //lable style
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.isLoading.value ? const CircularProgressIndicator() : ElevatedButton(
                    onPressed: () async {

                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.isLoading.value = true;
                        var res = await controller.addTask();
                        if(res){
                          print(res);
                          controller.isLoading.value = false;
                          Get.snackbar('Success', 'Task Added',snackPosition: SnackPosition.TOP,);
                        }else{
                          print('failed');
                          Get.snackbar('Failed', 'Please try again !',snackPosition: SnackPosition.TOP,);
                          controller.isLoading.value = false;
                        }
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
