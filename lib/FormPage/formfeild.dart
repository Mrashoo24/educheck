import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/constant.dart';



class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? selectedValue;
  List<String> items = [
    "Application type",
    "Gold partner",
    "Priority partner",
    "Prime partner",
    "Connect partner",
    "Candidate",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: AssetImage("asset/logo.png"),
                ),
                SizedBox(
                  height: 15,
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
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:ktextcolor)),

                    border: InputBorder.none,

                    hintText: ("Name"),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
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
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:ktextcolor)),

                    border: InputBorder.none,

                    hintText: ("Mobile Number"),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),

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
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:ktextcolor)),

                    border: InputBorder.none,

                    hintText: ("Email"),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
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
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:ktextcolor)),

                    border: InputBorder.none,

                    hintText: ("Address"),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
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
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:ktextcolor)),

                    border: InputBorder.none,

                    hintText: ("Enter Pin Code"),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
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
                Container(
                  width: Get.width,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: Row(
                    children: [

                      Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding: EdgeInsets.only(left: 10, top: 15, bottom: 10),
                              hintText: 'Choose file',
                              hintStyle: TextStyle(color: Colors.black, fontSize: 15),),)),
                      SizedBox(width: 10,),
                      InkWell(onTap: () {

                      },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 100.0),
                          child: Expanded(
                              child: Text("No file chosen",style: TextStyle(fontSize: 15),)),
                        ),
                      )
                    ],
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
                Container(
                  width: Get.width,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: Row(
                    children: [

                      Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding: EdgeInsets.only(left: 10, top: 15, bottom: 10),
                              hintText: 'Choose file',
                              hintStyle: TextStyle(color: Colors.black, fontSize: 15),),)),
                      SizedBox(width: 10,),
                      InkWell(onTap: () {

                      },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 100.0),
                          child: Expanded(
                              child: Text("No file Chosen",style: TextStyle(fontSize: 15),)),
                        ),
                      )
                    ],
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
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:ktextcolor)),

                    border: InputBorder.none,

                    hintText: ("Number"),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Have you been reffered to someone*",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:ktextcolor)),

                    border: InputBorder.none,

                    hintText: ("Name"),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Number*",

                    )),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:ktextcolor)),

                    border: InputBorder.none,

                    hintText: ("Number"),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}