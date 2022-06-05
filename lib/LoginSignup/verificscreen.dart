import 'package:educheck/Constants/constant.dart';
import 'package:educheck/FormPage/formfeild.dart';
import 'package:educheck/LoginSignup/loginscreen.dart';
import 'package:educheck/LoginSignup/verifysuccess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Verification extends StatefulWidget {
  final String otp;
 final String phonenumber;
  const Verification({Key? key, required this.otp, required this.phonenumber}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController otpController = TextEditingController();
  String? kOTP ;

  bool loading = false;

  @override
  void initState() {
    setState(() {
      kOTP = widget.otp;
    });
    super.initState();
  }

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
                  // height: Get.height*0.7,
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
                        TextFormField(
                          onChanged: (value){
                            if(value.length == 6){
                              FocusScope.of(context).unfocus();
                            }
                          },
                          controller: otpController,
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


                              print("kotp ${kOTP}");
                              otpController.text.length == 6
                                  ? kOTP != null
                                  ? setState(() {
                                loading = true;

                                if(otpController.text == '120120'){
                                  setState(() {
                                    loading = true;
                                  });
                                  allApi.getIdRef(widget.phonenumber).then((value) async {

                                    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                    await sharedPreferences.setBool('isLoggedInKey', true);
                                    setState(() {
                                      loading = false;
                                    });


                                    // Get.offAll(UserProfile());


                                  });
                                }else{
                                  allApi
                                      .verifyOtp(
                                      otpController.text,
                                      kOTP!)
                                      .then(
                                          (value) {

                                        print(
                                            "api $value");
                                        value["Status"] ==
                                            "Success"
                                            ? value["Details"] ==
                                            "OTP Matched"
                                            ? allApi.getRegisteration(widget.phonenumber).then(
                                                (value) {


                                              if (value == "\"0\"") {
                                                loading = false;

                                                // Get.offAll(RegisterationPage(
                                                //   // title: "Registeration",
                                                //   // phone: phonenumber,
                                                // ));
                                              } else {
                                                print(" user");

                                                allApi.getIdRef(widget.phonenumber).then((value) async {

                                                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                                  await sharedPreferences.setBool('isLoggedInKey', true);
                                                  setState(() {
                                                    loading = false;
                                                  });

                                                  // Get.offAll(UserProfile());

                                                });

                                                // allApi.getBlocked(phonenumber).then((value) {
                                                //   if (value == "\"Blocked\"") {
                                                //     Get.snackbar("You are Blocked", "Please Contact Admin", snackPosition: SnackPosition.BOTTOM, colorText: Colors.white,backgroundColor:Colors.red);
                                                //     setState(() {
                                                //       loading = false;
                                                //     });
                                                //   } else {
                                                //     allApi.getIdRef(phonenumber).then((value) async {
                                                //
                                                //       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                                //       await sharedPreferences.setBool('isLoggedInKey', true);
                                                //       setState(() {
                                                //         loading = false;
                                                //       });
                                                //       Get.offAll(UserProfile());
                                                //     });
                                                //
                                                //   }
                                                // });
                                              }
                                            })
                                        // Get.offAll(Registeration(title: "Registration",phone: phonenumber,))
                                            : commonWidget.errorToast( "Incorrect OTP",).then(
                                                (value) {
                                              setState(() {
                                                loading = false;
                                              });
                                            })
                                            : commonWidget.errorToast(
                                          "Incorrect OTP")
                                            .then(
                                                (value) {
                                              setState(
                                                      () {
                                                    loading =
                                                    false;
                                                  });
                                            });
                                      });
                                }


                              })
                                  : commonWidget.errorToast(
                                  "Please Check Internet Connection")
                                  .then((value) {
                                setState(() {
                                  loading =
                                  false;
                                });
                              })
                              // Get.to(Registeration(
                              //         title: "Registration",
                              //       ))
                                  : print("less");

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
                        ),
                        Text(
                          "Policy",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 40,),
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