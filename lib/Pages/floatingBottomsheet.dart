part of 'DashBoard.dart';

class Helper {
  static GlobalKey<ScaffoldState> _scaffoldKey;

  static void init(GlobalKey<ScaffoldState> key) {
    _scaffoldKey = key;
  }

 /*  static Future<void> logout(BuildContext context) async {
    await injector<RemoteAuthRepository>().logout();

    // ignore: unawaited_futures
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
      (Route<dynamic> route) => false,
    );
  }

  static void navigateToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (_) => page),
    );
  }

  static Future<void> openTerms(BuildContext context) async {
    final url = 'https://uellosend.uvitechgh.com/terms.html';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showSnackbar(context, 'Please install a browser to view.');
    }
  } */

  static  void _showSheet(BuildContext context) {
     showModalBottomSheet(context: context, builder: (BuildContext bc){
      return Card(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5)),
        elevation: 5, margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Support", style: MyText.title(context).copyWith(color: Colors.grey[800])),
                          SizedBox(height: 10,),
                          Text("Please choose a channel", style: MyText.caption(context).copyWith(color: Colors.grey[600])),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.grey[600]),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Divider(),
               
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => _email(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('EMAIL', style: MyText.subhead(context).copyWith(color: Colors.grey[800])),
                      ],
                    ),
                  )),
             
                Divider(),
                 InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => _whatsApp(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WHATSAPP', style: MyText.subhead(context).copyWith(color: Colors.grey[800])),
                      ],
                    ),
                  )),
             
               
              
              ],
            )
        ),
      );
    });
   
  }

  static void _whatsApp(BuildContext context) async {
    Navigator.pop(context);

    const url = 'https://wa.me/233543524033';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showSnackbar(context, 'Please install WhatsApp or a browser.');
    }
  }

  static void _email(BuildContext context) async {
    Navigator.pop(context);

    final params = Uri(scheme: 'mailto', path: 'support@digimeter.com');
    final url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showSnackbar(context, 'Please install a browser to view.');
    }
  }

  static void _showSnackbar(BuildContext context, String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Please install a browser to view.'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          onPressed: () {
            _scaffoldKey.currentState.removeCurrentSnackBar();
          },
          label: 'OKAY',
          textColor: Colors.yellow,
        ),
      ),
    );
  }
}
