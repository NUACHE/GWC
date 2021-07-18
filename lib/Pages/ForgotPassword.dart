import 'package:flutter/material.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:gwc/helpers/my_textStyles.dart';
import 'package:gwc/helpers/images.dart';
import 'package:gwc/Pages/SignUp.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword();

  @override
  LogInState createState() => new LogInState();
}

class LogInState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
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
              Container(
                child: Image.asset(
                  Img.get('logo_small_round.png'),
                  color: Colors.white,
                ),
                width: 80,
                height: 80,
              ),
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
                      TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
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
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: FlatButton(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: MyColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20)),
                          onPressed: () {},
                        ),
                      ),
                      Container(height: 25),
                      Visibility(
                        visible: false,
                        child: TextFormField(
                          maxLines: 4,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(Icons.person,
                                    size: 40.0, color: Colors.white),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      new Radius.circular(25.0))),
                              labelStyle: TextStyle(color: Colors.white)),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
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
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
