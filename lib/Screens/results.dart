import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartagro/Components/displayparam.dart';
import 'package:smartagro/Components/pcart.dart';
import 'package:smartagro/Components/tcart.dart';
import 'package:smartagro/Networking/Datacontent.dart';
class Results extends StatefulWidget {
  final String datenow;
  Results({this.datenow});
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String i;
  bool loading = true;
  List userData;
  double temperature, ppt;
  void getdata() async{
    var InitialData = await DataModel(date: widget.datenow).getDataContent();
    if(InitialData!=null){
      setState(() {
        loading = false;
        userData=[InitialData];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ColumnSuper(
              innerDistance: -50.0,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  color: Colors.green[400],
                  height: 170,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'SmartAgro',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Righteous',
                          color: Colors.grey[300],
                        ),
                      ),
                      Text(
                        "It's a sunny day!",
                        style: TextStyle(
                          fontSize: 33,
                          fontFamily: 'Righteous',
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        color: Colors.grey[400],
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  height: 200,
                  child: loading==true?Center(child: CircularProgressIndicator()):Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          DisplayParameters(
                            colour: Colors.green[400],
                            icn: Icon(
                              Icons.flare,
                              color: Colors.white,
                            ),
                            value:' '+ userData[0]["predictedtempnumber"].toString()+' °C',
                            name: ' Temperature',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DisplayParameters(
                            colour: Colors.blue[400],
                            icn: Icon(
                              Icons.opacity,
                              color: Colors.white,
                            ),
                            value: ' 61%',
                            name: ' Humidity',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          DisplayParameters(
                            colour: Colors.purple[400],
                            icn: Icon(
                              Icons.flare,
                              color: Colors.white,
                            ),
                            value:' '+ userData[0]["predictedprenumber"].toString()+' mm',
                            name: ' Rain-fall',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DisplayParameters(
                            colour: Colors.yellow[800],
                            icn: Icon(
                              Icons.landscape,
                              color: Colors.white,
                            ),
                            value: ' 3.9 m/s',
                            name: ' Wind',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 14, 20, 0),
          child: Text(
            'Trending in Market',
            style: TextStyle(
                fontFamily: 'Righteous', fontSize: 22, color: Colors.black54),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Divider(
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                TrendingCart(
                  url: 'images/maize.jpg',
                  name: 'Maize ( मकै )',
                  price: 'NRs. 250.0 /kg',
                ),
                TrendingCart(
                  url: 'images/potato.jpg',
                  name: 'Potato ( आलु )',
                  price: 'NRs. 200.0 /kg',
                ),
                TrendingCart(
                  url: 'images/millet.jpg',
                  name: 'Millet ( कोदो )',
                  price: 'NRs. 100.0 /kg',
                ),
                TrendingCart(
                  url: 'images/tomaato.jpg',
                  name: 'Tomato ( टमाटर  )',
                  price: 'NRs. 250.0 /kg',
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Divider(
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
            'Recommended Plant',
            style: TextStyle(
                fontFamily: 'Righteous', fontSize: 22, color: Colors.black54),
          ),
        ),
        Expanded(
            child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            loading
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: userData == null
                        ? 'Empty'
                        : userData[0]["cropsinfo"].length,
                    itemBuilder: (context, i) {
                      return PredictionCart(
                        cropname: userData[0]["cropsinfo"][i]["name"],url:userData[0]["cropsinfo"][i]["photo_url"],maxppt:
                      userData[0]["cropsinfo"][i]["maxppt"].toString(),maxtemp: userData[0]["cropsinfo"][i]["maxtemp"].toString(),minppt:
                      userData[0]["cropsinfo"][i]["minppt"].toString(),mintemp: userData[0]["cropsinfo"][i]["mintemp"].toString(),
                      );
                    })
          ],
        ))
      ],
    );
  }
}
