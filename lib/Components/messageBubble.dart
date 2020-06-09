

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
 MessageBubble({this.text,this.isMe});
 final  String text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: <Widget>[
          Material(
              elevation: 5.0,
              color: isMe?Colors.lightBlueAccent:Colors.white,
              child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(text, style: TextStyle(
                      color: isMe?Colors.white:Colors.black, fontSize: 16
                  ),)),
              borderRadius: isMe?BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)):
              BorderRadius.only(topRight: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
          ),
        ],
      ),
    );
  }
}
