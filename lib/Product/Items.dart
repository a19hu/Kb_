import 'package:demo/Product/Data.dart';
import 'package:demo/Product/context.dart';
import 'package:demo/Product/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

final List<Map<String,String>> ProductIteam=[
{
  "image":"name",
  "paisa":'200'
},
{"image": "name",
  "paisa": '200'
},
{"image": "Ashu",
  "paisa": '200'

},
{"image": "Ashu",
  "paisa": '200'

},
{"image": "name",
  "paisa": '200'

},
  {"image": "name",
  "paisa": '200'
  
  },
  {"image": "Ashu",
  "paisa": '200'
  
  },
  {"image": "Ashu",
  "paisa": '200'
  
  },
{"image": "name",
  "paisa": '200'

},


];

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 10.0,  
      children: allProducts.map((item){
        final String? image= item.image;
        final int? price =item.price;
        final String? title=item.title;
        return 
        ElevatedButton(
          onPressed: (){
            // Provider.of<Counter>(context, listen: false).incrementCounter(paisa!,image);
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Details();
            }));
          },
         child: Column(
          children: [
            Image.asset('images/image.png'),
            Text(title!,style: TextStyle(
              color: Colors.black,fontSize: 18
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

            Text('₹ ${price.toString()}'),
            IconButton(onPressed: (){
            Provider.of<Counter>(context, listen: false).incrementCounter(price.toString(),title);

            }, icon:  Icon(Icons.shopify_sharp),
            tooltip: 'add to cart',
            )
              ],
            )
            // ElevatedButton(
            //   onPressed: (){
            // Provider.of<Counter>(context, listen: false).incrementCounter(price.toString(),title);
            //   }, 
            //   child: Text('Add to cart'))
          ],
         ),
         style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black87, 
            elevation: 6.0,
            shadowColor: Colors.yellow[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
         );
      }).toList(),
    );
  }
}