import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smartagro/Components/storecart.dart';

class Store2 extends StatefulWidget {
  @override
  _Store2State createState() => _Store2State();
}

class _Store2State extends State<Store2> {
  bool toggle = false;
  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.yellowAccent,
    Colors.purple,
    Colors.lightBlue,
    Colors.grey
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   dataMap.putIfAbsent("Potato", () => 3);
   dataMap.putIfAbsent("capsicum", () => 1.3);
   dataMap.putIfAbsent("carrot", () => 1.1);
   dataMap.putIfAbsent("Onion", () => 2);
   dataMap.putIfAbsent("Others", () => 2);
   dataMap.putIfAbsent("Empty", () => 5);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[400],child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child:Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Text('BHAKTAPUR-WAREHOUSE',style: TextStyle(color: Colors.grey[300],fontFamily: 'Righteous',fontSize: 20,decoration: TextDecoration.underline),),
              Center(
                  child: PieChart(
                    dataMap: dataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32.0,
                    chartRadius: MediaQuery.of(context).size.width / 1.8,
                    showChartValuesInPercentage: true,
                    showChartValues: true,
                    showChartValuesOutside: false,
                    chartValueBackgroundColor: Colors.grey[200],
                    colorList: colorList,
                    showLegends: true,
                    legendPosition: LegendPosition.right,
                    decimalPlaces: 1,
                    showChartValueLabel: true,
                    initialAngle: 0,
                    chartValueStyle: defaultChartValueStyle.copyWith(
                      color: Colors.blueGrey[900].withOpacity(0.9),
                    ),
                    chartType: ChartType.disc,
                  )
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only( top:10,left:30, right: 30, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    StoreCart(url: 'images/potato.jpg',name: 'Potato',price: '1000 Kg',),
                    Divider(),
                    StoreCart(url: 'images/capsicum.png',name: 'Capsicum',price: '150 Kg',),
                    Divider(),
                    StoreCart(url: 'images/carrot.jpg',name: 'Carrot',price: '100 Kg',),
                    Divider(),
                    StoreCart(url: 'images/onion.png',name: 'Onion',price: '200 Kg',),
                    Divider(),
                    StoreCart(url: 'images/cabbage.png',name: 'Cabbage',price: '100 Kg',),
                    Divider(),
                    StoreCart(url: 'images/tomaato.jpg',name: 'Tomato',price: '20 Kg',),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),);
  }
}
