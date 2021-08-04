import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///method widget loading
Widget wAppLoading(BuildContext context){
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

///navigator push
Future wPushTo(BuildContext context, Widget widget){
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

///navigator pushReplace
Future wPushReplaceTo(BuildContext context, Widget widget){
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}


Widget wInputSubmit({required BuildContext context, required String title, required Function() onPressed}) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(shape: MaterialStateProperty.all(StadiumBorder())),
          child: Text(title),
          onPressed: onPressed,
        ));
  }

Future wShowToast(String pesan){
  return Fluttertoast.showToast(
    msg: pesan,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG);
}
  