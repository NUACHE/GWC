import 'package:get/get.dart';
import 'package:gwc/Model/MeterClass.dart';

class AddMeterCont extends GetxController {
  Meter meterObj = Meter();
  var meters = [].obs;
  //var meters = List<Meter>().obs;
  void addMeter(
      {String meterName, String meterId, String uniqueName, String meterAddr}) {
    meterObj.meterName = meterName;
    meterObj.meterId = meterId;
    meterObj.uniqueName = uniqueName;
    meterObj.meterAddr = meterAddr;

    meters.add(meterObj);
  }
}
