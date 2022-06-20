

import 'package:get/get.dart';

class CounterController extends GetxController {

  var count = 0.obs;

  increment() {
    if(count.value < 10){
      if(Get.isDarkMode){
        count.value +=2;
      }else{
        count.value++;
      }
    }
  }

  decrement() {
    if(count.value > 0){
      if(Get.isDarkMode){
        count.value -=2;
      }else{
        count.value--;
      }
    }
  }

}