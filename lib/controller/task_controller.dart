import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{
  var isChecked = false.obs;
  List checkedArr  = [].obs;
  var isLoading = false.obs;
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();

  //checked task
  checkedTask(i){
    if(checkedArr.contains(i)){
      checkedArr.remove(i);
    }else {
      checkedArr.add(i);
    }
  }

//  add task
addTask(){
    print(taskNameController.text);
    return false;
}


}