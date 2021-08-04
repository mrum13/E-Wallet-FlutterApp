import 'package:ewallet_flutter/widgets/widgets.dart';
import 'package:ewallet_flutter/widgets/widgets_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isLoading = false;
  TextEditingController _email = TextEditingController();

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
          hintText: 'Email',
          helperText: 'Enter your email',
        ),
      ),
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, title: 'Send', onPressed: _loginSementara);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            ),
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,),
                    wAuthTitle(
                      title: 'Forgot Password',
                      subtitle: 'Enter your email and we\'ll send you a link \nto reset your password'
                    ),
                    _inputEmail(),
                    SizedBox(height: 30,),
                    _inputSubmit()
                  ],
                ),
              )),
    );
  }

  void _loginSementara() async {
    if (_email.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      print('BERHASIL');
      await Future.delayed(Duration(seconds: 2));
      wShowToast('Email Sended! Please check your email to reset password.');
      Navigator.pop(context);
    } else {
      print('GAGAL');
    }
  }
}