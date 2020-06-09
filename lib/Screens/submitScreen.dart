import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartagro/Components/Bottom_Botton.dart';
import 'package:smartagro/Components/Reusable.dart';
import 'package:smartagro/main.dart';
final _firestore = Firestore.instance;
bool test = false;
class SubmitScreen extends StatefulWidget {
  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  DateTime selectedDate = DateTime.now();
  double ph =7.0;
  String message;
  String datepass;

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child:  Container(
            height: 80,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 40),
                Center(child: Text('Sending Information', style: TextStyle(fontSize: 20, fontFamily: 'Righteous'),),),
              ],
            ),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 2), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
  }
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container( padding: EdgeInsets.fromLTRB(20, 30, 10, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Submit Information', style: TextStyle(
            color: Colors.lightBlueAccent, fontFamily: 'Righteous', fontSize: 22
          ),),
          SizedBox(
            height: 16,
          ),
          ColumnSuper(alignment: Alignment.topRight,
            innerDistance: -130,
            children: <Widget>[
              Text('Fill the correct information for requesting prediction and click on continue', style: TextStyle(
                fontSize: 18, color: Colors.black54, fontFamily: 'Righteous'
              ),),
              Image(height: 100,width: 90,image: AssetImage('images/agro.png')),
            ],
          ),
          SizedBox(height: 30,),
          Divider(thickness: 1,),
          Row(
            children: <Widget>[
              Text('Enter Your Name', style: TextStyle(fontFamily: 'Righteous', fontSize: 21,color: Colors.black54),),
              SizedBox(width: 10,),
              Icon(Icons.streetview, color: Colors.black54,size: 20,),
            ],
          ),
          SizedBox(height: 5,),
          textFields(name: 'Enter Your Name',txtiptype: TextInputType.text,),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Text('Enter Your ID', style: TextStyle(fontFamily: 'Righteous', fontSize: 21,color: Colors.black54),),
              SizedBox(width: 10,),
              Icon(Icons.account_circle, color: Colors.black54,size: 20,),
            ],
          ),
          SizedBox(height: 5,),
          textFields(name: 'Enter Your ID',txtiptype: TextInputType.number,),
          Divider(thickness: 1,),
          Container(
            child: Reusable_Card(
                colour: Colors.grey[200],
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 5,),
                    Text(
                      "Select PH",style: TextStyle(fontSize: 20, fontFamily: 'Righteous', color: Colors.black54),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(ph.toStringAsFixed(2),style: TextStyle(color: Colors.black, fontFamily: 'Righteous', fontSize: 30),),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: ph,
                          min: 0.0,
                          max: 10.0,
                          divisions: 999,
                          activeColor: Colors.blue,
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              ph = newValue;
                            });
                          }),
                    ),
                    GestureDetector(onTap: (){},child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have ph? Select 0, ", style: TextStyle(fontFamily: 'Righteous'),),
                        GestureDetector(onTap: (){
                          _onLoading();
                          _firestore.collection('messages').add({
                            'text': 'I need a PH test request!',
                            'date': DateTime.now().toIso8601String().toString(),
                            'isme': true
                          });
                          Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => MyApp(counter: 3,test: 'hello'),
                      transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 1000),
                    ),
                  );
                        },child: Text(" Request here!", style: TextStyle(fontFamily: 'Righteous',color: Colors.blue),)),
                      ],
                    )),
                    SizedBox(height: 7,),
                  ],
                )),
          ),
          Divider(thickness: 1,),
          SizedBox(height: 10,),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(fontSize: 22, fontFamily: 'Righteous'),),
                SizedBox(height: 10.0,),
                RaisedButton(
                  onPressed: () async{ await _selectDate(context);
                  datepass="${selectedDate.toLocal()}".split(' ')[0];
                  },
                  child: Text('Select date'),
                ),
              ],
            ),
          ),
          Divider(thickness: 1,),
          SizedBox(height: 25,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
            child: Expanded(
              child: BottomBotton(
                buttonTitle: 'Predict',
                ontap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => MyApp(counter: 2,date: datepass!=null?datepass:'2020-07-12',),
                      transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 1000),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class textFields extends StatelessWidget {
 textFields({this.name,this.txtiptype,this.cont});
 final String name;
 final TextInputType txtiptype;
 final TextEditingController cont;
  @override
  Widget build(BuildContext context) {
    return TextField(controller: cont,
      textAlign: TextAlign.center,
      keyboardType: txtiptype,
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(width: 0.8,
                color: Colors.lightBlueAccent),),
          contentPadding: EdgeInsets.symmetric(
              vertical: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(width: 0.8),),
          hintText: name,
      ),
    );
  }
}