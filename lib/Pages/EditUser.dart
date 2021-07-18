import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:gwc/helpers/my_textStyles.dart';

class EditUser extends StatefulWidget {

  EditUser();

  @override
  EditUserState createState() => new EditUserState();
}


class EditUserState extends State<EditUser> {

  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController lastNameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController numberController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController streetController = new TextEditingController();
  final TextEditingController regionController = new TextEditingController();
  final TextEditingController digitalAddressController = new TextEditingController();


  @override
  void initState() {
    super.initState();
    firstNameController.text = "John";
    lastNameController.text = "Smith";
    emailController.text = "john.smith@mail.com";
    numberController.text = "083 2374 2342";
    cityController.text = "Kumasi";
    streetController.text = "Indece Road";
    regionController.text = "Ashanti Region";
    digitalAddressController.text = "AH-123-456-789";

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColors.grey_5,
      appBar:AppBar(
       iconTheme: IconThemeData(color: Colors.blue),
    
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text("Edit Profile",
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
                Text("FIRST NAME", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3),),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0), elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(maxLines: 1,
                      controller: firstNameController,
                      decoration: InputDecoration(contentPadding: EdgeInsets.all(-12), border: InputBorder.none,),
                    ),
                  ),
                ),
                Container(height: 15),
                Text("LAST NAME", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3),),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0), elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(maxLines: 1,
                      controller: lastNameController,
                      decoration: InputDecoration(contentPadding: EdgeInsets.all(-12), border: InputBorder.none,),
                    ),
                  ),
                ),
                Container(height: 15),
                Text("EMAIL", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3),),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0), elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(maxLines: 1, keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(contentPadding: EdgeInsets.all(-12), border: InputBorder.none,),
                    ),
                  ),
                ),
                Container(height: 15),
                Text("PHONE", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3),),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0), elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(maxLines: 1,
                      controller: numberController,
                      decoration: InputDecoration(contentPadding: EdgeInsets.all(-12), border: InputBorder.none,),
                    ),
                  ),
                ),
                  Container(height: 15),
                Text("DIGITAL ADDRESS", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3),),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0), elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(maxLines: 1,
                      controller: digitalAddressController,
                      decoration: InputDecoration(contentPadding: EdgeInsets.all(-12), border: InputBorder.none,),
                    ),
                  ),
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("CITY", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
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
                                      controller: cityController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(-12), border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("STREET", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
                          Container(height: 5),
                          Card(
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3),),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: EdgeInsets.all(0), elevation: 0,
                            child: Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(maxLines: 1,
                                controller: streetController,
                                decoration: InputDecoration(contentPadding: EdgeInsets.all(-12), border: InputBorder.none,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Text("REGION", style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
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
                            controller: regionController,
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
                    onPressed: (){ }
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

  
}

