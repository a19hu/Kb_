import 'package:demo/Payment.dart';
import 'package:demo/Product/Product.dart';
import 'package:demo/Product/context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
          // value: 
        ),
      ],
      child:
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, 
      home: Product(),
    ),);
  }
}
