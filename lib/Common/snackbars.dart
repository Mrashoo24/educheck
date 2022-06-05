import 'package:educheck/Constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonWidgets{
  errorToast(title){
    Fluttertoast.showToast(msg: title,backgroundColor:Colors.red,textColor: Colors.white);
  }
}