import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_pool/components/widgets/colorButton.dart';
import 'package:go_pool/components/widgets/textField.dart';
import 'package:go_pool/language/locale.dart';
import 'package:go_pool/theme/colors.dart';

import 'registration_interactor.dart';

class Register extends StatelessWidget {
  final RegistrationInteractor registrationInteractor;
  final String? phoneNumber;

  Register(this.registrationInteractor, this.phoneNumber);
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      locale.register!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      locale.inLessThanAmin!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: FadedScaleAnimation( child:
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Image.asset("assets/img_signin.png"),
                        ),
                      ],
                    ),
                    scaleDuration: const Duration(milliseconds: 600),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  EntryField(locale.fullName, locale.enterFullName, false),
                  EntryField(
                      locale.emailAddress, locale.enterEmailAddress, false),
                  EntryField(
                      locale.phoneNumber, locale.enterMobileNumber, false),
                  // Spacer(),
                  Text(locale.wellSendCode!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15)),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 20,
            start: 20,
            end: 20,
            child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Verification()));
                  registrationInteractor.register(
                      'phoneNumber', 'name', 'email');
                },
                child: FadedScaleAnimation( child:
                  ColorButton(locale.continuee),
                  scaleDuration: const Duration(milliseconds: 600),
                )),
          ),
        ],
      ),
    );
  }
}
