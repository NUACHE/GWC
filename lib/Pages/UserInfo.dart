import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwc/Model/Objects.dart';
import 'package:gwc/Model/urls.dart';
//import 'package:materialx_flutter/adapter/my_files_adapter.dart';
import 'package:gwc/helpers/images.dart';
import 'package:gwc/helpers/my_colors.dart';
//import 'package:materialx_flutter/model/folder_file.dart';
import 'package:gwc/helpers/my_textStyles.dart';

class UserInfo extends StatefulWidget {
  UserInfo();

  @override
  UserInfoState createState() => new UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  Urls urlObjects = Urls();
  MyObjects objects = MyObjects();
  final timeNow = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.blue),
          title: Text("User Data",
              style: MyText.title(context).copyWith(color: Colors.blue)),
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    color: Colors.white,
                    elevation: 2,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.lightGreen[500],
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          Container(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                               Container(
                                 width: 70,
                                 child: SingleChildScrollView(
                                   scrollDirection: Axis.horizontal,
                                   child: Text(
                                            'Flow rate data',
                                            style: MyText.subhead(context).copyWith(
                                                color: MyColors.grey_60,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                 ),
                               ),
                              Container(height: 5),
                              Text(
                                "Flow rate",
                                style: MyText.caption(context)
                                    .copyWith(color: MyColors.grey_40),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(width: 5),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    color: Colors.white,
                    elevation: 2,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.indigo[400],
                            child: Icon(
                              Icons.file_download,
                              color: Colors.white,
                            ),
                          ),
                          Container(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                               Text(
                                        'Bal',
                                        style: MyText.subhead(context).copyWith(
                                            color: MyColors.grey_60,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                              Container(height: 5),
                              Text(
                                "Balance",
                                style: MyText.caption(context)
                                    .copyWith(color: MyColors.grey_40),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 5),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    color: Colors.white,
                    elevation: 2,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.lightGreen[500],
                            child: Icon(
                              Icons.description,
                              color: Colors.white,
                            ),
                          ),
                          Container(width: 10),
                        
                          Text(
                            "Payments Statements",
                            style: MyText.subhead(context).copyWith(
                                color: MyColors.grey_60,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 5),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              color: Colors.white,
              elevation: 2,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Recent Payments",
                            style: MyText.subhead(context).copyWith(
                                color: MyColors.grey_60,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0),
                    Container(height: 15),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top Up(MTN)",
                                style: MyText.body2(context)
                                    .copyWith(color: MyColors.grey_60),
                                textAlign: TextAlign.center,
                              ),
                               SizedBox(
                                height: 10,
                              ),
                              Text(
                                "GHc 5.00",
                                style: MyText.body2(context).copyWith(
                                    color: MyColors.grey_40,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "28 Jan 21",
                            style: MyText.body2(context).copyWith(
                                color: MyColors.grey_40,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top Up(Vodafone)",
                                style: MyText.body2(context)
                                    .copyWith(color: MyColors.grey_60),
                                textAlign: TextAlign.center,
                              ),
                               SizedBox(
                                height: 10,
                              ),
                              Text(
                                "GHc 5.00",
                                style: MyText.body2(context).copyWith(
                                    color: MyColors.grey_40,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "28 Jan 21",
                            style: MyText.body2(context).copyWith(
                                color: MyColors.grey_40,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top Up(Vodafone)",
                                style: MyText.body2(context)
                                    .copyWith(color: MyColors.grey_60),
                                textAlign: TextAlign.center,
                              ),
                               SizedBox(
                                height: 10,
                              ),
                              Text(
                                "GHc 5.00",
                                style: MyText.body2(context).copyWith(
                                    color: MyColors.grey_40,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "28 Jan 21",
                            style: MyText.body2(context).copyWith(
                                color: MyColors.grey_40,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top Up(Vodafone)",
                                style: MyText.body2(context)
                                    .copyWith(color: MyColors.grey_60),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "GHc 5.00",
                                style: MyText.body2(context).copyWith(
                                    color: MyColors.grey_40,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "28 Jan 21",
                            style: MyText.body2(context).copyWith(
                                color: MyColors.grey_40,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                 
                    Container(height: 15),
                    Divider(height: 0),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: FlatButton(
                        child: Text("See More",
                            style: TextStyle(color: MyColors.primary)),
                        color: Colors.transparent,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(height: 5),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              color: Colors.white,
              elevation: 2,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: (){
                        print('Borrow Credit');
                      },
                      child: Container(
                        child: Row(
                          children: [
                             CircleAvatar(
                              backgroundColor: Colors.blue[500],
                              child: Icon(
                                Icons.account_balance_wallet,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Borrow Credit"),
                           
                          ],
                        ),
                  
                        height: 70,
                      ),
                    ),
                  
                    InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: (){
                        print('Usage');
                      },
                      child: Container(
                        child: Row(
                          children: [
                             CircleAvatar(
                              backgroundColor: Colors.blue[500],
                              child: Icon(
                                Icons.bar_chart_sharp,
                                color: Colors.white,
                              ),
                            ),
                             SizedBox(width: 10),
                            Text("Usage"),
                          
                          ],
                        ),
                  
                        height: 70,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
