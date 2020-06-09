
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PredictionCart extends StatelessWidget {
  PredictionCart({this.url,this.maxppt,this.cropname,this.maxtemp,this.minppt,this.mintemp});
 final String url,cropname,maxtemp,mintemp,maxppt,minppt;
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
      height: 80,
      width: 335,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(borderRadius: BorderRadius.circular(13),child: Image(image: NetworkImage(url),)),
          SizedBox(width: 25,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(cropname, style: TextStyle(
                  fontSize: 20, fontFamily: 'Righteous'
              ),),
              Row(mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Max Temp: '+maxtemp, style: TextStyle(
                      fontSize: 17, fontFamily: 'Righteous',color: Colors.black54
                  ),),
                  SizedBox(width: 10,),
                  Text('Max PPT: '+maxppt, style: TextStyle(
                      fontSize: 17, fontFamily: 'Righteous',color: Colors.black54
                  ),),
                ],
              ),
              Row(mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Min Temp: '+mintemp, style: TextStyle(
                      fontSize: 17, fontFamily: 'Righteous',color: Colors.black54
                  ),),
                  SizedBox(width: 15,),
                  Text('Min PPT: '+minppt, style: TextStyle(
                      fontSize: 17, fontFamily: 'Righteous',color: Colors.black54
                  ),),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}