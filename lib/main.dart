import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_lec_6/dashboard.dart';
import 'package:flutter_lec_6/settings.dart';
import 'package:flutter_lec_6/splash.dart';

import 'login.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
      builder: EasyLoading.init(),
    );  }
}
