
import 'package:flutter/material.dart';
class Reusable_Card extends StatelessWidget {
  Reusable_Card({@required this.colour, this.CardChild, this.onpress});
  final Color colour;
  final Widget CardChild;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: CardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}