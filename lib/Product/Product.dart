import 'package:demo/Product/AddProduct.dart';
import 'package:demo/Product/Items.dart';
import 'package:demo/Product/NewProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales items',style: TextStyle(
          color: Colors.white
        ),),
        shadowColor:Colors.black ,
        backgroundColor: const Color.fromARGB(255, 151, 151, 151),
        actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_card,color: Color.fromARGB(255, 33, 109, 201),),
              tooltip: 'Add new item',
              onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Newproduct();
                                }));
              },
            ), 
            SizedBox(
              width: 50,
            ),
            //IconButton
          ], //<
      ),
      body:  Row(
        children: [
          // Expanded(
          //   flex: 2,
          //   child: 
          // Container(
          // padding: EdgeInsets.all(40),
          //   decoration: BoxDecoration(
          //     // color: Colors.amberAccent
          //   ),
          //   child: Column(
          //     children: [
          //       TextButton.icon(onPressed: (){
          //        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //         return Newproduct();
          //        }));
          //       }, label: Text('Add Product'),icon: Icon(Icons.add_card),),

          //     ],
          //   ),
          // )
          // ),
          Expanded(
            flex: 7,
            child: Container(
          decoration: BoxDecoration(
            boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 225, 225, 225).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],

            ),
          padding: EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Items(),

        )),
        Expanded(
          flex: 3,
            child: Container(
          // decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 0, 0)),
          padding: EdgeInsets.all(40),
          child: Addproduct(),
        ))
        ],
      )
      // Container(
      //   child: MediaQuery.of(context).size.width > 800 ?
        //  Row(
        //   children: [
        //     Container(
        //       child: ElevatedButton(
        //         onPressed: (){}, 
        //       child: Text('add product')),
        //     ),
        //     Container(
        //     width: MediaQuery.of(context).size.width * 60 / 100,
        //     child:Items()
        //     ),
        //     Container(
        //       width: MediaQuery.of(context).size.width*20/100,
        //       padding: EdgeInsets.all(40),
        //       decoration: BoxDecoration(
        //         color: Color.fromARGB(255, 255, 255, 255),
        //         boxShadow: [
        //         BoxShadow(
        //           color: Color.fromARGB(255, 53, 53, 53).withOpacity(0.5),
        //           spreadRadius: 5,
        //           blurRadius: 7,
        //           offset: Offset(0, 3), // changes position of shadow
        //         ),
        //       ],
        //       ),
        //       child: Addproduct(),
        //     )
        //   ],
        // )
        // :
        // Column(
        //   children: [
        //               Container(
        //                   // width: MediaQuery.of(context).size.width ,
        //                   child: Items()
        //                   ),
        //               Container(
        //                 width: MediaQuery.of(context).size.width ,
        //                 padding: EdgeInsets.all(40),
        //                 decoration: BoxDecoration(
        //                   color: Color.fromARGB(255, 255, 255, 255),
        //                   boxShadow: [
        //                     BoxShadow(
        //                       color: Color.fromARGB(255, 53, 53, 53)
        //                           .withOpacity(0.5),
        //                       spreadRadius: 5,
        //                       blurRadius: 7,
        //                       offset:
        //                           Offset(0, 3), // changes position of shadow
        //                     ),
        //                   ],
        //                 ),
        //                 child: Addproduct(),
        //               )
        //             ],
        // )
      // )
    );
  }
}