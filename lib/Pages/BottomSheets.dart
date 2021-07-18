import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gwc/Pages/MeterView.dart';
import 'package:http/http.dart' as http;
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:gwc/Pages/my_custom_widgets.dart';
import 'package:gwc/helpers/my_textStyles.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:gwc/Model/Objects.dart';
import 'package:get/get.dart';

class MyBottomSheet {
  MyObjects obj = Get.find();
  final storage = FlutterSecureStorage();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _id = TextEditingController();

  var name;
  var id;

//for meter editor

  //MyMeter meterViewObj = Get.put(MyMeter(), permanent: true);

  void addEditMeter(index) {
    obj.addEditMeter(
      meterName: _name.text,
      meterId: _id.text,
      index: index,
    );
  }

  Future<void> addMeter(context) async {
    showLoading(context);
    String customer_id = await storage.read(key: "customer_id");
    print(customer_id);

    /* final Myheaders = {
      "Content-type": "application/json",
      "accept": "application/json"
    }; */

    final json = {
      "add_meter_alias": "1",
      "meter_alias": "${_name.text}",
      "customer_id": "$customer_id",
      "meter_id": "${_id.text}",
      //14357098432
    };
    print(json);
     String token = await storage.read(key: "jwt");

    final response = await http.post(
        Uri.parse(
            "http://192.168.43.56/digi_rest/api/handler.php"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        
        body: jsonEncode(json));
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    var info = jsonDecode(response.body);
    if(info["message"] == "Success"){
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyMeter()));
    }
  }

  bool meter_name = false;
  bool meter_id = false;

  void showSheet(BuildContext localContext) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text("ADD METER",
                style: MyText.title(localContext).copyWith(
                    color: Colors.green[500], fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _name,
                validator: (value) {
                              if (value == "" || value == null) {
                                meter_name = false;
                                return 'Please enter a valid name';
                              }
                              meter_name= true;
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: "Meter Name",
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
                validator: (value) {
                              if (value == "" || value == null) {
                                meter_id = false;
                                return 'Please enter a valid id';
                              }
                              meter_id = true;
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
              controller: _id,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Meter ID",
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
            Container(height: 15),
            Container(
                width: double.infinity,
                height: 40,
                child: CustomFlatButton(
                  yourText: "Add Meter",
                  yourFunction: () {
                    if(meter_id == true && meter_name == true){
                       addMeter(localContext);
                    }
                  
                  },
                )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      elevation: 20.0,
      enableDrag: true,
      backgroundColor: Colors.white,

      //Commented shape of bottom sheet

      /* shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ), */
    );
  }

  //Meter Editing
  void showEditSheet(BuildContext localContext, index) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text("EDIT METER",
                style: MyText.title(localContext).copyWith(
                    color: Colors.green[500], fontWeight: FontWeight.bold)),
            TextField(
            
                            
              controller: _name,
              decoration: InputDecoration(
                labelText: obj.meters[index].meterName,
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
              controller: _id,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: obj.meters[index].meterId,
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
            Container(height: 5),
            Container(
              width: double.infinity,
              height: 40,
              child: FlatButton(
                onPressed: () {
                  obj.isAdding = false;
                  addEditMeter(
                    index,
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
      ),
      elevation: 20.0,
      enableDrag: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
    );
  }
}
