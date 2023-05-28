// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;

import 'package:f1_dashboard/pages/constructorPage.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {


    int selectedIndex = 0;


    return Scaffold(
      appBar: AppBar(
        title: Text("F1 Stats"),
        centerTitle: true,
      ),

      body: MyNavigationRail(),

    );
  } 
}


class MyNavigationRail extends StatefulWidget {
  MyNavigationRail({Key? key}) : super(key: key);

  @override
  _MyNavigationRailState createState() => _MyNavigationRailState();
}

class _MyNavigationRailState extends State<MyNavigationRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
  
            labelType: NavigationRailLabelType.none,
            extended: true,
            useIndicator: true,
            indicatorColor: Color.fromARGB(50, 50, 50, 50),

            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.build_outlined),
                selectedIcon: Icon(Icons.build),
                label: Text('Constructors'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('MenuTWO'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('MenuTHREE'),
              ),
            ],            
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                ConstructorPage(),
                MenuTwo(),
                MenuThree(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








class MenuTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Menu Two'),
    );
  }
}

class MenuThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Menu Three'),
    );
  }
}



