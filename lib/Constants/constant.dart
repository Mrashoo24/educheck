import 'dart:ui';

import 'package:flutter/material.dart';

import '../Common/snackbars.dart';
import '../api.dart';

var kgreen = Color(0xFFE7ED957);
var ktextcolor = Color(0xFFEAEBED);

var korange = Color(0xFFA500);


const smsApikey = "fda7bc0b-20f9-11e7-929b-00163ef91450";

var allApi = AllApi();
var commonWidget = CommonWidgets();

var kprogressbar = Center(child: CircularProgressIndicator(),);

var conurl =
    "https://ap-south-1.aws.data.mongodb-api.com/app/application-0-efugx/endpoint/";
