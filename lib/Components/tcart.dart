
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingCart extends StatelessWidget {
  TrendingCart({this.url,this.name,this.price});
  final String url,name,price;
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.grey[200],
        boxShadow:[ BoxShadow(
          offset: Offset(0, 5),
          color: Colors.white,
          blurRadius: 20,
        ),],
      ),
      height: 100,
      width: 300,
      child: Row(
        children: <Widget>[
          ClipRRect(borderRadius: BorderRadius.circular(13),child: Image(image: AssetImage(url),)),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(name, style: TextStyle(
                  fontSize: 22, fontFamily: 'Righteous'
              ),),
              Text('Market Price:', style: TextStyle(
                  fontSize: 18, fontFamily: 'Righteous',color: Colors.black54
              ),),
              Text(price, style: TextStyle(
                  fontSize: 18, fontFamily: 'Righteous',color: Colors.black54
              ),),
            ],
          )
        ],
      ),
    );
  }
}