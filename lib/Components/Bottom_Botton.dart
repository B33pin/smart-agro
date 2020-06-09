import 'package:flutter/material.dart';
import '../constants.dart';
class BottomBotton extends StatelessWidget {
  BottomBotton({@required this.buttonTitle, this.ontap});
 final Function ontap;
 final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green[300],
        ),
        width: double.infinity,
        height: 70.0,
        margin:
        EdgeInsets.only(top: 2.0, bottom: 3.0, left: 0.0, right: 0.0),
        child: Center(
          child: Text(buttonTitle, style: kTextStylee),
        ),
      ),
    );
  }
}

