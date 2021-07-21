import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:gwc/Controllers/meterViewController.dart';
import 'package:gwc/Model/urls.dart';
import 'package:gwc/Pages/BottomSheets.dart';
import 'package:gwc/Pages/EditInfo.dart';
import 'package:gwc/Pages/my_custom_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:gwc/helpers/my_colors.dart';

import 'package:gwc/Model/MeterClass.dart';
import 'package:gwc/Model/Objects.dart';
import 'package:gwc/helpers/my_textStyles.dart';

class MyMeter extends StatefulWidget {
  @override
  _MyMeterState createState() => _MyMeterState();
}

class _MyMeterState extends State<MyMeter> {
  final storage = FlutterSecureStorage();
  var data;
  bool loading = true;
  bool empty = true;
  


// headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  
  @override
  void initState() {
    super.initState();
    //Check User's available meters on initState
    checkMeters();
  }

  checkMeters() async {
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

  MyObjects objectsCont = Get.find();

  //final Meter myMeter = Meter();

  final MyBottomSheet bottomSheetObj = new MyBottomSheet();

  @override
  Widget build(BuildContext context) {
    objectsCont.loadData();
    var metersVar = objectsCont.meters;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bottomSheetObj.showSheet(context);
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text("Meters",
            style: MyText.title(context).copyWith(
              color: Colors.blue,
            )),
      ),
      body:
      //if checkMeter function is still loading, show loading (Shimmer) widgets.
       loading == true
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return LoadingMeters();
              })
          :
          //If after running checkMeter, we found out that user has no meter.
           empty == true
              ? Container(
                  child: Center(child: Text("No Meters added yet!")),
                )
              : 
              //If after running checkMeter, we found out that user has some meter.
              ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
      margin: EdgeInsets.all(20),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(
            height: 65,
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditInfo( data[index])),
                );
                  //widget.bottomSheetObj.showEditSheet(context, widget.myIndex);
              },
             
              title: Text(
                "Meter Name: " + data[index]["meter_alias"],
              ),
              subtitle: Text(
                "ID: " + data[index]["meter_id"],
              ),
              trailing: InkWell(
               
                child: Icon(Icons.delete)),
            )),
      ),
    );
              })
    );
  }
}

/* class MyCard extends StatefulWidget {
  void deleteLogic(index, context) {
    meterViewCont.showConfirmDialog(context, index);
  }

  MeterViewCont meterViewCont = Get.put(MeterViewCont());

  final int myIndex;
  final Meter meterObject;
  final MyObjects objectsCont = Get.find();
  final MyBottomSheet bottomSheetObj = new MyBottomSheet();
  MyCard({
    @required this.myIndex,
    @required this.meterObject,
  });

  bool lock = false;

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(
            height: 65,
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditInfo(widget.myIndex)),
                );
                  //widget.bottomSheetObj.showEditSheet(context, widget.myIndex);
              },
             
              title: Text(
                "Meter Name: " + widget.meterObject.meterName != null
                    ? widget.meterObject.meterName
                    : "kwaku",
              ),
              subtitle: Text(
                "ID: " + widget.meterObject.getMeterId() != null
                    ? widget.meterObject.getMeterId()
                    : "kwaku",
              ),
              trailing: InkWell(
                onTap: (){
                  widget.deleteLogic(widget.myIndex, context);
                },
                child: Icon(Icons.delete)),
            )),
      ),
    );
  }
}
 */
/* class MyMeter extends StatelessWidget {
  
  
} */

//To be refracted