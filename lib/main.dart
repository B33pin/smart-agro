import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartagro/Screens/map.dart';
import 'package:smartagro/Screens/results.dart';
import 'package:smartagro/Screens/messagescreen.dart';
import 'package:smartagro/Screens/store.dart';
import 'package:smartagro/Screens/store2.dart';
import 'Screens/submitScreen.dart';
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green,
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  int counter;
  int counter1;
  String date;
  String test;
  MyApp({this.counter,this.counter1,this.date,this.test});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    print(widget.date);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  final List<Widget> _children = [
    Store(),
    SubmitScreen(),
    Results(),
    MessageScreen(),
    Store2()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
            floatingActionButton: widget.date!=null?null:widget.test!=null?null:_selectedIndex==0?FloatingActionButton(
              hoverColor: Colors.black,
              elevation: 10,
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => storeMap(),
                    transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 500),
                  ),
                );
              },
              backgroundColor: Colors.green[400],
              child: Icon(Icons.map),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
            ):null,
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: BottomNavyBar(
            backgroundColor: Colors.white,
            selectedIndex: widget.counter!=null?
            widget.counter:_selectedIndex,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) {
              setState(() {
                widget.test=null;
                widget.date=null;
                widget.counter1=null;
                 widget.counter=null;
                _selectedIndex=index;
              });
            },
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.store),
                title: Text('Store'),
                activeColor: Colors.green,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.assignment),
                  title: Text('Submit'),
                  activeColor: Colors.green
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.tv),
                  title: Text('Results'),
                  activeColor: Colors.green
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.message),
                  title: Text('Messages'),
                  activeColor: Colors.green
              ),
            ],
          ),
          body: widget.date!=null?Results(datenow: widget.date,):widget.counter!=null?_children[widget.counter]:widget.counter1
          ==1?_children[4]:_children[_selectedIndex],
        ),
      );
  }
}
