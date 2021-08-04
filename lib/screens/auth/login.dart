import 'package:ewallet_flutter/screens/auth/forgot_password.dart';
import 'package:ewallet_flutter/screens/auth/register.dart';
import 'package:ewallet_flutter/screens/home/home.dart';
import 'package:ewallet_flutter/widgets/widgets.dart';
import 'package:ewallet_flutter/widgets/widgets_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  Widget _authTitle() {
    return wAuthTitle(title: 'Login', subtitle: 'Enter your email & password');
  }

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(hintText: 'Email'),
      ),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextField(
            controller: _password,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Text('Forgot Password ?')),
      ),
      onTap: () => wPushTo(context, ForgotPassword())
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, title: 'Login', onPressed: _loginSementara);
  }

  Widget _textDivider() {
    return wTextDivider();
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(
      onPressed: () {},
    );
  }

  Widget _textRegister() {
    return wTextLink(
        text: 'Dont have an account yet ?', title: 'Register',
         onTap: () => wPushReplaceTo(context, Register( )));

    // return Container(
    //   margin: EdgeInsets.only(top: 40),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Text('Dont have an account yet ?'),
    //       GestureDetector(
    //         child: Container(
    //           padding: EdgeInsets.all(10),
    //           color: Colors.transparent,
    //           child: Text(
    //             'Register',
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //         onTap: () {},
    //       )
    //     ],
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _authTitle(),
                    _inputEmail(),
                    _inputPassword(),
                    _forgotPassword(),
                    _inputSubmit(),
                    _textDivider(),
                    _googleSignIn(),
                    _textRegister(),
                  ],
                ),
              )),
    );
  }

  void _loginSementara() async {
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
