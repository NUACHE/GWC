import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'urls.dart';
import 'MeterClass.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:gwc/helpers/my_textStyles.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:get/get.dart';

class MyObjects extends GetxController {
  var meters = List<Meter>().obs;
  bool isAdding;
  Urls objects = Urls();
  var meterObj = new Meter();
  var meterCont = Get.put(Meter(), permanent: true).obs;

  List<TextInputFormatter> phoneNumberFormatter() {
    return [
      new FilteringTextInputFormatter.allow(new RegExp(r'^[0-9]*$')),
      new LengthLimitingTextInputFormatter(10)
    ];
  }

  RegExp emailRegex() {
    final RegExp emailRegex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return emailRegex;
  }

  RegExp phoneregex() {
    final RegExp phoneRegex = new RegExp(r'^[6-9]\d{9}$');
    return phoneRegex;
  }

  Future<String> attemptLogIn(String username, String password) async {
    final myheaders = {
      "Content-type": "application/json",
      "accept": "application/json"
    };
    final json = {"user_email": "$username", "password": "$password"};

    var res = await http.post(
      Uri.parse(objects.signInUrl),
      body: jsonEncode(json),
      headers: myheaders,
    );
    print("Its working");
    print(res.body);
    if (res.statusCode == 200) {
      print("It worked");
      print(res.body);
      return res.body;
    }
    return null;
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<void> getBalance() async {
    final balanceUrl = Uri.parse(objects.balanceUrl);
    final balanceResponse = await http.get(balanceUrl);
    if (balanceResponse.statusCode == 200) {
      return balanceResponse;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get balance');
    }
  }

  Future<void> getFlowRate() async {
    final flowUrl = Uri.parse(objects.balanceUrl);
    final flowResponse = await http.get(flowUrl);
    if (flowResponse.statusCode == 200) {
      return flowResponse;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get the flow rate');
    }
  }

  void addEditMeter(
      {String meterName,
      String meterId,
      String uniqueName,
      String meterAddr,
      int index}) {
    meterObj.meterName = meterName;
    meterObj.meterId = meterId;
    meterObj.uniqueName = uniqueName;
    meterObj.meterAddr = meterAddr;

    if (isAdding)
      meters.add(meterObj);
    else
      meters[index] = meterObj;
  }

  void removeMeter(index) {
    meters.removeAt(index);
  }

  void loadData() {
    Meter meterObj0 = new Meter(
      meterName: "iMan",
      meterId: "0114528455",
      uniqueName: "Ogwangwalu",
      balance: "-20",
      meterState: "OFF",
      meterAddr: "BU-1124-8194",
    );

    Meter meterObj1 = new Meter(
        meterName: "Kwadwo",
        meterId: "0114855",
        uniqueName: "Kwadee",
        balance: "78",
        meterState: "ON",
        meterAddr: "584d-BU");
    Meter meterObj2 = new Meter(
      meterName: "Trek",
      meterId: "011425",
      uniqueName: "Ammobra",
      balance: "15",
      meterState: "ON",
      meterAddr: "584dad-BU",
    );
    Meter meterObj3 = new Meter(
        meterName: "Ojoe",
        meterId: "01145138",
        uniqueName: "Jake",
        balance: "700",
        meterState: "ON",
        meterAddr: "5ghd-BU");
    meters.add(meterObj0);
    meters.add(meterObj1);
    meters.add(meterObj2);
    meters.add(meterObj3);
  }
}
