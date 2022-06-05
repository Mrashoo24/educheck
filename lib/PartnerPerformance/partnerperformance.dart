import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartnerPerform extends StatefulWidget {
  const PartnerPerform({Key? key}) : super(key: key);

  @override
  _PartnerPerformState createState() => _PartnerPerformState();
}

class _PartnerPerformState extends State<PartnerPerform> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

child: Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.white,
    actions: [Image.asset("asset/logo.png"),
    Icon(Icons.chevron_right,color: Colors.black,),

    ],

  elevation: 0,
  ),

),
    );
  }
}
