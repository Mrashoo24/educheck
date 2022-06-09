import 'dart:io';

import 'package:educheck/PartnersDboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../Constants/constant.dart';
import '../Model/userModel.dart';

class RegisterationPage extends StatefulWidget {
  final String phoneNumber ;
  const RegisterationPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}


class _RegisterationPageState extends State<RegisterationPage> {
  String? selectedValue;

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController gst = TextEditingController();
  TextEditingController referName = TextEditingController();
  TextEditingController referNumber = TextEditingController();

  String selectedType = "Application type";

  List<String> items = [
    "Application type",
    "Gold partner",
    "Priority partner",
    "Prime partner",
    "Connect partner",
    "Candidate",
  ];
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  File? image;
  File? panimage;

  Future _imagePicker(type) async {
    try {
      final image = await ImagePicker().pickImage(source: type);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
      Get.back();

      return imageTemporary;
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  Future _panimagePicker(type) async {
    try {
      final image = await ImagePicker().pickImage(source: type);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() {
        panimage = imageTemporary;
      });
      Get.back();
      return imageTemporary;
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  @override
  void initState() {
    setState(() {
      number = TextEditingController(text: widget.phoneNumber);
    });
    super.initState();
  }

  var _value = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(

                children: [
                  Image(
                    image: AssetImage("asset/logo.png"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: 'Select Application Type' ,
                        onConfirm: (){
                            Get.back();

                        },
                          textConfirm: 'OK',
                          confirmTextColor: Colors.white,
                          buttonColor: kgreen,
                          content: StatefulBuilder(

                            builder: (context, state1) {
                              return  Column(
                                children: items
                                    .map((e) =>

                                e == 'Application type' ? SizedBox() :  RadioListTile<String>(
                                  activeColor: kgreen,
                                  title: Text(e),
                                        value: e,
                                        groupValue: selectedType,
                                        onChanged: (String? value) {
                                          state1(() {
                                            selectedType = value!;
                                          });
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        }))
                                    .toList(),
                              );
                            }
                          ));
                    },
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[50],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ktextcolor)),
                        border: InputBorder.none,
                        hintText: selectedType,
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),

                  // Container(
                  //   height: 46,
                  //   width: Get.width,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(width: 1, color: Colors.grey),
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //
                  //   child: DropdownButtonFormField(
                  //     decoration: InputDecoration(
                  //       fillColor: Colors.white,
                  //     ),
                  //     items: items
                  //         .map((item) => DropdownMenuItem<String>(
                  //       value: item,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 10.0),
                  //         child: Text(
                  //           item,
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 18,
                  //           ),
                  //         ),
                  //       ),
                  //     ))
                  //         .toList(),
                  //     value: selectedValue,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         selectedValue = value as String;
                  //       });
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Name *",
                  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  //     )),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextForm('Name', name),
                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Mobile number *",
                  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  //     )),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextForm('Mobile Number', number),

                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Email*",
                  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  //     )),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextForm('Email', email),
                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Address*",
                  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  //     )),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextForm('Address', address),
                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Pincode*",
                  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  //     )),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextForm('Enter Pin Code', pincode),
                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "ID Proof",
                  //     )),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: (){
                      Get.defaultDialog(
                          title: 'SELECT IMAGE',
                          titleStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),
                          content:
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap:(){
                                        _imagePicker(ImageSource.camera);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            Icon(CupertinoIcons.camera_fill,size: 16,),
                                            SizedBox(width: 15,),
                                            Text('Take from camera',style: TextStyle(color: Colors.black,fontSize: 16),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap:(){
                                        _imagePicker(ImageSource.gallery);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            Icon(CupertinoIcons.photo_fill_on_rectangle_fill,size: 16,),
                                            SizedBox(width: 15,),
                                            Text('Upload from gallery',style: TextStyle(color: Colors.black,fontSize: 16),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      );
                    },
                    child:  TextFormField(
                  decoration: InputDecoration(
                  fillColor: Colors.grey[50],
                    filled: true,counterText: "",
                    enabled: false,
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: ktextcolor)),
                    border: InputBorder.none,
                    hintText:      image == null ? "Upload Id proof" : path.basename(image!.path),

                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Pan Card",
                  //     )),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: (){
                      Get.defaultDialog(
                          titleStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),
                          title: 'SELECT IMAGE',
                          content:
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap:(){
                      _panimagePicker(ImageSource.camera);
                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            Icon(CupertinoIcons.camera_fill,size: 16,),
                                            SizedBox(width: 15,),
                                            Text('Take from camera',style: TextStyle(color: Colors.black,fontSize: 16),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap:(){
                                        _panimagePicker(ImageSource.gallery);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            Icon(CupertinoIcons.photo_fill_on_rectangle_fill,size: 16,),
                                            SizedBox(width: 15,),
                                            Text('Upload from gallery',style: TextStyle(color: Colors.black,fontSize: 16),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      );
                    },
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey[50],
                        filled: true,counterText: "",
                        enabled: false,
                        focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: ktextcolor)),
                        border: InputBorder.none,
                        hintText:      panimage == null ? "Upload Pan card" : path.basename(panimage!.path),

                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "GST Number(optional)*",
                  //     )),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextForm('GST Number', gst),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Have you been reffered to us by someone ?",
                        style:
                            TextStyle(fontSize: 15),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Name*",
                  //
                  Row(
                    children: [
                      Radio(
                          activeColor: kgreen ,
                          value: 1, groupValue: _value, onChanged: (value){
                        setState(() {
                          _value = 1;
                        });
                      }),
                      Text("Yes")
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          activeColor: kgreen ,

                          value: 2, groupValue: _value, onChanged: (va){
                        setState(() {
                          _value = 2;
                        });
                      }),
                      Text("No")
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                      visible: _value == 1,
                      child: buildTextForm('Enter Name', referName)),

                  SizedBox(
                    height: 10,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Mobile Number*",
                  //     )),
                  SizedBox(
                    height: 5,
                  ),

                  Visibility(
                    visible: _value == 1,
                    child: buildTextForm('Enter Number', referNumber),),

                  SizedBox(height: 30,),

                  loading ? kprogressbar  :   Container(
                    width: Get.width,
                    height: 50,

                    child:

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kgreen,
                        padding: EdgeInsets.all(6),
                      ),
                      onPressed: () async {
                        print('clicked');
                     if(_formKey.currentState!.validate() || image == null || panimage == null) {

                     }   else{

                          if(name.text.length <5){
                            Get.snackbar(
                                "Error", "Name Should be Greater than 4 letters",
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,backgroundColor:Colors.red
                            );

                            setState(() {
                              loading = false;
                            });
                          }else{



                            setState(() {
                              loading = true;
                            });

                            //Checking Referral
                            var dataRefer = await allApi.getAllRefer(referName.text);

                            print('datarefe = $dataRefer');
                            ///Todo
                            // var data = await allApi.getUsersbyRefer(referName.text);


                            if(referName.text.trim().isNotEmpty){

                              if(dataRefer =='No Data'){
                                Get.snackbar(
                                    "Error", "Referral Code Not Found",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,backgroundColor:Colors.red
                                );
                                setState(() {
                                  loading = false;
                                });

                              }else{


                                // UserModel referredUser = data;


                                var refercode = name.text.substring(1,4)+number.text.substring(4,8);

                                await allApi.registerUser(
                                  UserModel(
                                    user_name: name.text,
                                    user_email: email.text,
                                    user_gender_id: '',
                                    user_pincode_id: pincode.text,
                                    user_application_type: selectedType,
                                    user_age_id: '',
                                    user_mo_num: number.text,
                                    user_url: '',
                                    Operating_sys: Platform.isAndroid
                                        ? "Android"
                                        : "IOS",
                                    Screen_size_id:
                                    Get.size.longestSide.toString(),
                                    Screen_reso_id:
                                    Get.size.aspectRatio.toString(),
                                    user_refer_id:refercode,
                                    reference_id: number.text,

                                    user_address: address.text,
                                    referralNumber: referNumber.text,
                                    gst: gst.text,
                                    pancard: path.basename(panimage!.path),
                                    referralName: referName.text,
                                    idproof:path.basename(image!.path),
                                  ),
                                );
                                setState(() {
                                  loading = false;
                                });
                                allApi
                                    .getIdRef(number.text)
                                    .then((value) {

                                  // Get.offAll(
                                  //   UserProfile(),
                                  // );


                                });


                              }


                            }else{

                              print('second');

                              // UserModel referredUser = data;

                              // var uuid = Uuid();
                              // var newUid =
                              // uuid.v1().toString().split("-");
                              // var newUid1 = newUid[0] +
                              //     widget.phone.substring(6, 10);
                              // print("uuid = $newUid1");
                              var refercode = name.text.substring(1,4)+number.text.substring(4,8);

                              await allApi.registerUser(
                                UserModel(
                                  user_name: name.text,
                                  user_email: email.text,
                                  user_gender_id: '',
                                  user_pincode_id: pincode.text,
                                  user_application_type: selectedType,
                                  user_age_id: '',
                                  user_mo_num: number.text,
                                  user_url: '',
                                  Operating_sys: Platform.isAndroid
                                      ? "Android"
                                      : "IOS",
                                  Screen_size_id:
                                  Get.size.longestSide.toString(),
                                  Screen_reso_id:
                                  Get.size.aspectRatio.toString(),
                                  user_refer_id:refercode,
                                  reference_id: number.text,

                                  user_address: address.text,
                                  referralNumber: referNumber.text,
                                  gst: gst.text,
                                  pancard: path.basename(panimage!.path),
                                  referralName: referName.text,
                                  idproof:path.basename(image!.path),
                                ),
                              );
                              setState(() {
                                loading = false;
                              });
                              // allApi
                              //     .getIdRef(number.text)
                              //     .then((value) {
                                Get.to(
                                  DashBoard(userName:name.text),
                                );
                              // }


                              //END Pressed

                            }



                          }


                        }




                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),



                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildTextForm(title, controller) {
    return TextFormField(
      controller: controller,
      enabled: title == 'Mobile Number'  ? false : true,
      keyboardType: title == 'Enter Pin Code' || title == 'Enter Number' ? TextInputType.number : TextInputType.text,
      maxLength: title == 'Enter Pin Code' ? 6 :  title == 'Enter Number' ? 10 : 30,
      decoration: InputDecoration(
        fillColor: Colors.grey[50],
        filled: true,counterText: "",
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: ktextcolor)),
        border: InputBorder.none,
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.all(10),
      ),
      validator: (value){
        if(title == 'Enter Name' || title == 'Enter Number'){
          return null;
        }else{
          if(value!.isEmpty){
            return 'Field is mandatory';
          }
        }
      },
    );
  }
}
