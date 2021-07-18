import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwc/Pages/DashBoard.dart';
import 'package:gwc/Pages/ForgotPassword.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:gwc/helpers/my_textStyles.dart';
import 'package:gwc/helpers/images.dart';
import 'package:gwc/Pages/SignUp.dart';
import 'package:gwc/Model/Objects.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'my_custom_widgets.dart';

class LogIn extends StatefulWidget {
  LogIn();

  @override
  LogInState createState() => new LogInState();
}

class LogInState extends State<LogIn> {
  final MyObjects objects = Get.put(MyObjects(), permanent: true);

  bool _passwordVisibility = true;
  bool validEmail = false;
  bool validPassword = false;

  String user_email;
  String password;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final storage = FlutterSecureStorage();

  storeData(data) async {
    
   await storage.write(key: "jwt", value: data["token"]);
   await storage.write(key: "customer_id", value: data["data"][0]["customer_id"].toString());
   await storage.write(key: "user_email", value: data["data"][0]["user_email"]);
   await storage.write(key: "phone_no", value: data["data"][0]["phone_no"]);
   await storage.write(key: "first_name", value: data["data"][0]["first_name"]);
   await storage.write(key: "last_name", value: data["data"][0]["last_name"]);
   await storage.write(key: "digital_address", value: data["data"][0]["digital_address"]);
   await storage.write(key: "address_street", value: data["data"][0]["address_street"]);
   await storage.write(key: "address_city", value: data["data"][0]["address_city"]);
   await storage.write(key: "address_region", value: data["data"][0]["adress_region"]);
  }

  Future<void> makePostRequest() async {
    showLoading(context);
    final Myheaders = {
      "Content-type": "application/json",
      "accept": "application/json"
    };

    final json = {
      "user_email": "$user_email",
      "password": "$password",
    };
    print(json);
    print(user_email);
    final response = await http.post(
        Uri.parse(
            "http://192.168.43.56/digi_rest/api/authenticate_user_service.php"),
        headers: Myheaders,
        body: jsonEncode(json));
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    var signUpMessage = jsonDecode(response.body);
    print(signUpMessage["message"]);
    if (signUpMessage["message"] == 'Success') {
      print(signUpMessage["data"][0]);
       Navigator.pop(context);
      storeData(signUpMessage);

     
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashBoard()),
      );
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

  @override
  Widget build(BuildContext context) {
    final emailRegex = objects.emailRegex();
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(color: MyColors.primary)),
      body: Stack(
        children: <Widget>[
          Container(color: MyColors.primary, height: 220),
          Column(
            children: <Widget>[
              Container(height: 40),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  margin: EdgeInsets.all(25),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(height: 25),
                        Text("SIGN IN",
                            style: MyText.title(context).copyWith(
                                color: Colors.green[500],
                                fontWeight: FontWeight.bold)),
                        TextFormField(
                          validator: (value) {
                            if (!emailRegex.hasMatch(value)) {
                              validEmail = false;
                              return 'Please enter a valid email';
                            }
                            if (value == '' || value == null) {
                              validEmail = false;
                              return 'Please enter a valid email';
                            }
                            validEmail = true;
                            return null;
                          },
                          controller: _emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.blueGrey[400]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey.shade400, width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey.shade400, width: 2),
                            ),
                          ),
                        ),
                        Container(height: 25),
                        TextFormField(
                          validator: (value) {
                            if (value == "" || value == null) {
                              validPassword = false;
                              return 'Please enter a valid password';
                            }
                            if (value.length < 8) {
                              validPassword = false;
                              return 'Password is too short';
                            }
                            validPassword = true;
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: _passwordVisibility,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_passwordVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  this._passwordVisibility =
                                      !_passwordVisibility;
                                });
                              },
                              color: Colors.blueGrey,
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.blueGrey[400]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey.shade400, width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey.shade400, width: 2),
                            ),
                          ),
                        ),
                        // Spacer(),

                        Container(height: 25),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: FlatButton(
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: MyColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20)),
                            onPressed: () async {
                              user_email = _emailController.text;

                              password = _passwordController.text;
                              validate();

                              /*     Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashBoard()),
                              ); */

                              /*  try {
                                var jwt = await objects.attemptLogIn(
                                    username, password);

                                if (jwt != null) {
                                  storage.write(key: "jwt", value: jwt);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard()),
                                  );
                                } else {
                                  objects.displayDialog(
                                      context,
                                      "An Error Occurred",
                                      "No account was found matching that username and password");
                                }
                              } catch (SocketException) {
                                objects.displayDialog(
                                    context,
                                    "Connectivity Error",
                                    "Please check your network connectivity");
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashBoard()),
                              ); */
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: FlatButton(
                            child: Text(
                              "New user? Sign Up",
                              style: TextStyle(color: MyColors.primaryLight),
                            ),
                            color: Colors.transparent,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: FlatButton(
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(color: MyColors.primaryLight),
                            ),
                            color: Colors.transparent,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  validate() {
    if (validPassword == true && validEmail == true) {
      print("all ready");
      makePostRequest();
    }
  }
}
