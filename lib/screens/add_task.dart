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
      height: 400,
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
                    controller: controller.taskNameController,
                    style: const TextStyle(
                      fontSize: 16,

                    ),

                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      errorText: "Please enter task name.",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,

                      hintText: "please enter task name",

                      //create lable
                      labelText: 'Task Name',
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
                    controller: controller.taskDescController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: InputDecoration(
                      errorText: "Please enter task details.",

                      hintText: "please enter details",
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.isLoading.value = true;
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
