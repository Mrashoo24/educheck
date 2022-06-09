import 'package:educheck/Constants/constant.dart';
import 'package:educheck/FormPage/formfeild.dart';
import 'package:educheck/Model/userModel.dart';
import 'package:educheck/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginSignup/loginscreen.dart';
import 'PartnerPerformance/partnerperformance.dart';
import 'PartnersDboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:   FutureBuilder<List>(
        future: Future.wait([SharedPreferences.getInstance()]),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return kprogressbar;
          }

         List a = snapshot.requireData;

          bool? loggedin = a[0].getBool('isLoggedInKey');




          return  loggedin != null  ? FutureBuilder<List<UserModel>>(
            future: AllApi().getLocalUsers(),
            builder: (context, usersnapshot) {
              if(!usersnapshot.hasData){
                return kprogressbar;
              }
              UserModel users = usersnapshot.requireData[1];
              return DashBoard(userName: users.user_name!);
            }
          )
              :LoginScreen();
        }
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
