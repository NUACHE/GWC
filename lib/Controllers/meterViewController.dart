import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gwc/Model/Objects.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:gwc/helpers/my_textStyles.dart';

class MeterViewCont extends GetxController {
  final MyObjects objectsCont = Get.find();

  showConfirmDialog(BuildContext context, index) {
    String selectedMeterName = objectsCont.meters[index].meterName;
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.primary,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: EdgeInsets.all(9),
          child: Text(
            "Cancel",
            style: MyText.medium(context),
          ),
        ),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = FlatButton(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red[500],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: EdgeInsets.all(9),
          child: Text(
            "Delete",
            style: MyText.medium(context),
          ),
        ),
      ),
      onPressed: () {
        objectsCont.removeMeter(index);
        Get.back();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(
        child: Text(
          "Confirm Delete Action",
          style: MyText.medium(context),
        ),
      ),
      content: Text(
        "Would you like to delete the selected meter: " +
            selectedMeterName +
            " ?",
        style: MyText.medium(context),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
