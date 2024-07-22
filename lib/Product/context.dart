


import 'package:flutter/material.dart';

class Counter extends ChangeNotifier{
  final List<Map<String, String>> Itemlist = [
    {"name": "name", "paisa": "paisa"}
  ];
   List<Map<String, String>> get getCounter {
    return Itemlist;
  }
  void incrementCounter(String paisa,String name) {
    Map<String,String> _newitem={
       "name":name,
       "paisa":paisa
    };
    Itemlist.add(_newitem);
     notifyListeners();
  }
}

