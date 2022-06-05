import 'package:educheck/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/constant.dart';
import '../Model/userModel.dart';

class DashBoard extends StatefulWidget {
 final String userName ;
  const DashBoard({Key? key, required this.userName}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  Widget Category(string){
    return InkWell(

      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 30,

        child: Padding(
          padding:   EdgeInsets.only(left: 8,right: 8),
          child: Center(
              child: Text(
                string,
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
              )),
        ),
        decoration: BoxDecoration(
          // border: Border.all(width: 1, color: ktextcolor),
          color: ktextcolor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget Singelproduct(string,strings) {

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(

        width: 150,
      //   decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(5),
      //   border: Border.all(width: 1, color: Colors.grey),
      // ),
        child: Padding(
          padding:   EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(

                children: [
                  Icon(Icons.calendar_today_outlined,color: Colors.orange,),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "12.dec",
                    style: TextStyle(fontSize: 15, color: Colors.orange),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        string,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(strings),
                    ],
                  ),
                ],
              ),
SizedBox(height: 10),
              Text(
                "Level up your skill in accounting"
                    "Desing to help your carrer and increase your marketabilty to emplyes",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }








  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title:Image.asset("asset/logo.png"),
          actions: [
            // Image.asset("asset/logo.png"),
            Icon(Icons.menu,color: Colors.black,size: 40,),
            SizedBox(width: 20,)

          ],

          elevation: 0,
        ),
        bottomNavigationBar : BottomNavigationBar(
          items:   <BottomNavigationBarItem>[
            // BottomNavigationBarItem(
            //   icon:Image.asset("asset/bhome.png"),
            //   label: 'Home',
            //   backgroundColor: Colors.white,
            // ),
            BottomNavigationBarItem(
              icon: Image.asset("asset/bhome.png"),
              label: '',
              backgroundColor: Colors.green,
            ),

            BottomNavigationBarItem(
              icon:Image.asset("asset/bhome.png"),
              label: 'School',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon:Image.asset("asset/bhome.png"),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],

        ),
        body: FutureBuilder<List<UserModel>>(
          future: AllApi().getLocalUsers(),
          builder: (context, snapshot) {


            if(!snapshot.hasData){
              return kprogressbar;
            }
            var doc = snapshot.requireData;
            return SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(left: 15,right: 15,top: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 10,right: 10),
                      child: Container(
                        width: Get.width,
                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children:[ CircleAvatar(
                                radius: 25,
                                child: ClipRect(
                                  child: Image.asset('asset/profilepic.png',width: 50,fit: BoxFit.fill,),
                                ),
                              ),
                              Padding(
                                padding:   EdgeInsets.only(top: 38,left: 30),
                                child: CircleAvatar(radius: 8,backgroundColor: kgreen),
                              )
                              ]
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hey ${widget.userName}",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Row(

                                  children: [
                                    Text(
                                      "Let's Explore",
                                      style: TextStyle(fontSize: 12),
                                    ),SizedBox(width: 50,),
                                    Icon(Icons.star,color: Colors.orange,size: 40,),
                                    Icon(Icons.star,color: Colors.orange,size: 40,),
                                    Icon(Icons.star,color: Colors.orange,size: 40,)

                                  ],
                                ),


                              ],
                            ),
                            // Icon(Icons.star,color: Colors.deepOrangeAccent,size: 40,),
                            // Icon(Icons.star,color: Colors.deepOrangeAccent,size: 40,),
                            // Icon(Icons.star,color: Colors.deepOrangeAccent,size: 40,)



                            // Image(image: AssetImage("asset/Group 10787.png"))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upcoming assessments",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),

                        InkWell(
                          onTap: () {},
                          child: Text(
                            "View All",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 30,
                                width: 50,
                                child: Center(
                                    child: Text(
                                      "ALL",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                decoration: BoxDecoration(
                                  color: kgreen,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Category('Categoty 1'),
                            Category('Categoty 2'),
                            Category('Categoty 3'),
                            Category('Categoty 4'),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,

                      child: Row(

                        children: [
                          Singelproduct("Accounting",''),
                          SizedBox(width: 5,),
                          Singelproduct("Management",''),SizedBox(width: 5,),
                          Singelproduct("School",''),SizedBox(width: 5,),
                          // Singelproduct("Accounting"),
                          // SizedBox(width: 5,),
                          // Singelproduct("Management"),SizedBox(width: 5,),
                          // Singelproduct("Accounting"),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Partner",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 15,
                                ),
                              ),
                            ),


                          ],
                        ),
                        Text("Network"),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 30,
                              width: 50,
                              child: Center(
                                  child: Text(
                                    "ALL",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              decoration: BoxDecoration(
                                color: kgreen,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Category('Gold'),
                          Category('Prime'),
                          Category('Connected'),
                          Category('Candidate'),


                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,

                      child: Row(

                        children: [
                          Ratecards("ABC & Co","Prime"),
                          SizedBox(width: 5,),

                          Ratecards("XYZ & Co","Connect"),
                          SizedBox(width: 5,),

                          Ratecards("ABC & Co","Connect"),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    Padding(
                      padding:   EdgeInsets.only(left: 30,right: 30),
                      child: Container(
                        width: Get.width,


                        child: Padding(
                          padding:  EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 25),
                                    child: Text(
                                      "Total Partners: ",
                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "1364",
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Theme(
                                data : Theme.of(context).copyWith(
                                  dividerColor:  ktextcolor
                                ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,

                                    child: DataTable(columns:[
                              DataColumn(label: Text("Partners"),),
                              DataColumn(label: Text("Total"),),
                              DataColumn(label: Text("Total"),),



                            ],
                            rows: [
                              DataRow(cells: [
                              DataCell(Text("Prime Partner")),
                              DataCell(Text("15")),
                              DataCell(Text("")),
                              ]),
                              DataRow(cells: [
                              DataCell(Text("Connect Partner")),
                              DataCell(Text("300")),
                              DataCell(Text("")),
                              ]),
                              DataRow(cells: [
                              DataCell(Text("Assessments")),
                              DataCell(Text("500")),
                              DataCell(Text("300")),
                              ]),
                              DataRow(cells: [
                              DataCell(Text("Assessments")),
                              DataCell(Text("500")),
                              DataCell(Text("300")),
                              ])
                            ],),
                                  ),
                              ),

                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          // border: Border.all(width: 1, color: ktextcolor),
                          color: ktextcolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),


                    SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "Exclusive",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text("Offers"),
                            SizedBox(height: 10,),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 30,
                                      width: 50,
                                      child: Center(
                                          child: Text(
                                            "ALL",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                      decoration: BoxDecoration(
                                        color: kgreen,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Category('Exclusive'),
                                  Category('Ongoing'),
                                  Category('Limited'),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Singelproduct("Keychain","Metal"),
                          SizedBox(width: 5,),
                          Singelproduct("Keychain","Leather"),SizedBox(width: 5,),

                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Text(
                          "Available Point Balance: ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),

                        Text(
                          "3,43200",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),


                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Card Ratecards(string,strings) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(

                      width: 150,
                      //   decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(5),
                      //   border: Border.all(width: 1, color: Colors.grey),
                      // ),
                      child: Padding(
                        padding:   EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(

                              children: [
                                Icon(Icons.calendar_today_outlined,color: Colors.orange,),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "12.dec",
                                  style: TextStyle(fontSize: 15, color: Colors.orange),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      string,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(strings),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.orange,size: 20,),
                                        Icon(Icons.star,color: Colors.orange,size: 20,),
                                        Icon(Icons.star,color: Colors.orange,size: 20,),
                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                            Text(
                              "Level up your skill in accounting"
                                  "Desing to help your carrer and increase your marketabilty to emplyes",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
    );
  }
}