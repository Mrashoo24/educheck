import 'package:educheck/PartnersDboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../FormPage/formfeild.dart';

class VerifySuccess extends StatefulWidget {
 final String phoneNumber;
 final bool userLoggedIn;
 final String userName ;
  const VerifySuccess({Key? key, required this.phoneNumber, required this.userLoggedIn, required this.userName}) : super(key: key);

  @override
  State<VerifySuccess> createState() => _VerifySuccessState();
}

class _VerifySuccessState extends State<VerifySuccess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    // color: Colors.red,
                    width: Get.width * 0.5,

                      child: ClipRRect(child: Image.asset("asset/sticker.png",fit: BoxFit.fill,))
                  ),
                  Text("Verification",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35),),
                  Text("Success",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35),),
                  SizedBox(height: 80,),

                  InkWell(
                    onTap: () {



                widget.userLoggedIn ?
                    Get.to(DashBoard(userName: widget.userName))
                    :       Get.to(RegisterationPage(phoneNumber: widget.phoneNumber,));

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Explore",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),
                        Icon(Icons.arrow_forward_sharp,size: 25,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
