import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tictac/pages/player1.dart';

class Room extends StatefulWidget{
  final String text;
  Room({required this.text});

   @override
  State<Room> createState() => _MyHomePageState();

  // This widget is the root of your application.
 
}

class _MyHomePageState extends State<Room> {

CollectionReference<Map<String, dynamic>> someCollection =
      FirebaseFirestore.instance.collection('Playing');

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      appBar: AppBar(
       
        title: Text('Room ID'),
      ),
      body: Center(
         child: SingleChildScrollView(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.text),

               Container(
              child: StreamBuilder(
        stream: someCollection
        .doc(widget.text).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("");
          }
          var userDocument = snapshot.data;
          if((snapshot.data as dynamic)['player2'] != 'Not Joined'){
            if((snapshot.data as dynamic)['player2'] != null){
             
                String x = widget.text;
                SchedulerBinding.instance!.addPostFrameCallback((_) {
    Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>Player1(text : x)),
                   );
              });
            
            }
          }
          return Column(
            children: <Widget>[
               Text(""),
            ],
          );
          
          
        //return Text(Local.getuid());
        }
      )
              ),


            ]
           )
           
           )
      )
    )
    );
  }
}