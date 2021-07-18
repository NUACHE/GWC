import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwc/Model/urls.dart';
import 'package:gwc/Pages/my_custom_widgets.dart';
//import 'package:gwc/Methods/Controllers.dart';
//import 'package:gwc/helpers/images.dart';
import 'package:gwc/helpers/my_colors.dart';
//import 'package:gwc/helpers/my_textStyles.dart';
//import 'package:gwc/helpers/AppBar.dart';
import 'package:http/http.dart' as http;
import 'LogIn.dart';
import 'package:gwc/Model/Objects.dart';

class SignUp extends StatefulWidget {
  SignUp();

  @override
  SignUpState createState() => new SignUpState();
}

class SignUpState extends State<SignUp> {
  Urls urlObjs = new Urls();

  bool validEmail = false;
  bool validFirstName = false;
  bool validLastName = false;
  bool validNumber = false;
  bool validDigitalAddress = false;
  bool validStreetAddress = false;
  bool validCity = false;
  bool validRegion = false;
  bool validPassword = false;

  bool allFormsCorrect = false;

  Future<void> makePostRequest() async {
    showLoading(context);
    final Myheaders = {
      "Content-type": "application/json",
      "accept": "application/json"
    };

    final json = {
      "user_email": "$user_email",
      "last_name": "$last_name",
      "first_name": "$first_name",
      "phone_no": "$phone_no",
      "digital_address": "$digital_address",
      "address_city": "$address_city",
      "address_region": "$address_region",
      "password": "$password",
      "address_street": "$address_street"
    };
    print(json);
    print(user_email);
    final response = await http.post(
        Uri.parse("http://192.168.43.56/digi_rest/api/create_user_service.php"),
        headers: Myheaders,
        body: jsonEncode(json));
    print('Status code: ${response.statusCode}');
    //  print('Body: ${response.body}');
    signUpMessage = jsonDecode(response.body);
    print(signUpMessage["message"]);
    if (signUpMessage["message"] == 'Success') {
     Navigator.pop(context);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text("Login to begin"),
              actions: <Widget>[
                FlatButton(
                  child: const Text('OKAY'),
                  onPressed: () {
                  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LogIn(),
      ),
      (route) => false,
    );
                  },
                )
              ],
            );
          },
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

  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  MyObjects formatterObject = new MyObjects();

  var signUpMessage;

  String user_email;
  String last_name;
  String first_name;
  String phone_no;
  String digital_address;
  String address_street;
  String address_city;
  String address_region;
  String password;

  final emailCont = TextEditingController();
  final lastNameCont = TextEditingController();
  final firstNameCont = TextEditingController();
  final phoneNumberCont = TextEditingController();
  final digitalAddressCont = TextEditingController();
  final streetAddressCont = TextEditingController();
  final cityCont = TextEditingController();
  final regionCont = TextEditingController();
  final passwordCont = TextEditingController();
  final retypePasswordCont = TextEditingController();
  bool _passwordVisibility = true;
  bool _passwordVisibilityRetype = true;

  TextStyle textStyle =
      TextStyle(color: Colors.black, height: 1.4, fontSize: 16);
  TextStyle labelStyle = TextStyle(color: Colors.blueGrey.shade400);
  UnderlineInputBorder lineStyle1 = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey.shade400, width: 1));
  UnderlineInputBorder lineStyle2 = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey.shade400, width: 2));

  @override
  Widget build(BuildContext context) {
    final phoneRegex = formatterObject.phoneregex();
    final emailRegex = formatterObject.emailRegex();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: MyColors.primary,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () {},
            ),
          ]),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
//
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value == "" || value == null) {
                          validFirstName = false;
                          return 'Please enter a valid name';
                        }
                        validFirstName = true;
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: firstNameCont,
                      style: textStyle,
                      keyboardType: TextInputType.text,
                      cursorColor: MyColors.primary,
                      decoration: InputDecoration(
                        icon: Container(
                            child: Icon(Icons.person, color: MyColors.grey_60),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                        labelText: "First Name",
                        labelStyle: labelStyle,
                        enabledBorder: lineStyle1,
                        focusedBorder: lineStyle2,
                      ),
                    ),
                    Container(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            validator: (value) {
                              if (value == "" || value == null) {
                                validLastName = false;
                                return 'Please enter a valid name';
                              }
                              validLastName = true;
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: lastNameCont,
                            style: textStyle,
                            keyboardType: TextInputType.text,
                            cursorColor: MyColors.primary,
                            decoration: InputDecoration(
                              icon: Container(
                                  child: Icon(Icons.person,
                                      color: MyColors.grey_60),
                                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                              labelText: "Last Name",
                              labelStyle: labelStyle,
                              enabledBorder: lineStyle1,
                              focusedBorder: lineStyle2,
                            ),
                          ),
                        ),
                        Container(width: 10),
                      ],
                    ),
                    Container(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: emailCont,
                            style: textStyle,
                            keyboardType: TextInputType.emailAddress,
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
                            cursorColor: MyColors.primary,
                            decoration: InputDecoration(
                              icon: Container(
                                  child: Icon(Icons.email,
                                      color: MyColors.grey_60),
                                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                              labelText: "Email",
                              labelStyle: labelStyle,
                              enabledBorder: lineStyle1,
                              focusedBorder: lineStyle2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 10),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: formatterObject.phoneNumberFormatter(),
                      validator: (value) {
                        if (phoneRegex.hasMatch(value)) {
                          validNumber = false;
                          return 'Please enter valid phone number';
                        }
                        if (value.length != 10) {
                          validNumber = false;
                          return 'Please enter a valid number';
                        }

                        validNumber = true;
                        return null;
                      },
                      controller: phoneNumberCont,
                      style: textStyle,
                      keyboardType: TextInputType.phone,
                      cursorColor: MyColors.primary,
                      decoration: InputDecoration(
                        icon: Container(
                            child: Icon(Icons.phone, color: MyColors.grey_60),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                        labelText: "Phone Number",
                        labelStyle: labelStyle,
                        enabledBorder: lineStyle1,
                        focusedBorder: lineStyle2,
                      ),
                    ),
                    Container(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value == "" || value == null) {
                          validDigitalAddress = false;
                          return 'Please enter a valid address';
                        }
                        validDigitalAddress = true;
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: digitalAddressCont,
                      style: textStyle,
                      keyboardType: TextInputType.text,
                      cursorColor: MyColors.primary,
                      decoration: InputDecoration(
                        icon: Container(
                            child: Icon(Icons.domain, color: MyColors.grey_60),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                        labelText: "Digital Address",
                        labelStyle: labelStyle,
                        enabledBorder: lineStyle1,
                        focusedBorder: lineStyle2,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "" || value == null) {
                          validStreetAddress = false;
                          return 'Please enter a valid address';
                        }
                        validStreetAddress = true;
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: streetAddressCont,
                      style: textStyle,
                      keyboardType: TextInputType.text,
                      cursorColor: MyColors.primary,
                      decoration: InputDecoration(
                        icon: Container(
                            child: Icon(Icons.pin_drop, color: Colors.grey),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                        labelText: "Street Address",
                        labelStyle: labelStyle,
                        enabledBorder: lineStyle1,
                        focusedBorder: lineStyle2,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "" || value == null) {
                          validCity = false;
                          return 'Please enter a valid city';
                        }
                        validCity = true;
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: cityCont,
                      style: textStyle,
                      keyboardType: TextInputType.text,
                      cursorColor: MyColors.primary,
                      decoration: InputDecoration(
                        icon: Container(
                            child: Icon(Icons.map, color: Colors.grey),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                        labelText: "City",
                        labelStyle: labelStyle,
                        enabledBorder: lineStyle1,
                        focusedBorder: lineStyle2,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "" || value == null) {
                          validRegion = false;
                          return 'Please enter a valid region';
                        }
                        validRegion = true;
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: regionCont,
                      style: textStyle,
                      keyboardType: TextInputType.text,
                      cursorColor: MyColors.primary,
                      decoration: InputDecoration(
                        icon: Container(
                            child: Icon(Icons.landscape, color: Colors.grey),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                        labelText: "Region",
                        labelStyle: labelStyle,
                        enabledBorder: lineStyle1,
                        focusedBorder: lineStyle2,
                      ),
                    ),
                    Container(height: 10),
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
                      key: _passwordFieldKey,
                      controller: passwordCont,
                      obscureText: _passwordVisibility,
                      style: textStyle,
                      keyboardType: TextInputType.text,
                      cursorColor: MyColors.primary,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                                _passwordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: MyColors.grey_60),
                            onPressed: () {
                              setState(() {
                                _passwordVisibility = !_passwordVisibility;
                              });
                            }),
                        icon: Container(
                            child: Icon(Icons.text_fields,
                                color: MyColors.grey_60),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                        labelText: "Password",
                        labelStyle: labelStyle,
                        enabledBorder: lineStyle1,
                        focusedBorder: lineStyle2,
                      ),
                    ),
                    Container(width: 10),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != _passwordFieldKey.currentState.value) {
                          allFormsCorrect = false;
                          return 'Passwords do not match';
                        }
                        allFormsCorrect = true;
                        return null;
                      },
                      controller: retypePasswordCont,
                      obscureText: _passwordVisibilityRetype,
                      style: textStyle,
                      keyboardType: TextInputType.text,
                      cursorColor: MyColors.primary,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                                _passwordVisibilityRetype
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: MyColors.grey_60),
                            onPressed: () {
                              setState(() {
                                _passwordVisibilityRetype =
                                    !_passwordVisibilityRetype;
                              });
                            }),
                        icon: Container(
                            child: Icon(Icons.text_fields,
                                color: MyColors.grey_60),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                        labelText: "Retype Password",
                        labelStyle: labelStyle,
                        enabledBorder: lineStyle1,
                        focusedBorder: lineStyle2,
                      ),
                    ),
                    Container(width: 10),
                    Center(
                      child: RaisedButton(
                          elevation: 30,
                          color: MyColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20)),
                          child: Text(
                            "REGISTER",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            user_email = emailCont.text;
                            last_name = lastNameCont.text;
                            first_name = firstNameCont.text;
                            phone_no = phoneNumberCont.text;
                            digital_address = digitalAddressCont.text;
                            address_street = streetAddressCont.text;
                            address_city = cityCont.text;
                            address_region = regionCont.text;
                            password = passwordCont.text;
                            validate();
                            // makePostRequest();
                            /* print("Message");
                            print(signUpMessage[1]);
                            if (signUpMessage[0] == "Success") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogIn()),
                              );
                            } */
                          }),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  validate() {
    if (validPassword == true &&
        validStreetAddress == true &&
        validRegion == true &&
        validNumber == true &&
        validLastName == true &&
        validFirstName == true &&
        validCity == true &&
        validEmail == true &&
        validDigitalAddress == true &&
        allFormsCorrect == true) {
      print("all ready");
      makePostRequest();
    }
  }
}
