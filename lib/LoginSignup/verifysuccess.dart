import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifySuccess extends StatefulWidget {
  const VerifySuccess({Key? key}) : super(key: key);

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
                  Image.asset("asset/sticker.png"),
                  Text("Verification",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35),),
                  Text("Success",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35),),
                  SizedBox(height: 80,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Explore",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),
                      Icon(Icons.arrow_forward_sharp,size: 25,),
                    ],
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
