import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tictac/pages/local.dart';
import 'package:tictac/pages/player2.dart';
import 'package:tictac/pages/room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _messagecontroller = new TextEditingController();

   var users = FirebaseFirestore.instance.collection('Playing');

  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  int random(min,max){
    var rn = new Random();
    return min + rn.nextInt(max - min); 
  }


  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    Future<void> adduser2(){
       String randomkey = getRandomString(15);
      return users.doc(_messagecontroller.text).update
          ({
            'player2' : randomkey,
          })
          .then((value) => {
             Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>Player2(text : _messagecontroller.text)),
                   )
          }
     
      )
          .catchError((error) => {
            ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content:  Text(error.toString()),
        
      ),)
      });

    }

  Future<void> addUser() {
    int ran = random(1000,9999);
    int time = DateTime.now().millisecondsSinceEpoch;
    String randomkey = getRandomString(15);
      return users.doc(ran.toString()).set
          ({
            'code': ran,
            'player1' : randomkey,
            'player2' : 'Not Joined',
            'tile1': 'picture.jpg',
            'tile2': 'picture.jpg',
            'tile3': 'picture.jpg',
            'tile4': 'picture.jpg',
            'tile5': 'picture.jpg',
            'tile6': 'picture.jpg',
            'tile7': 'picture.jpg',
            'tile8': 'picture.jpg',
            'tile9': 'picture.jpg',
            'time': time,
                         // 42
          })
          .then((value) => {
             Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>Room(text : ran.toString())),
                   )
          }
     
    )
          .catchError((error) => {
            ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content:  Text(error.toString()),
        
      ),)
      });

      
    }


    void player2() async {
      String code = _messagecontroller.text;
      var users1 = FirebaseFirestore.instance.collection('Playing');

      users1.doc(code).get().then((value){
      
      if(value.exists){
        adduser2();
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content:  Text("Wrong id"),
        
      ),);
      }
    });
      
    }
 
    

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
       
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: FlatButton(onPressed: (){
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>const Local()),
                   );
                },
                color: Colors.blueAccent,  
                  textColor: Colors.white,  
                 child: Text('Start', style: TextStyle(fontSize: (MediaQuery.of(context).size.width) * 0.04),
                 textAlign: TextAlign.end,),  ),
              ),
              SizedBox(
                height: 25,
              ),
               Container(
                alignment: Alignment.center,
                child: FlatButton(onPressed: (){
                  addUser();
                  
                },
                color: Colors.blueAccent,  
                  textColor: Colors.white,  
                 child: Text('Create Private Room', style: TextStyle(fontSize: (MediaQuery.of(context).size.width) * 0.04),
                 textAlign: TextAlign.end,),  ),
              ),

              Padding(
                     padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width) * 0.04,right: (MediaQuery.of(context).size.width) * 0.04 ),
                     child: TextField(
                       controller: _messagecontroller,
                       keyboardType: TextInputType.number,
                       maxLines: null,
                       decoration : const InputDecoration(
                         border: OutlineInputBorder(),
                         hintText: "Enter the Code",
                         labelText: "Code",
                       )
                     ),
                   ),

                   Container(
                alignment: Alignment.center,
                child: FlatButton(onPressed: (){
                 
                 player2();

                },
                color: Colors.blueAccent,  
                  textColor: Colors.white,  
                 child: Text('Submit', style: TextStyle(fontSize: (MediaQuery.of(context).size.width) * 0.04),
                 textAlign: TextAlign.end,),  ),
              ),
             
            ],
          ),
        ),
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


