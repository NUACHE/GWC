import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gwc/Model/urls.dart';
import 'package:gwc/Pages/my_custom_widgets.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:gwc/helpers/my_textStyles.dart';
import 'package:http/http.dart' as http;

class Password extends StatefulWidget {

  Password();

  @override
  PasswordState createState() => new PasswordState();
}


class PasswordState extends State<Password> {

   final storage = FlutterSecureStorage();
  final TextEditingController oldPasswordController = new TextEditingController();
  final TextEditingController newPasswordController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    oldPasswordController.text = "";
    newPasswordController.text = "";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColors.grey_5,
      appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.blue),
    
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text("Password",
              style: MyText.title(context).copyWith(
                color:Colors.blue,
              )),
         
         ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              
                 Container(height: 15),
                Text("OLD PASSWORD", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3),),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0), elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: <Widget>[
                        Container(width: 15),
                        Expanded(
                          child: TextField(maxLines: 1,
                            controller: oldPasswordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12), border: InputBorder.none,
                            ),
                          ),
                        ),
                       // Icon(Icons.expand_more, color: MyColors.grey_40)
                      ],
                    ),
                  ),
                ),
                 Container(height: 15),
                Text("NEW PASSWORD", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3),),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0), elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: <Widget>[
                        Container(width: 15),
                        Expanded(
                          child: TextField(maxLines: 1,
                            controller: newPasswordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12), border: InputBorder.none,
                            ),
                          ),
                        ),
                       // Icon(Icons.expand_more, color: MyColors.grey_40)
                      ],
                    ),
                  ),
                ),
                Container(height: 15),
                Container(
                  width: double.infinity, height: 45,
                  child: FlatButton(
                    child: Text("SUBMIT", style: MyText.subhead(context).copyWith(color: Colors.white)),
                    color: MyColors.primary,
                    onPressed: (){  
                      changePassword();
                     }
                    ,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  changePassword() async {
   
      String token = await storage.read(key: "jwt");
    showLoading(context);
    final Myheaders = {
      "Content-type": "application/json",
      "accept": "application/json"
    };

    final json = {
      "old_password": "${oldPasswordController.text}",
      "new_password": "${newPasswordController.text}",
      "change_password": "1"
    };
    print(json);
  //  print(user_email);
    final response = await http.post(
        Uri.parse(
            "$baseUrl/digi_rest/api/edit_profile_service.php"),
       headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: jsonEncode(json));
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    var signUpMessage = jsonDecode(response.body);
    print(signUpMessage["message"]);
    if (signUpMessage["message"] == 'Success') {
      Navigator.pop(context);
     showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("${signUpMessage["message"]}"),
            content: Text("Password Successfully Changed"),
            actions: <Widget>[
              FlatButton(
                child: const Text('OKAY'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
     // storeData(signUpMessage);

     
    /*   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashBoard()),
      ); */
    } else {
      Navigator.pop(context);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("${signUpMessage["message"]}"),
            actions: <Widget>[
              FlatButton(
                child: const Text('OKAY'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  

  }

  
}

