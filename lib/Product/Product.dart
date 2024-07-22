import 'package:demo/Product/AddProduct.dart';
import 'package:demo/Product/Items.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MediaQuery.of(context).size.width > 800 ?
         Row(
          children: [
            Container(
            width: MediaQuery.of(context).size.width * 60 / 100,
            child:Items()
            ),
            Container(
              width: MediaQuery.of(context).size.width*40/100,
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 53, 53, 53).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              ),
              child: Addproduct(),
            )
          ],
        )
        :
        Column(
          children: [
                      Container(
                          // width: MediaQuery.of(context).size.width ,
                          child: Items()
                          ),
                      Container(
                        width: MediaQuery.of(context).size.width ,
                        padding: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 53, 53, 53)
                                  .withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Addproduct(),
                      )
                    ],
        )
      )
    );
  }
}