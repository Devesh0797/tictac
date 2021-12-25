import 'package:flutter/material.dart';

class Local extends StatelessWidget {
  const Local({Key? key}) : super(key: key);

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
  int counter=0;
  var winner = "abc";
  var dev = ["picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg"];
  var a = [0,0,0,0,0,0,0,0,0];

  showAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = MaterialButton(  
    child: const Text("Next Round"),  
    onPressed: () { 
      setState(() {
        a= [0,0,0,0,0,0,0,0,0];
      counter=0;
      dev = ["picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg","picture.jpg"];
      }); 
      //Navigator.pop(context);
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },  
  );  
  
  // Create AlertDialog  
  WillPopScope alert = WillPopScope(
    onWillPop: () async => false,
    child: AlertDialog(  
    title: const Text("Result"),  
    content: Text(winner),  
    actions: [  
      okButton,  
    ], 
    ) 
  );  
  
  // show the dialog 
  showDialog(  
    barrierDismissible: false,
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
}  



  
  void _incrementCounter(int tile) {
    setState(() {
      if(a[tile]==0){
        if(counter%2==0){
          a[tile]=1;
          dev[tile] = "o.gif";
       // quizbrain.questionbank[tile].answer = true;
        counter++;
        }
        else{
          a[tile]=1;
          dev[tile] = "x.gif";
      //  quizbrain.questionbank[tile].answer = true;
        counter++;
        }
        
      }

      if(dev[0]=="o.gif" && dev[4]=="o.gif" && dev[8]=="o.gif"){
        winner = "Player 1 wins";
        showAlertDialog(context);  
        
      }
      else if(dev[0]=="x.gif" && dev[4]=="x.gif" && dev[8]=="x.gif"){
         winner = "Player 2 wins";
         showAlertDialog(context); 
         
      }
      else if(dev[2]=="o.gif" && dev[4]=="o.gif" && dev[6]=="o.gif"){
        winner = "Player 1 wins";
         showAlertDialog(context); 
         
      }
      else if(dev[2]=="x.gif" && dev[4]=="x.gif" && dev[6]=="x.gif"){
         winner = "Player 2 wins";
         showAlertDialog(context); 
         
      }
      else if(dev[0]=="x.gif" && dev[1]=="x.gif" && dev[2]=="x.gif"){
         winner = "Player 2 wins";
         showAlertDialog(context); 
         
      }
       else if(dev[3]=="x.gif" && dev[4]=="x.gif" && dev[5]=="x.gif"){
         winner = "Player 2 wins";
         showAlertDialog(context); 
         
      }
       else if(dev[6]=="x.gif" && dev[7]=="x.gif" && dev[8]=="x.gif"){
         winner = "Player 2 wins";
         showAlertDialog(context); 
         
      }
      else if(dev[0]=="o.gif" && dev[1]=="o.gif" && dev[2]=="o.gif"){
         winner = "Player 1 wins";
         showAlertDialog(context); 
         
      }
      else if(dev[3]=="o.gif" && dev[4]=="o.gif" && dev[5]=="o.gif"){
         winner = "Player 1 wins";
         showAlertDialog(context); 
         
      }
      else if(dev[6]=="o.gif" && dev[7]=="o.gif" && dev[8]=="o.gif"){
         winner = "Player 1 wins";
         showAlertDialog(context); 
         
      }
       else if(dev[0]=="x.gif" && dev[3]=="x.gif" && dev[6]=="x.gif"){
        winner = "Player 2 wins";
        showAlertDialog(context); 
        
      }
       else if(dev[1]=="x.gif" && dev[4]=="x.gif" && dev[7]=="x.gif"){
          winner = "Player 2 wins";
         showAlertDialog(context); 
        
      }
       else if(dev[2]=="x.gif" && dev[5]=="x.gif" && dev[8]=="x.gif"){
         winner = "Player 2 wins";
         showAlertDialog(context); 
         
      }
      else if(dev[0]=="o.gif" && dev[3]=="o.gif" && dev[6]=="o.gif"){
         winner = "Player 1 wins";
         showAlertDialog(context); 
         
      }
      else if(dev[1]=="o.gif" && dev[4]=="o.gif" && dev[7]=="o.gif"){
         winner = "Player 1 wins";
         showAlertDialog(context); 
         
      }
      else if(dev[2]=="o.gif" && dev[5]=="o.gif" && dev[8]=="o.gif"){
         winner = "Player 1 wins";
         showAlertDialog(context); 
         
      }
      else if(a[0]==1 && a[1]==1 && a[2]==1 && a[3]==1 && a[4]==1 && a[5]==1 && a[6]==1 && a[7]==1 && a[8]==1){
        winner = "Match Draw";
        showAlertDialog(context); 
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        _incrementCounter(0);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height/4.2,
                        child:  
                          Image.asset(dev[0])
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
                        _incrementCounter(1);
                     },
                     child: Container(
                       height: MediaQuery.of(context).size.height/4.2,
                       child:  
                          Image.asset(dev[1])
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
                      _incrementCounter(2);
                    },
                    child: Container(
                       child:  
                          Image.asset(dev[2])
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
                        _incrementCounter(3);
                      },
                      child: Container(
                         child:  
                          Image.asset(dev[3])
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
                       _incrementCounter(4);
                     },
                     child: Container(
                        child:  
                          Image.asset(dev[4])
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
                      _incrementCounter(5);
                    },
                    child: Container(
                       child:  
                          Image.asset(dev[5])
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
                        _incrementCounter(6);
                      },
                      child: Container(
                         child:  
                          Image.asset(dev[6])
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
                       _incrementCounter(7);
                     },
                     child: Container(
                        child:  
                          Image.asset(dev[7])
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
                      _incrementCounter(8);
                    },
                    child: Container(
                       child:  
                          Image.asset(dev[8])
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
              )
            ],
          ),
        ),
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


