import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_pool/language/locale.dart';
import 'package:go_pool/screens/home/chats/chats.dart';
import 'package:go_pool/screens/home/home/home.dart';
import 'package:go_pool/screens/home/more/more.dart';
import 'package:go_pool/screens/home/myTrips/myTrips.dart';
import 'package:go_pool/theme/colors.dart';

class NavigationHome extends StatefulWidget {
  int currentIndex;
  NavigationHome([this.currentIndex = 0]);
  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  final List<Widget> routes = [Home(), MyTrips(), Chats(), More()];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: routes[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 17,
        onTap: (value) {
          setState(() {
            widget.currentIndex = value;
          });
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[400],
        currentIndex: widget.currentIndex,
        showSelectedLabels: true,
        selectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black, fontSize: 10),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black, fontSize: 10),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              label: locale.home,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FadedScaleAnimation( child:
                  Icon(Icons.drive_eta),
                  scaleDuration: const Duration(milliseconds: 500),
                ),
              )),
          BottomNavigationBarItem(
              label: locale.myTrips,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FadedScaleAnimation( child:
                  Icon(Icons.navigation),
                  scaleDuration: const Duration(milliseconds: 500),
                ),
              )),
          BottomNavigationBarItem(
              label: locale.chats,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FadedScaleAnimation( child:
                  Icon(Icons.chat),
                  scaleDuration: const Duration(milliseconds: 500),
                ),
              )),
          BottomNavigationBarItem(
              label: locale.more,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FadedScaleAnimation( child:
                  Icon(
                    Icons.more_horiz,
                  ),
                  scaleDuration: const Duration(milliseconds: 500),
                ),
              )),
        ],
      ),
    );
  }
}
