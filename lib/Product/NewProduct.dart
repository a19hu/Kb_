import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Newproduct extends StatefulWidget {
  const Newproduct({super.key});

  @override
  State<Newproduct> createState() => _NewproductState();
}

class _NewproductState extends State<Newproduct> {

  void pickImage()async{
          FilePickerResult? result = await FilePicker.platform.pickFiles();
if (result != null) {
  PlatformFile file = result.files.first;
      String fileName = result.files.first.name;

      // await FirebaseStorage.instance
      //     .ref('uploads/$fileName')
      //     .putData(file.bytes);

  // print(file.name);
  // print(file.bytes);
  // print(file.size);
  // print(file.extension);
  // print(file.path);
} else {
  // User canceled the picker
  // print()
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('New product add',
          style: TextStyle(color: Colors.white),
        ), automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 151, 151, 151),
          
          ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [

          
          Padding(
            padding: EdgeInsets.all(15),  
            child: 
            
          Row(
            children: [
            Expanded(child: 
            TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Product Name',
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'subtitle',
                    hintText: 'Product subtitle',
                  ),
                ),
              )  
            ],
            )
          ),
          Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Product Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: (){
                      pickImage();
                      },
                     child: Text('pick')
                     )
                  )
                ],
              )),
              Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Product Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'subtitle',
                        hintText: 'Product subtitle',
                      ),
                    ),
                  )
                ],
              )),
              Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Product Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'subtitle',
                        hintText: 'Product subtitle',
                      ),
                    ),
                  )
                ],
              )),
              Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Product Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'subtitle',
                        hintText: 'Product subtitle',
                      ),
                    ),
                  )
                ],
              )),
              Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Product Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'subtitle',
                        hintText: 'Product subtitle',
                      ),
                    ),
                  )
                ],
              )),
                ],
          ),
           Container(
              width: 400,
              height: 40,
              child: ElevatedButton(
                onPressed: (){},
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 10, 124, 238), // Background color
                ),
              ))  ],
      )),
    );
  }
}
