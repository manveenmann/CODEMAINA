import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int score = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
       backgroundColor: Color.fromARGB(219, 109, 249, 70),
      appBar: AppBar( backgroundColor: Color.fromARGB(219, 54, 210, 11),
        title: Text('SCORE-BOARD',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:20),
            Text(
                'CONGRATULATIONS!!',
                style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),

              ),

               SizedBox(height:20),
        
              Image.asset('assets/images/trophy.png',height: 400),
                SizedBox(height:20),
              Text(
                'YOU SCORED',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                '$score',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                //ButtonStyle( backgroundColor:Colors.black ,)
                 style:ElevatedButton.styleFrom(
                backgroundColor:Colors.black ,
                padding:EdgeInsets.symmetric(horizontal:30,vertical:15),
                textStyle: TextStyle(fontSize:18,fontWeight:FontWeight.bold)
              ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/quiz');
                },
                child: Text('RESTART QUIZ',style:TextStyle(color: Colors.white,fontSize:20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
