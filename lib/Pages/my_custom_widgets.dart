import 'package:flutter/material.dart';
import 'package:gwc/helpers/my_colors.dart';
import 'package:gwc/helpers/my_textStyles.dart';
import 'package:shimmer/shimmer.dart';

showLoading(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text('  Loading'),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class LoadingMeters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
              height: 65,
              child: ListTile(
                onTap: () {
                  //widget.bottomSheetObj.showEditSheet(context, widget.myIndex);
                },
                title: Text(
                  "Meter Name:",
                ),
                subtitle: Text(
                  "ID: ",
                ),
                trailing: InkWell(onTap: () {}, child: Icon(Icons.delete)),
              )),
        ),
      ),
    );
  }
}

class CustomFlatButton extends StatelessWidget {
  final String yourText;
  final Function yourFunction;

  const CustomFlatButton({Key key, this.yourText, this.yourFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      child: FlatButton(
        child: Text(yourText,
            style: MyText.subhead(context).copyWith(color: Colors.white)),
        color: MyColors.primary,
        onPressed: yourFunction,
      ),
    );
  }
}
