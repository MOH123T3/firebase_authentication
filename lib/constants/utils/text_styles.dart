import 'package:flutter/cupertino.dart';

class TextStyles {
  static headingTextStyle(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
static leadingTextStyle(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    );
  }
  static titleTextStyle(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    );
  }

  static titleBTextStyle(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
  static subTitleTextStyle(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,),
      textAlign: TextAlign.center,
    );
  }
}
