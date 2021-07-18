import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gwc/Pages/EditUser.dart';
import 'package:gwc/Pages/MeterView.dart';
import 'package:gwc/Pages/settings.dart';
import 'package:gwc/helpers/my_textStyles.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:paystack_manager/paystack_pay_manager.dart';
import 'UserInfo.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

part 'floatingBottomsheet.dart';

class DashBoard extends StatefulWidget {
//  DashBoard();

  @override
  DashBoardState createState() => new DashBoardState();
}

class DashBoardState extends State<DashBoard> {

  PersistentBottomSheetController sheetController;
  BuildContext _scaffoldCtx;
  bool showSheet = false;
  final storage = FlutterSecureStorage();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
          elevation: 1,
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () async {
           String value = await storage.read(key: "first_name");
           print(value);
            },
            child: Text("Welcome",
                style: MyText.title(context).copyWith(
                  color:Colors.blue,
                )),
          ),
         
         ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
           
//            Text("Pay Your Bills",
//                style: MyText.medium(context).copyWith(
//                    color: MyColors.grey_90, fontWeight: FontWeight.bold)),
//            Container(height: 10),
            Row(
              children: <Widget>[
                Container(width: 15),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                      _checkPayment();
                    },
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.money,
                                size: 35, color: Colors.blue),
                            Container(height: 18),
                            Text("TOP UP",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 6),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserInfo()),
                      );
                    },
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width:  double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.bar_chart,
                                size: 35, color: Colors.blue),
                            Container(height: 15),
                            Text("TOP UP HISTORY",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              
                Container(width: 15),
              ],
            ),
            Container(height: 6),
            Row(
              children: <Widget>[
                Container(width: 15),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                     
                        Helper._showSheet(context);
                      
                    },
                    
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.contact_phone,
                                size: 35, color: Colors.blue),
                            Container(height: 18),
                            Text("SUPPORT",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 6),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyMeter()),
                      );
                    },
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.invert_colors,
                                size: 35, color: Colors.blue),
                            Container(height: 18),
                            Text("METER ",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 6),
                Expanded(
                  child: InkWell(
                      splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.settings,
                                size: 35, color: Colors.blue),
                            Container(height: 18),
                            Text("SETTINGS",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 15),
              ],
            ),
            Container(height: 30),
          ],
        ),
      ),
    );
  }

  void _checkPayment(){
    try{
      PaystackPayManager(context: context)
      ..setSecretKey("sk_test_cb859b103a9e82864c7dd83893960d234c144286")
      ..setCompanyAssetImage(Image(image: AssetImage('images/icons8_plumbing_48px.png')))
      ..setAmount(100000)
      ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
      ..setCurrency("GHS")
      ..setEmail("famousmichael71@gmail.com")
      ..setFirstName("Michael")
      ..setLastName("Opoku")
      ..setMetadata({
        "custom_fields": [
         { "value": "TechWith Michael",
          "display_name": "Payment_to",
          "variable_name": "Payment_to"}
        ]
      })..onSuccesful(_onPaymentSuccessful)
      ..onPending(_onPaymentPending)
      ..onFailed(_onPaymentFailed)
      ..onCancel(_onCancel)
      ..initialize();
    }catch(error){
      print("Payment error --- $error");
    }

   

  }
  void _onPaymentSuccessful(Transaction transaction){
    print('Success');
    print("transaaction message --> ${transaction.message}, Ref ${transaction.refrenceNumber}");
  }
  void _onPaymentPending(Transaction transaction){
    print('Pending');
     print("transaaction message --> ${transaction.message}, Ref ${transaction.refrenceNumber}");
  }
  void _onPaymentFailed(Transaction transaction){
    print('Failed');
     print("transaaction message --> ${transaction.message}, Ref ${transaction.refrenceNumber}");
  }
  void _onCancel(Transaction transaction){
    print('cancelled');
     print("transaaction message --> ${transaction.message}, Ref ${transaction.refrenceNumber}");
  }

 
}
