import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget wAuthTitle({required String title, required String subtitle}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3),
          Text(subtitle)
        ],
      ),
    );
  }

Widget wTextDivider(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('OR CONNECT WITH',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey
              ),
            ),
          ),
          Expanded(child: Divider()),
        ],
      ),
    );
  }

Widget wGoogleSignIn({required Function() onPressed}){
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(MdiIcons.google, size: 20,), 
        label: Text('Google'),
        onPressed: onPressed,
      ), 
    );
  }

  Widget wTextLink({required String text, required String title, required Function() onTap}) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.transparent,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            onTap: onTap,
          )
        ],
      ),
    );
  }