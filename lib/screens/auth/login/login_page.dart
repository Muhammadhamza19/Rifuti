import 'package:flutter/material.dart';
import 'package:go_pool/screens/auth/login/login.dart';
import 'package:go_pool/screens/home/more/changeLanguage.dart';

import '../login_navigator.dart';
import 'login_interactor.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginInteractor {
  @override
  void initState() {
    super.initState();
    _showLanguageSheet();
  }

  _showLanguageSheet() => Future.delayed(
        const Duration(milliseconds: 100),
        () => showModalBottomSheet(
          context: context,
          builder: (context) => ChangeLanguage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Login(this);
  }

  @override
  void loginWithPhone(String isoCode, String mobileNumber) {
    Navigator.pushNamed(context, LoginRoutes.verification,
        arguments: isoCode + mobileNumber);
  }

  @override
  void loginWithFacebook() {
    Navigator.pushNamed(context, LoginRoutes.registration);
  }

  @override
  void loginWithGoogle() {
    Navigator.pushNamed(context, LoginRoutes.registration);
  }
}
