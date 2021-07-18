import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwc/Pages/LogIn.dart';
import 'package:gwc/helpers/my_textStyles.dart';

class IntroSlider extends StatefulWidget {

  IntroSlider();

  @override
  IntroSliderState createState() => new IntroSliderState();
}


class IntroSliderState extends State<IntroSlider> {

  List<Wizard> wizardData = Dummy.getWizard();
  PageController pageController = PageController(
    initialPage: 0,
  );
  int page = 0;
  bool isLast = false;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(0), child: Container(color: Colors.grey[100])),
      body: Container(
        width: double.infinity, height: double.infinity,
        child: Column(children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                PageView(
                  onPageChanged: onPageViewChange,
                  controller: pageController,
                  children: buildPageViewItem(),
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.grey),
                      onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogIn()),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 60,
              child: Align(
                alignment: Alignment.topCenter,
                child: buildDots(context),
              ),
            ),
          ),
          Container(
            width: double.infinity, height: 50,
            child: FlatButton(
              child: Text(isLast ? "GOT IT" : "NEXT", style: MyText.subhead(context).copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold
              )),
              color: Colors.grey,
              onPressed: (){
                if(isLast){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogIn()),
                        );
                }
                pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeOut);
              },
            ),
          )
        ]),
      ),
    );
  }

  void onPageViewChange(int _page) {
    page = _page;
    isLast = _page == wizardData.length-1;
    setState(() {});
  }

  List<Widget> buildPageViewItem(){
    List<Widget> widgets = [];
    for(Wizard wz in wizardData){
      Widget wg = Container(
        padding: EdgeInsets.all(35),
        alignment: Alignment.center,
        width: double.infinity, height: double.infinity,
        child: Wrap(
          children : <Widget>[
            Container(
              width: 280,
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(35),
                        child: Image.asset("images/${wz.image}", width: 150, height: 150, ),
                      ),
                      Text(wz.title, style: MyText.medium(context).copyWith(color: Colors.grey, fontWeight: FontWeight.bold)),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: Text(wz.brief, textAlign : TextAlign.center, style: MyText.subhead(context).copyWith(
                            color: Colors.grey
                        )),
                      ),
                    ],
                  )
                ],
              )
            )
          ],
        ),
      );
      widgets.add(wg);
    }
    return widgets;
  }

  Widget buildDots(BuildContext context){
    Widget widget;

    List<Widget> dots = [];
    for(int i=0; i<wizardData.length; i++){
      Widget w = Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 8,
        width: 8,
        child: CircleAvatar(
          backgroundColor: page == i ? Colors.blue[400] : Colors.grey,
        ),
      );
      dots.add(w);
    }
    widget = Row(
      mainAxisSize: MainAxisSize.min,
      children: dots,
    );
    return widget;
  }

}


class Wizard {

  String image;
  String background;
  String title;
  String brief;
  Color color;

}

class Dummy {

  static List<Wizard> getWizard() {
    List<Wizard> items = [];
    for (int i = 0; i < wizard_title.length; i++) {
      Wizard obj = new Wizard();
      obj.image = wizard_image[i];
      obj.background = wizard_background[i];
      obj.title = wizard_title[i];
      obj.brief = wizard_brief[i];
      obj.color = wizard_color[i];
      items.add(obj);
    }
    return items;
  }

   static const List<String> wizard_title = [
    "Add Multiple Meters", "Top Up with Mobile Money or Card", "Borrow Credit", "Customer Support"
  ];

  static const List<String> wizard_image = [
    "meter.jpg","topUp.png",  "borrowing.png", "support.png",
  ];

  static const List<String> wizard_background = [
    "image_15.jpg", "image_10.jpg", "image_3.jpg", "image_12.jpg"
  ];

  static const List<Color> wizard_color = [
    Colors.red,
    Colors.blueGrey,
    Colors.purple,
    Colors.orange,
  ];

   static const List<String> wizard_brief = [
    "You can have more meters linked to your account.",
    "You can pay bills with any mobile money wallet, visa or mastercard. ",
    "Borrow meter credit with a click of a button.",
    "Quickly send queries and issues via inbuilt customer support channels.",
  ];

}

