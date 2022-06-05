import 'dart:io';

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
  const RegisterationPage({Key? key}) : super(key: key);

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
      return imageTemporary;
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }


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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ID Proof",
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: (){
                      Get.defaultDialog(
                        title: '',
                        content: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: ElevatedButton(onPressed: (){
                                      _imagePicker(ImageSource.camera);
                                    }, child: Text('SELECT FROM CAMERA',style: TextStyle(color: Colors.black),),
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: ElevatedButton(onPressed: (){
                                      _imagePicker(ImageSource.gallery);
                                    }, child: Text('SELECT FROM GALLERY',style: TextStyle(color: Colors.black),),
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),

                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      );
                    },
                    child: Container(
                      width: Get.width,

                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex:4,
                              child: TextFormField(
                                enabled: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding:
                                  EdgeInsets.only(left: 10, top: 15, bottom: 10),
                              hintText: 'Choose file',
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.transparent)
                              )
                            ),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: Text(
                                image == null ? "No file chosen" : path.basename(image!.path),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pan Card",
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: (){
                      Get.defaultDialog(
                          title: '',
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: ElevatedButton(onPressed: (){
                                        _panimagePicker(ImageSource.camera);
                                      }, child: Text('SELECT FROM CAMERA',style: TextStyle(color: Colors.black),),
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: ElevatedButton(onPressed: (){
                                        _panimagePicker(ImageSource.gallery);
                                      }, child: Text('SELECT FROM GALLERY',style: TextStyle(color: Colors.black),),
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),

                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      );
                    },
                    child: Container(
                      width: Get.width,

                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                              flex:4,
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    contentPadding:
                                    EdgeInsets.only(left: 10, top: 15, bottom: 10),
                                    hintText: 'Choose file',
                                    hintStyle:
                                    TextStyle(color: Colors.black, fontSize: 15),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.transparent)
                                    )
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: Text(
                                panimage == null ? "No file chosen" : path.basename(panimage!.path),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "GST Number(optional)*",
                      )),
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
                        "Have you been reffered to us by someone*",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name*",
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextForm('Enter Name', referName),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Mobile Number*",
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextForm('Enter Number', referNumber),
                  SizedBox(height: 30,),

                  loading ? kprogressbar  :   Container(
                    width: Get.width,
                    height: 50,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kgreen,
                        padding: EdgeInsets.all(6),
                      ),
                      onPressed: () async {
                        print('clicked');
                     if(false) {

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
                              allApi
                                  .getIdRef(number.text)
                                  .then((value) {
                                // Get.offAll(
                                //   UserProfile(),
                                // );
                              });

                              //END Pressed

                            }






                          }


                        }




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
      decoration: InputDecoration(
        fillColor: Colors.grey[50],
        filled: true,
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: ktextcolor)),
        border: InputBorder.none,
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}
