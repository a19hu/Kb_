import 'package:demo/Product/context.dart';
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
      crossAxisCount: 3,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 10.0,  
      children: ProductIteam.map((item){
        final String? image= item['image'];
        final String? paisa=item['paisa'];
        return ElevatedButton(
          onPressed: (){
            Provider.of<Counter>(context, listen: false).incrementCounter(paisa!,image);
          },
         child: Text(image!),
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