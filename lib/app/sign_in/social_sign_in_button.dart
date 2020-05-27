import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widget/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        assert(assetName != null),
        super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(assetName),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15.0),
                ),
                Opacity(
                    opacity: 0,
                    child: Image.asset(
                      assetName,
                    )),
              ],
            ),
            color: color,
            height: 40.0,
            onPressed: onPressed);
}
