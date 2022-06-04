import 'package:educheck/Constants/constant.dart';
import 'package:educheck/LoginSignup/loginscreen.dart';
import 'package:educheck/LoginSignup/verifysuccess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kgreen,
        body: SingleChildScrollView(
          child: Container(height: Get.height,
            child: SingleChildScrollView(
              child: Column
                (children: [
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
                SizedBox(height: 50,),
                Container(
                  height: Get.height*0.7,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20.0,right: 20),
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
                              "Verification",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Enter OTP code sent to your mobile number",
                              style: TextStyle(color: Colors.grey),
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

                            hintText: ("Enter OTP"),
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
                              Get.to(VerifySuccess());
                            },
                            child: Text(
                              'Verify',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),

                        ),
                        SizedBox(height: 40,),
                        InkWell(
                          child: RichText(
                            text: TextSpan(
                              text: "Didn't recieve the code?",style: TextStyle(color:  Colors.grey, ),
                              children:  [
                                TextSpan(text:  " Resend", style: TextStyle(color:kgreen,fontWeight: FontWeight.bold)),

                              ],
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
              ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}