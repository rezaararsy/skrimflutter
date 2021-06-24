import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skrim/Lokal.dart';
import 'package:skrim/db.dart';

class Tab2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Tab2State();
  }
}

class _Tab2State extends State<Tab2> {

  List<Widget> _children = [];
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void initState() {
    setState(() {
      _children = [
        Lokal(),
        DB()

      ];
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('2 TAB'),
        ),
          bottomNavigationBar: Material(
            color: Colors.blue,
            child: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'HOME',),
                Tab(icon: Icon(Icons.home,size: 15,) ),


              ],
            ),
          ),
        body:
        TabBarView(
          children: [
            Lokal(),
            DB()
          ],
        ),
      ),
    );
  }
}

