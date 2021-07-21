import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:gwc/Model/Objects.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gwc/Model/urls.dart';
import 'package:gwc/helpers/images.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:gwc/helpers/my_textStyles.dart';
import 'package:http/http.dart' as http;

class EditInfo extends StatefulWidget {
 
  MyObjects obj = Get.find();
  final  details;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _id = TextEditingController();
  final TextEditingController _uniqueName = TextEditingController();
  final TextEditingController _digitalAddress = TextEditingController();

  var name;
  var id;
  var uniqueName;
  var addr;
//for meter editor

  //MyMeter meterViewObj = Get.put(MyMeter(), permanent: true);

  void addEditMeter(index) {
    obj.addEditMeter(
      meterName: _name.text,
      meterId: _id.text,
      uniqueName: _uniqueName.text,
      meterAddr: _digitalAddress.text,
      index: index,
    );
  }

  


  EditInfo( this.details);

  @override
  EditInfoState createState() => new EditInfoState();
}

class EditInfoState extends State<EditInfo> {

  final storage = FlutterSecureStorage();
  var data;
  bool loading = true;
  bool empty = true;

  Widget buildSpeedDial() {
    return SpeedDial(
      elevation: 2,
      animatedIcon: AnimatedIcons.menu_close,
      curve: Curves.linear,
      animationSpeed: 100,
      overlayColor: Colors.black,
      overlayOpacity: 0.2,
      backgroundColor: MyColors.primary,
      children: [
        SpeedDialChild(
          elevation: 2,
          label: "Lock Meter",
          child: Icon(Icons.lock, color: MyColors.grey_80),
          backgroundColor: Colors.white,
          onTap: () {
            print("object");
          },
        ),
        SpeedDialChild(
          elevation: 2,
          label: "Borrow Credit",
          child: Icon(Icons.account_balance, color: MyColors.grey_80),
          backgroundColor: Colors.white,
          onTap: () {},
        ),
        SpeedDialChild(
          elevation: 2,
          label: "Top Up",
          child: Icon(Icons.credit_card, color: MyColors.grey_80),
          backgroundColor: Colors.white,
          onTap: () {},
        ),
         SpeedDialChild(
          elevation: 2,
          label: "Readings",
          child: Icon(Icons.book, color: MyColors.grey_80),
          backgroundColor: Colors.white,
          onTap: () {},
        ),
      ],
    );
  }

  deleteMeter() async {
    String id = await storage.read(key: "customer_id");
    String token = await storage.read(key: "jwt");

    var url = Uri.parse(
        "$baseUrl/digi_rest/api/handler.php?customer_id=$id&alias=1&no=0");
    http.get(url, headers: {HttpHeaders.authorizationHeader: "Bearer $token"},).then((response) {
      print(response.body);
      var me = jsonDecode(response.body);

      print(me["data"]);
      
      setState(() {
        data = me["data"];
        loading = false;
      });

      if (data.length > 0) {
        setState(() {
          empty = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched1 = true, isSwitched2 = true;
    bool isSwitched3 = true, isSwitched4 = true;
    bool isSwitched5 = false, isSwitched6 = false;

    return new Scaffold(
      backgroundColor: Colors.white,
       floatingActionButton : buildSpeedDial(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text("Edit Meter",
            style: MyText.title(context).copyWith(
              color: Colors.blue,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /* Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text("EDIT METER",
                style: MyText.title(context).copyWith(
                    color: Colors.green[500], fontWeight: FontWeight.bold)),
            TextFormField(
              controller: widget._name,
              decoration: InputDecoration(
                labelText: widget.obj.meters[widget.index].meterName,
                labelStyle: TextStyle(color: Colors.blueGrey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey.shade400, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey.shade400, width: 2),
                ),
              ),
            ),
            Container(height: 5),
            TextFormField(
              controller: widget._id,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: widget.obj.meters[widget.index].meterId,
                labelStyle: TextStyle(color: Colors.blueGrey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey.shade400, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey.shade400, width: 2),
                ),
              ),
            ),

            Container(height: 5),
            TextField(
              controller: widget._uniqueName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: widget.obj.meters[widget.index].uniqueName,
                labelStyle: TextStyle(color: Colors.blueGrey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey.shade400, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey.shade400, width: 2),
                ),
              ),
            ),
            // Spacer(),

            Container(height: 5),
            TextFormField(
              controller: widget._digitalAddress,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: widget.obj.meters[widget.index].meterAddr,
                labelStyle: TextStyle(color: Colors.blueGrey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey.shade400, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey.shade400, width: 2),
                ),
              ),
            ),
            Container(height: 5),
            Container(
              width: double.infinity,
              height: 40,
              child: FlatButton(
                onPressed: () {
                  widget.obj.isAdding = false;
                  widget.addEditMeter(
                    widget.index,
                  );
                  Get.back();
                },
                child: Text(
                  "EDIT METER",
                  style: TextStyle(color: Colors.white),
                ),
                color: MyColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ), */
            Container(height: 10),
            Container(
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Customer ID", style: MyText.headline(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.bold)),
                      Text("${widget.details["customer_id"]}", style: MyText.body1(context).copyWith(color: MyColors.grey_80)),
                    ],
                  ),
                  Spacer(),
                  IconButton(icon: Icon(Icons.delete, size: 30,), onPressed: (){
                    deleteMeter();
                  }, color: Colors.red, )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            ),
            InkWell(
              onTap: (){
              showDialog(context: context,builder: (_) => CustomEventDialog(change: '', title: 'Name',) );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Row(
                  children: <Widget>[
                 
                    Text("Meter Name", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                    Spacer(),
                   Text("${widget.details["meter_alias"]}", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                    Container(width: 10)
                  ],
                ),
              ),
            ),
            Divider(height: 0),
            InkWell(
              onTap: (){
                 showDialog(context: context,builder: (_) => CustomEventDialog(change: '',  title: 'Id',) );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Row(
                  children: <Widget>[
                    Text("Meter ID", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                    Spacer(),
                    Text("${widget.details["meter_id"]}", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                    Container(width: 10)
                  ],
                ),
              ),
            ),
            Divider(height: 0),
            InkWell(
              onTap: (){
                showDialog(context: context,builder: (_) => CustomEventDialog(change: '',  title: 'Unique Name',) );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Row(
                  children: <Widget>[
                    Text("Meter Account", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                    Spacer(),
                     Text("GHS ${widget.details["meter_account"]}", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                    Container(width: 10)
                  ],
                ),
              ),
            ),
            Divider(height: 0),
            InkWell(
              onTap: (){
                  showDialog(context: context,builder: (_) => CustomEventDialog(change:  '',  title: 'Address',) );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Row(
                  children: <Widget>[
                    Text("Lock Status", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                    Spacer(),
                     Text("${widget.details["lock_status"]}", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                   
                    Container(width: 10)
                  ],
                ),
              ),
            ),
            Divider(height: 0),
            InkWell(
              onTap: (){
                  showDialog(context: context,builder: (_) => CustomEventDialog(change:  '',  title: 'Address',) );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Row(
                  children: <Widget>[
                     Text("Health Status", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                   
                    Spacer(),
                    Text("${widget.details["health_status"]}", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                    Container(width: 10)
                  ],
                ),
              ),
            ),
             Divider(height: 0),
            InkWell(
              onTap: (){
                  showDialog(context: context,builder: (_) => CustomEventDialog(change:  '',  title: 'Address',) );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Row(
                  children: <Widget>[
                    Text("READINGS", style: MyText.medium(context).copyWith(color: MyColors.grey_80, fontWeight: FontWeight.w300)),
                    Spacer(),
                    Icon(Icons.store, color: MyColors.grey_60),
                    Container(width: 10)
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}


class CustomEventDialog extends StatefulWidget {
  final String change;
  final String title;

  CustomEventDialog({Key key, this.change, this.title}) : super(key: key);

  @override
  CustomEventDialogState createState() => new CustomEventDialogState();
}

class CustomEventDialogState extends State<CustomEventDialog>{

  @override
  Widget build(BuildContext context){
    return Dialog(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Material(
              color: MyColors.primary,
              child: Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white,),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text("Edit Meter ${widget.title}", style: TextStyle(color: Colors.white, fontSize: 20)),
                    
                  ],
                ),
              ),
            ),
           
        
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 Container(height: 25),
                  TextField(
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration( hintText: "${widget.change}", hintStyle: TextStyle(color: Colors.grey) ),
                  ),
                  Container(height: 25),
                  
                 
                   Align(
                     alignment: Alignment.centerRight,
                     child: RaisedButton(
                  child: Text("SAVE", style: TextStyle(color: Colors.white),),
                  color: Colors.blue[700],
                  onPressed: (){},
                ),
                   ),
                ],
              ),
            ),
            Container(height: 20)
          ],
        ),
      )
    );
  }
}





class CircleImage extends StatelessWidget {

  final double size;
  final Color backgroundColor;
  final ImageProvider imageProvider;

  const CircleImage({
    Key key,
    @required this.imageProvider,
    this.size,
    this.backgroundColor,
  }) : assert(imageProvider != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    return Container(
        width: size != null ? size : 20,
        height: size != null ? size : 20,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor != null ? backgroundColor : Colors.transparent,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: imageProvider
            )
        )
    );
  }
}


