import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(219, 244, 219, 110),
      
      body: SingleChildScrollView(
        child: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.asset('assets/images/start.png'),
              SizedBox(height:20),
          
            ElevatedButton(
              //style:ButtonStyle(),
              
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              style:ElevatedButton.styleFrom(
                backgroundColor:Colors.black ,
                padding:EdgeInsets.symmetric(horizontal:30,vertical:15),
                textStyle: TextStyle(fontSize:18,fontWeight:FontWeight.bold)
              ),
              
            child:Text('START THE QUIZ', style:TextStyle(color: Colors.white,fontSize:20),)
           
            ),
            ],
          ),
        ),
      ),
    );
    
    
  }
}
