import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:go_pool/components/widgets/colorButton.dart';
import 'package:go_pool/components/widgets/textField.dart';
import 'package:go_pool/language/locale.dart';

import 'package:go_pool/screens/auth/login_navigator.dart';
import 'package:go_pool/theme/colors.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<Widget> tabs = <Widget>[
      Tab(text: locale.profileInfo),
      Tab(text: locale.accountInfo),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          bottom: PreferredSize(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: backgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                locale.myProfile!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                locale.everythingAboutyou!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          Spacer(),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              FadedScaleAnimation( child:
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: 90,
                                  child:
                                      Image.asset("assets/profiles/img1.png"),
                                ),
                                scaleDuration: const Duration(milliseconds: 600),
                              ),
                              CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 13,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 13,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      alignment: Alignment.topLeft,
                      child: TabBar(
                        indicatorWeight: 4.0,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: tabs,
                        isScrollable: true,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 13.5),
                        labelColor: primaryColor,
                        indicatorColor: primaryColor,
                        unselectedLabelColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(150)),
        ),
        body: TabBarView(children: [ProfileInfo(), AccountInfo()]),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    EntryFieldR(locale.companyName, "Opus Labworks", false),
                    EntryFieldR(
                        locale.corporateEmail, "samantha@opuslabs.com", true),
                  ],
                ),
              ),
              Divider(
                thickness: 3,
                color: backgroundColor,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      locale.govtId!,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey, fontSize: 13),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "GovernmentId.pdf",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor, fontSize: 13),
                        ),
                        Spacer(),
                        Icon(
                          Icons.verified_user,
                          color: primaryColor,
                          size: 17,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      locale.drivingLicense!,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey, fontSize: 13),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "License.pdf",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: primaryColor, fontSize: 13),
                        ),
                        Spacer(),
                        Icon(
                          Icons.verified_user,
                          color: primaryColor,
                          size: 17,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 3,
                color: backgroundColor,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    EntryFieldR(locale.shortBio, locale.jolly, false),
                    EntryFieldR(locale.hobbies, locale.listeningMusic, false),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 55,
                    child: FadedScaleAnimation( child:
                      ColorButton(locale.continuee),
                      scaleDuration: const Duration(milliseconds: 600),
                    ))),
          )
        ],
      ),
    );
  }
}

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return FadedSlideAnimation( child: 
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              locale.fullName!,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey, fontSize: 13),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Samantha Smith",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.black, fontSize: 13),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              locale.emailAddress!,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey, fontSize: 13),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "samantha@mail.com",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.black, fontSize: 13),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              locale.phoneNumber!,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey, fontSize: 13),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "+1 98 654 3210",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.black, fontSize: 13),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginNavigator()));
              },
              child: Text(
                "Logout",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: primaryColor, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
      beginOffset: Offset(0.4, 0),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}
