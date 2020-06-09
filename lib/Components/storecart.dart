
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class StoreCart extends StatelessWidget {
  StoreCart({this.url,this.name,this.price});
  final String url,name,price;
  @override
  Widget build(BuildContext context) {
    String yourname='null',phone='null';
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );
    return GestureDetector(
      onTap: (){
        Alert(
            context: context,
            type: AlertType.warning,
            style: alertStyle,
            title: "Want to Buy or Sell?",
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: 'Your Name',
                  ),
                  onChanged: (value){
                    yourname=value;
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Your Number',
                  ),
                  onChanged: (value){
                    phone=value;
                  },
                ),
              ],
            ),
            buttons: [
              DialogButton(
                child: Text(
                  "Buy",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async { await Alert(
                  style: alertStyle,
                  context: context,
                  content: Column(
                    children: <Widget>[
                      Divider(
                        thickness: 1,
                      ),
                      Text('Name: '+ yourname,style: TextStyle(fontSize: 20, fontFamily: 'Righteous',color: Colors.green),),
                      SizedBox(height: 5,),
                      Text('Number: '+phone,style: TextStyle(fontSize: 20, fontFamily: 'Righteous',color: Colors.green),)
                    ],
                  ),
                  type: AlertType.success,
                  title: "Order Confirmed",
                  desc: "Your order has been placed please wait for our team response. Thankyou!",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                      width: 120,
                    )
                  ],
                ).show();
                Navigator.of(context, rootNavigator: true).pop();
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
              ),
              DialogButton(
                child: Text(
                  "Sell",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed:  () async { await Alert(
                  style: alertStyle,
                  context: context,
                  content: Column(
                    children: <Widget>[
                      Divider(
                        thickness: 1,
                      ),
                      Text('Name: '+ yourname,style: TextStyle(fontSize: 20, fontFamily: 'Righteous',color: Colors.green),),
                      SizedBox(height: 5,),
                      Text('Number: '+phone,style: TextStyle(fontSize: 20, fontFamily: 'Righteous',color: Colors.green),)
                    ],
                  ),
                  type: AlertType.success,
                  title: "Request Submitted",
                  desc: "Your sell request has been placed please wait for our team response. Thankyou!",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                      width: 120,
                    )
                  ],
                ).show();
                Navigator.of(context, rootNavigator: true).pop();
                },
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(116, 116, 191, 1.0),
                  Color.fromRGBO(52, 138, 199, 1.0)
                ]),
              )
            ]).show();
      },
      child: Container(margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.grey[200],
            boxShadow:[ BoxShadow(
              offset: Offset(0, 2),
              color: Colors.white,
              blurRadius: 20,
            ),],
          ),
          height: 70,
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(borderRadius: BorderRadius.circular(13),child: Image(image: AssetImage(url),)),
              SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(name, style: TextStyle(
                        fontSize: 21, fontFamily: 'Righteous',color: Colors.black),),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Instock: ', style: TextStyle(
                        fontSize: 21, fontFamily: 'Righteous',color: Colors.black54),),
                    Text(price, style: TextStyle(
                        fontSize: 21, fontFamily: 'Righteous',color: Colors.black54),),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}