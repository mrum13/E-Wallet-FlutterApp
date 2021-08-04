import 'package:ewallet_flutter/screens/auth/login.dart';
import 'package:ewallet_flutter/screens/home/home.dart';
import 'package:ewallet_flutter/widgets/widgets.dart';
import 'package:ewallet_flutter/widgets/widgets_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConf = TextEditingController();

  
  bool _isLoading = false;

  Widget _authTitle() {
    return wAuthTitle(title: 'Register', subtitle: 'Fill the form to register');
  }

  Widget _inputName() {
    return Container(
      child: TextField(
        controller: _name,
        decoration: InputDecoration(
          hintText: 'Name',
          helperText: 'Enter Full Name'),
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
          hintText: 'Email',
          helperText: 'Enter Email'),
      ),
    );
  }

  Widget _inputPassword() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
              controller: _password,
              decoration: InputDecoration(
                hintText: '******',
                helperText: 'Password'
              ),
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: TextField(
              controller: _passwordConf,
              decoration: InputDecoration(
                hintText: '******',
                helperText: 'Confirm Password'
              ),
          ),
        ),
      ],
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, title: 'Register', onPressed: _registerSementara);
  }

  Widget _textDivider() {
    return wTextDivider();
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(
      onPressed: () {},
    );
  }

  Widget _textLogin() {
    return wTextLink(
        text: 'Already have an account?',
        title: 'Login',
        onTap: () => wPushReplaceTo(context, Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      _authTitle(),
                      _inputName(),
                      _inputEmail(),
                      _inputPassword(),
                      SizedBox(height: 30,),
                      _inputSubmit(),
                      _textDivider(),
                      _googleSignIn(),
                      _textLogin(),
                    ],
                  ),
                ),
              )),
    );
  }

  void _registerSementara() async {
    if (_email.text == 'admin' && _password.text == 'admin') {
      setState(() {
        _isLoading = true;
      });
      
      await Future.delayed(Duration(seconds: 3));
      wPushReplaceTo(context, Home());
    } else {
      print('GAGAL');
    }
  }
}
