import 'package:flutter/material.dart';
import 'package:go_pool/theme/colors.dart';

class ColorButton extends StatelessWidget {
  final String? title;
  ColorButton(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: primaryColor),
      child: Center(
          child: Text(
        title!.toUpperCase(),
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 15,
            letterSpacing: 3,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
