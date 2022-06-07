import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants/constant.dart';
import 'Model/userModel.dart';

class AllApi {
  Future<dynamic> sendOtp(String phone) async {

    var url = Uri.parse(
        "https://2factor.in/API/V1/$smsApikey/SMS/+91$phone/AUTOGEN/educheck_otp"
    );

    var response = await http.get(url);

    // response.body.substring(23, 47);

    if (response.statusCode == 200) {
      print("LOGIN RESPONSE ${response.body}");

      if (response.body != "") {
        var list = json.decode(response.body);

        print("response ${list["Details"]}");

        return list;
      } else {
        commonWidget.errorToast("Something Went Wrong Error:${response.statusCode}" );

      }
    }
  }

  Future<dynamic> verifyOtp(String otp, String session) async {
    var url = Uri.parse(
        "https://2factor.in/API/V1/$smsApikey/SMS/VERIFY/$session/$otp");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("OTP RESPONSE ${response.body}");

      if (response.body != "") {
        var list = json.decode(response.body);

        print("otp response ${list["Details"]}");

        return list;
      } else {
        print("OTP RESPONSE Failed ${response.statusCode}");
        // Fluttertoast.showToast(
        //     msg: "Something Went Wrong Error:${response.statusCode}");
        return "Error ${response.statusCode} ${response.body}";
      }
    } else {
      print("OTP RESPONSE ERROR ${response.statusCode}");
      // Fluttertoast.showToast(
      //     msg: "Something Went Wrong Error:${response.statusCode}");
      return json.decode(response.body);
    }
  }

  Future<String> getRegisteration(String phone) async {

    var registerGetURL = Uri.parse("${conurl}existingcount?user_mo_num=$phone");

    var response = await http.get(registerGetURL);

    print('userGetResponse: ${response.body}');

    // String count = json.decode(response.body);
    String count = response.body;
    print(count);

    return count;
  }

  Future<List<UserModel>> getIdRef(String phone) async {
    var userGetURL = Uri.parse("${conurl}referenceget?reference_id=$phone");

    var response = await http.get(userGetURL);

    var list = json.decode(response.body);
    //
    print("list $list");

    //
    var model = UserModel().fromJson(list);

    print('userrefGetResponse: ${response.body}');

    var response1 = await getUsers(phone);
    // var response2 = await getUsersPhone(phone);

    var thirdMap = [
      jsonEncode(model),
       jsonEncode(response1),
      // jsonEncode(response2),
    ];

    return updateLocalUsers(thirdMap.toList());
  }

  Future getUsers(String phone) async {
    var userGetURL = Uri.parse("${conurl}usersget?reference_id=$phone");

    var response = await http.get(userGetURL);

    print('userGetResponse: ${response.body}');

    // updateLocalUsers(response.body);
    var list = json.decode(response.body);
    //
    // print(list);

    //
    var model = UserModel().fromJson(list);
    // Iterable<UserModel> newList = list.map((e) {
    //   return UserModel().fromJson(e);
    // });
    //
    return model;
  }

  Future getUsersPhone(String phone) async {
    var userGetURL = Uri.parse("${conurl}phoneget?reference_id=$phone");

    var response = await http.get(userGetURL);

    print('userPhoneGetResponse: ${response.body}');

    // updateLocalUsers(response.body);
    var list = json.decode(response.body);
    //
    // print(list);

    //
    var model = UserModel().fromJson(list);
    // Iterable<UserModel> newList = list.map((e) {
    //   return UserModel().fromJson(e);
    // });
    //
    return model;
  }

  Future<List<UserModel>> updateLocalUsers(List<String> jsonString) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    // Map json = jsonDecode(jsonString);
    //
    // String user = jsonEncode(UserModel().fromJson(json));
    await pref.setBool('isLoggedInKey', true);
    await pref.setStringList('userData', jsonString);

    // var myBox =Hive.box('myBox');
    //
    // myBox.put('name', 'arsalan');
    //
    // print('hivenameCheck = ${myBox.get('name')}');


    return getLocalUsers();

  }

  Future<List<UserModel>> getLocalUsers() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var a = pref.getStringList("userData");
    print('ausedata $a');
    Map<String,dynamic> jsonid = await jsonDecode(a![0]);
    Map<String,dynamic> jsonuser = await jsonDecode(a[1]);


    // print("allusersJson  ${json}");

    List<UserModel> newList = [];

    UserModel userid = await UserModel().fromJson(jsonid);

    newList.add(userid);


    UserModel userdetail = await UserModel().fromJson(jsonuser);

    newList.add(userdetail);


    print("allusers ${newList[1].user_name}");

    //

    return newList;
  }

  Future getAllRefer(String referral) async {
    var userGetURL = Uri.parse("${conurl}getallrefeferrals?referid=$referral");

    var response = await http.get(userGetURL);

    print('referalGetResponse: ${response.body}');

    // updateLocalUsers(response.body);


    var list = json.decode(response.body);
    //
    print(list);

    //
    var model = list == null || list == '' ? 'No Data' : list['referal'];
    // Iterable<UserModel> newList = list.map((e) {
    //   return UserModel().fromJson(e);
    // });
    //
    return model;
  }

  Future getUsersbyRefer(String referral) async {
    var userGetURL = Uri.parse("${conurl}getReferUser?referid=$referral");

    var response = await http.get(userGetURL);

    print('userGetResponse: ${response.body}');

    // updateLocalUsers(response.body);


    var list = json.decode(response.body);
    //
    print(list);

    //
    var model = list == null || list == '' ? 'No Data' : UserModel().fromJson(list);
    // Iterable<UserModel> newList = list.map((e) {
    //   return UserModel().fromJson(e);
    // });
    //
    return model;
  }

  registerUser(UserModel body) async {
    const web_hook =
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-aqwyr/service/okapp-users/incoming_webhook/";
    var url = Uri.parse(
        "${conurl}referencepost");

    var puturl = Uri.parse(
            "${conurl}updateRef");

    // ?user_mo_num=$phone&user_url=$url1

    var response = await http.post(url, body: {
      'user_mo_num': "${body.user_mo_num}",
      'user_url': "${body.user_url}"
    });

    var decodedBody = jsonDecode(response.body);
    print('response.body1: ${decodedBody}');
    var objectId = decodedBody['insertedId'];

    print('response.body: ${decodedBody} $objectId');

    // to add the refernece_id in id_reference database
    var referenceId = body.user_mo_num;
    // response.body.substring(23, 47);

    var putResponse = await http.put(puturl, body: {
      'user_mo_num': body.user_mo_num,
      'user_url':'https://report.okwale.com/$objectId'
    });
    print('putResponse: ${putResponse.body}');

    if (response.statusCode == 200) {
      print("Register RESPONSE ${response.body}");

      if (response.body.toString() == "\"User Exists\"") {
        print("userexist ${response.body}");
        commonWidget.errorToast("USER ALREADY EXISTS" );
      } else {
        print("user dont exist ${response.body}");
        commonWidget.errorToast("Registered" );
      }
    }

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    // to add the details in users database
    var usersPostUrl = Uri.parse("${conurl}userspost");
    var usersPostResponse = await http.post(usersPostUrl, body: 
    body.toJson()
    );
    print('usersPostResponse.body: ${usersPostResponse.body}');

    // to add the details in phone database
    var phonePostUrl = Uri.parse("${conurl}phonepost");
    // var phonePostResponse = await http.post(phonePostUrl, body: {
    //   'reference_id': body.user_mo_num,
    //   'Operating_sys': body.Operating_sys,
    //   'Screen_size_id': body.Screen_size_id,
    //   'Screen_reso_id': body.Screen_reso_id,
    // }).then((value) {
    //
    //
    //   print('phonePostResponse.body: ${value.body}');
    //   // Get.off(UserProfile(
    //   //   phone: body.user_mo_num,
    //   // ));
    // });



  }








}