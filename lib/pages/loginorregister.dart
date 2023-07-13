import 'package:flutter/material.dart';
import 'package:loginpage/pages/login_page.dart';
import 'package:loginpage/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showloginPage = true;

  void tooglepages() {
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showloginPage) {
      return LoginPage(
        onTap: tooglepages
      );
    } else {
      return RegisterPage(
        onTap: tooglepages
      );
    }
  }
}