// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;

// Import pages
import 'package:f1_dashboard/pages/constructorPage.dart';
import 'package:f1_dashboard/pages/login_page.dart';

String renderServerURL = 'https://f1stats-flask-server.onrender.com';

void main() {
  runApp(F1StatsApp());
}

class F1StatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Stats App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}