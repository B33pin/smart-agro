
import 'package:flutter/material.dart';
class DisplayParameters extends StatelessWidget {
  DisplayParameters({this.icn,this.name,this.value, this.colour});
  final String value, name;
  final Icon icn;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          CircleAvatar(
              radius: 30,
              backgroundColor: colour,
              child: icn
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(value, style: TextStyle(fontFamily: 'Righteous', fontSize: 17)),
              Text(name,style: TextStyle(fontFamily: 'Righteous', fontSize: 15, color: Colors.black54))
            ],
          ),
        ],
      ),
    );
  }
}

