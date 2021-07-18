import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwc/Model/Objects.dart';
import 'package:gwc/Pages/DashBoard.dart';
import 'package:gwc/Pages/ForgotPassword.dart';
import 'package:gwc/Pages/IntroSlider.dart';
import 'package:gwc/Pages/MeterView.dart';
import 'package:gwc/Pages/SignUp.dart';
import 'Model/MeterClass.dart';
import 'helpers/my_colors.dart';
import 'Pages/LogIn.dart';
import 'dart:async';
import 'widget/custom_tests.dart';
import 'helpers/images.dart';
import 'Pages/UserInfo.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // initialBinding:
        //   BindingsBuilder(() => {Get.put(MyObjects(), permanent: true)}),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: MyColors.primary,
            accentColor: MyColors.primary,
            primaryColorDark: MyColors.primaryDark,
            primaryColorLight: MyColors.primaryLight,
            bottomSheetTheme:
                BottomSheetThemeData(backgroundColor: Colors.transparent)),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/LoginRoute': (BuildContext context) => new LogIn(),
          '/ForgotPasswordRoute': (BuildContext context) =>
              new ForgotPassword(),
          '/DashBoardRoute': (BuildContext context) => new DashBoard(),
          '/SignUpRoute': (BuildContext context) => new SignUp(),
          '/DashboardStatisticsRoute': (BuildContext context) => new UserInfo(),
          '/MyMeter': (BuildContext context) => new MyMeter(),
          '/IntroSlider': (BuildContext context) => new IntroSlider(),
        });
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/IntroSlider');
  }

  @override
  void initState() {
    super.initState();
    //  SQLiteDb dbHelper = SQLiteDb();
    //dbHelper.init();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        child: Container(
          width: 105,
          height: 350,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                child: Image.asset(Img.get('icons8_plumbing_48px.png'),
                    color: MyColors.primary, fit: BoxFit.cover),
              ),
              Container(height: 10),
              Text("Ghana Water Company",
                  style: MyText.headline(context).copyWith(
                      color: Colors.grey[800], fontWeight: FontWeight.w600)),
              Text("Convenience at its best",
                  style: MyText.body1(context)
                      .copyWith(color: Colors.grey.shade500)),
              Container(height: 20),
              Container(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(MyColors.primaryLight),
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
