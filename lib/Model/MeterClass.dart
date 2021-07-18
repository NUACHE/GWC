import 'package:get/get.dart';

class Meter extends GetxController {
  String meterName;
  String meterId;
  String uniqueName;
  String balance;
  String meterAddr;
  String meterState;

  Meter({
    this.meterAddr,
    this.meterName,
    this.meterId,
    this.uniqueName = "",
    this.balance,
    this.meterState,
  });
  getMeterBalance() {
    return this.balance;
  }

  getMeterAddr() {
    return this.meterAddr;
  }

  setMeterAddr() {
    this.meterAddr = meterAddr;
  }

  getMeterName() {
    return this.meterName;
  }

  setMeterName() {
    this.meterName = meterName;
  }

  getMeterId() {
    return this.meterId;
  }

  setMeterId() {
    this.meterId = meterId;
  }

  getUniqueName() {
    return this.uniqueName;
  }

  setUniqueName() {
    this.uniqueName = uniqueName;
  }

  setMeterState() {
    this.meterState = meterState;
  }

  getMeterState() {
    return this.meterState;
  }
}
