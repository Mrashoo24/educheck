import 'package:educheck/LoginSignup/verificscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: kgreen,
        body: SingleChildScrollView(
          child: Container(

            child: SingleChildScrollView(
              child: Column(
                  children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage("asset/batch.png"),
                    ),

                    Padding(
                      padding:   EdgeInsets.only(top: 70),
                      child: Image(
                        image: AssetImage("asset/pad.png"),
                      ),
                    ),
                  ],
                ),
                // Stack(
                //     children: [
                //       Container(
                //           height: 100,
                //           child: Image.asset("asset/crosslinb.png")),
                //       Padding(
                //         padding:   EdgeInsets.all(8.0),
                //         child: Image.asset("asset/crosslina.png"),
                //       ),
                //
                //     ]
                // ),////line
                ///cross lineimages
                SizedBox(height: 50,),
                Container(
                  height: Get.height*0.7,
                  child: Padding(
                    padding:   EdgeInsets.only(left: 20.0,right: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Image(
                          image: AssetImage("asset/logo.png"),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [

                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "or",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Singup",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text(
                              "We will send One Time Password to this mobile phone",
                              style: TextStyle(color: Colors.grey ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey[50],
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:ktextcolor)),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              //   borderSide: BorderSide(color: ktextcolor),
                              //
                              // ),
                              border: InputBorder.none,

                              hintText: ("Mobile number"),
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: Get.width,
                          height: 50,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kgreen,
                              padding: EdgeInsets.all(6),
                            ),
                            onPressed: () {
                              print('clicked');
                              Get.to(Verification());
                            },
                            child: Text(
                              'Get Otp',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),

                        ),
                        SizedBox(height: 40,),
                        Text(
                          "By continuing, I agree to the Terms of Use & Privacy",
                          style: TextStyle(color: Colors.grey),
                        ),Text(
                          "Policy",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22),
                          topLeft: Radius.circular(22))),
                )
              ]),
            ),
          ),
        ),
      ),
    );;
  }
}
