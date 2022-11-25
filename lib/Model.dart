import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Model extends GetxController {
  List<int> mrp = [
    170,
    150,
    30,
    200,
    40,
    140,
    200,
    20,
    30,
    100,
  ];
  RxList<bool> c1 = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  List<String> Item = [
    "Burgger",
    "Chole",
    "Dabeli",
    "Dosa",
    "Panipuri",
    "Pavbhaji",
    "Pizza",
    "Samosa",
    "Vadapav",
    "Sendvich",
  ];
  List<String> foodimage = [
    "image/burger.jpg",
    "image/chole.jpg",
    "image/Dabeli-recipe.jpg",
    "image/Masala-Dosa.jpg",
    "image/Pani-Puri-Chaat.jpg",
    "image/pavbhaji.jpg",
    "image/pizza.jpg",
    "image/samosa.jpg",
    "image/vadapav.jpg",
    "image/veg-grilled.jpg",
  ];

  int a = 0;
  RxInt sum = 0.obs;

  void calc(bool b, int index) {
    if (b == false) {
      sum.value = sum.value + mrp[index];
      print(sum);
      c1[index] = true;
      print("tr=${c1[index]}");
    } else {
      sum.value = sum.value - mrp[index];
      print("min=${sum.value}");
      c1[index] = false;
      print("fl=${c1[index]}");
    }
  }

  void show_toaset() {
    if (sum.value != 0) {
      print("This is not possible");
       Fluttertoast.showToast(
        msg: "Please Select Your Item...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.black,
      );
    } else {
      sum.value = 0;
       Fluttertoast.showToast(
        msg: "Your Order Is Conform\nPlease Wait For Some Time...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIosWeb: 1,
        backgroundColor: Colors.pink,
        textColor: Colors.black,
      );
    }
  }
}
/* Fluttertoast.showToast(
          msg: "Your Order Is Conform\nPlease Wait For Some Time...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.white60,
          textColor: Colors.black,
          fontSize: 16.0);*/
/*
      Fluttertoast.showToast(
          msg: "Please Select Your Item...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.white60,
          textColor: Colors.black,
          fontSize: 16.0);

 */
