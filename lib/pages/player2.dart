import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Player2 extends StatefulWidget{
  final String text;
  Player2({required this.text});

   @override
  State<Player2> createState() => _MyHomePageState();

  // This widget is the root of your application.
 
}

class _MyHomePageState extends State<Player2> {

  CollectionReference<Map<String, dynamic>> someCollection =
      FirebaseFirestore.instance.collection('Playing');

      int counter = 0;
      var a = [0,0,0,0,0,0,0,0,0];
      var dev = ["picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg"];

      Future<void> adduser(int tile){
        int x = tile+1;
        String y = 'tile'+x.toString();
      return someCollection.doc(widget.text).update
          ({
            y : 'x.gif',
          })
          .then((value) => {
             
          }
     
      )
          .catchError((error) => {
            ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content:  Text(error.toString()),
        
      ),)
      });

    }


      void _incrementCounter(int tile) {
    setState(() {
      if(a[tile]==0){
        adduser(tile);
          a[tile]=1;
          dev[tile] = "x.gif";

      }

      // if(dev[0]=="o.gif" && dev[4]=="o.gif" && dev[8]=="o.gif"){
      //   winner = "Player 1 wins";
      //   showAlertDialog(context);  
        
      // }
      // else if(dev[0]=="x.gif" && dev[4]=="x.gif" && dev[8]=="x.gif"){
      //    winner = "Player 2 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(dev[2]=="o.gif" && dev[4]=="o.gif" && dev[6]=="o.gif"){
      //   winner = "Player 1 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(dev[2]=="x.gif" && dev[4]=="x.gif" && dev[6]=="x.gif"){
      //    winner = "Player 2 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(dev[0]=="x.gif" && dev[1]=="x.gif" && dev[2]=="x.gif"){
      //    winner = "Player 2 wins";
      //    showAlertDialog(context); 
         
      // }
      //  else if(dev[3]=="x.gif" && dev[4]=="x.gif" && dev[5]=="x.gif"){
      //    winner = "Player 2 wins";
      //    showAlertDialog(context); 
         
      // }
      //  else if(dev[6]=="x.gif" && dev[7]=="x.gif" && dev[8]=="x.gif"){
      //    winner = "Player 2 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(dev[0]=="o.gif" && dev[1]=="o.gif" && dev[2]=="o.gif"){
      //    winner = "Player 1 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(dev[3]=="o.gif" && dev[4]=="o.gif" && dev[5]=="o.gif"){
      //    winner = "Player 1 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(dev[6]=="o.gif" && dev[7]=="o.gif" && dev[8]=="o.gif"){
      //    winner = "Player 1 wins";
      //    showAlertDialog(context); 
         
      // }
      //  else if(dev[0]=="x.gif" && dev[3]=="x.gif" && dev[6]=="x.gif"){
      //   winner = "Player 2 wins";
      //   showAlertDialog(context); 
        
      // }
      //  else if(dev[1]=="x.gif" && dev[4]=="x.gif" && dev[7]=="x.gif"){
      //     winner = "Player 2 wins";
      //    showAlertDialog(context); 
        
      // }
      //  else if(dev[2]=="x.gif" && dev[5]=="x.gif" && dev[8]=="x.gif"){
      //    winner = "Player 2 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(dev[0]=="o.gif" && dev[3]=="o.gif" && dev[6]=="o.gif"){
      //    winner = "Player 1 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(dev[1]=="o.gif" && dev[4]=="o.gif" && dev[7]=="o.gif"){
      //    winner = "Player 1 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(dev[2]=="o.gif" && dev[5]=="o.gif" && dev[8]=="o.gif"){
      //    winner = "Player 1 wins";
      //    showAlertDialog(context); 
         
      // }
      // else if(a[0]==1 && a[1]==1 && a[2]==1 && a[3]==1 && a[4]==1 && a[5]==1 && a[6]==1 && a[7]==1 && a[8]==1){
      //   winner = "Match Draw";
      //   showAlertDialog(context); 
      // }
      
    });

     
  }



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
              Text(widget.text + 'Player2 ' + counter.toString()),

              Container(
              child: StreamBuilder(
        stream: someCollection
        .doc(widget.text).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("");
          }
          var userDocument = snapshot.data;
          if((snapshot.data as dynamic)['tile1'] != 'picture.jpg'){
            counter++;
            dev[0] = (snapshot.data as dynamic)['tile1'];
            a[0]=1;
            print(counter);
          }
          if((snapshot.data as dynamic)['tile2'] != 'picture.jpg'){
            counter++;
            dev[1] = (snapshot.data as dynamic)['tile2'];
            a[1]=1;
            print(counter);
          }
           if((snapshot.data as dynamic)['tile3'] != 'picture.jpg'){
            counter++;
            dev[2] = (snapshot.data as dynamic)['tile3'];
            a[2]=1;
            print(counter);
          }
           if((snapshot.data as dynamic)['tile4'] != 'picture.jpg'){
            counter++;
            dev[3] = (snapshot.data as dynamic)['tile4'];
            a[3]=1;
            print(counter);
          }
           if((snapshot.data as dynamic)['tile5'] != 'picture.jpg'){
            counter++;
            dev[4] = (snapshot.data as dynamic)['tile5'];
            a[4]=1;
            print(counter);
          }
           if((snapshot.data as dynamic)['tile6'] != 'picture.jpg'){
            counter++;
            dev[5] = (snapshot.data as dynamic)['tile6'];
            a[5]=1;
            print(counter);
          }
           if((snapshot.data as dynamic)['tile7'] != 'picture.jpg'){
            counter++;
            dev[6] = (snapshot.data as dynamic)['tile7'];
            a[6]=1;
            print(counter);
          }
           if((snapshot.data as dynamic)['tile8'] != 'picture.jpg'){
            counter++;
            dev[7] = (snapshot.data as dynamic)['tile8'];
            a[7]=1;
            print(counter);
          }
           if((snapshot.data as dynamic)['tile9'] != 'picture.jpg'){
            counter++;
            dev[8] = (snapshot.data as dynamic)['tile9'];
            a[8]=1;
            print(counter);
          }
         
          return Column(
            children: <Widget>[
               Row(
                 children: <Widget>[
                   Expanded(
                     child: InkWell(
                       onTap: (){
                         if(counter % 2==1){
                           _incrementCounter(0);
                         }
                       },
                       child: Container(
                         height: MediaQuery.of(context).size.height/4.2,
                         child:  
                           Image.asset((snapshot.data as dynamic)['tile1'])
                         ,
                           decoration: BoxDecoration(
                           border: Border.all(
                           color: Colors.yellow,
                            width: 6.0,
                            
                           ),
                                           
                           ),
                       ),
                     ),
                   ),
        
                  Expanded(
                    child: InkWell(
                      onTap: (){
                         if(counter % 2==1){
                           _incrementCounter(1);
                         }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height/4.2,
                        child:  
                           Image.asset((snapshot.data as dynamic)['tile2'])
                         ,
                                         decoration: BoxDecoration(
                                           border: Border.all(
                                             color: Colors.yellow,
                                             width: 6.0
                                           ),
                                           
                                         ),
                                       ),
                    ),
                  ),
        
                 Expanded(
                   child: InkWell(
                     onTap: (){
                        if(counter % 2==1){
                           _incrementCounter(2);
                         }
                     },
                     child: Container(
                        child:  
                           Image.asset((snapshot.data as dynamic)['tile3'])
                         ,
                       height: MediaQuery.of(context).size.height/4.2,
                           decoration: BoxDecoration(
                           border: Border.all(
                           color: Colors.yellow,
                            width: 6.0,
                            
                           ),
                                           
                           ),
                       ),
                   ),
                 ),
                             
                 ],
               ),
        
        
               Row(
                 children: <Widget>[
                   Expanded(
                     child: InkWell(
                       onTap: (){
                         if(counter % 2==1){
                           _incrementCounter(3);
                         }
                       },
                       child: Container(
                          child:  
                           Image.asset((snapshot.data as dynamic)['tile4'])
                         ,
                         height: MediaQuery.of(context).size.height/4.2,
                           decoration: BoxDecoration(
                           border: Border.all(
                           color: Colors.yellow,
                            width: 6.0,
                            
                           ),
                                           
                           ),
                       ),
                     ),
                   ),
        
                  Expanded(
                    child: InkWell(
                      onTap: (){
                         if(counter % 2==1){
                           _incrementCounter(4);
                         }
                      },
                      child: Container(
                         child:  
                           Image.asset((snapshot.data as dynamic)['tile5'])
                         ,
                        height: MediaQuery.of(context).size.height/4.2,
                                         decoration: BoxDecoration(
                                           border: Border.all(
                                             color: Colors.yellow,
                                             width: 6.0
                                           ),
                                           
                                         ),
                                       ),
                    ),
                  ),
        
                 Expanded(
                   child: InkWell(
                     onTap: (){
                        if(counter % 2==1){
                           _incrementCounter(5);
                         }
                     },
                     child: Container(
                        child:  
                           Image.asset((snapshot.data as dynamic)['tile6'])
                         ,
                       height: MediaQuery.of(context).size.height/4.2,
                           decoration: BoxDecoration(
                           border: Border.all(
                           color: Colors.yellow,
                            width: 6.0,
                            
                           ),
                                           
                           ),
                       ),
                   ),
                 ),
                             
                 ],
               ),
        
        
               Row(
                 children: <Widget>[
                   Expanded(
                     child: InkWell(
                       onTap: (){
                          if(counter % 2==1){
                           _incrementCounter(6);
                         }
                       },
                       child: Container(
                          child:  
                           Image.asset((snapshot.data as dynamic)['tile7'])
                         ,
                         height: MediaQuery.of(context).size.height/4.2,
                           decoration: BoxDecoration(
                           border: Border.all(
                           color: Colors.yellow,
                            width: 6.0,
                            
                           ),
                                           
                           ),
                       ),
                     ),
                   ),
        
                  Expanded(
                    child: InkWell(
                      onTap: (){
                         if(counter % 2==1){
                           _incrementCounter(7);
                         }
                      },
                      child: Container(
                         child:  
                           Image.asset((snapshot.data as dynamic)['tile8'])
                         ,
                        height: MediaQuery.of(context).size.height/4.2,
                                         decoration: BoxDecoration(
                                           border: Border.all(
                                             color: Colors.yellow,
                                             width: 6.0
                                           ),
                                           
                                         ),
                                       ),
                    ),
                  ),
        
                 Expanded(
                   child: InkWell(
                     onTap: (){
                       if(counter % 2==1){
                           _incrementCounter(8);
                         }
                     },
                     child: Container(
                        child:  
                           Image.asset((snapshot.data as dynamic)['tile9'])
                         ,
                       height: MediaQuery.of(context).size.height/4.2,
                           decoration: BoxDecoration(
                           border: Border.all(
                           color: Colors.yellow,
                            width: 6.0,
                            
                           ),
                                           
                           ),
                       ),
                   ),
                 ),
                             
                 ],
               ),
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