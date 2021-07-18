class Meter {
  String meterName;
  String meterId;
  String uniqueName;
  String balance;
  List<Meter> meters = [];
  String meterState;

  Meter({
    this.meterName,
    this.meterId,
    this.uniqueName = "",
    this.balance,
    this.meterState,
  });
  getMeterBalance() {
    return this.balance;
  }

  setMeterBalance() {
    this.balance = balance;
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

  List<Meter> getList() {
    return meters;
  }

  addMeterList(Meter meterObj) {
    meters.add(meterObj);
  }
}
