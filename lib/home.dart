import 'package:flutter/material.dart';

class Counter_App extends StatefulWidget {
  const Counter_App({super.key});

  @override
  State<Counter_App> createState() => _Counter_AppState();
}

// ignore: camel_case_types
class _Counter_AppState extends State<Counter_App> {
   int teamA_score = 0;

   int teamB_score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        title: const Text('Counter App'),
      ),
      body:
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/w.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          
          children: [
            Spacer(),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                          children: [
                            Column(
                              children: [
                                Text('team A' , style: TextStyle(fontSize: 50,color: Colors.white),),
                               AnimatedSwitcher(
                        duration: Duration(milliseconds: 400),
                        transitionBuilder: ( child, animation) {
                              return ScaleTransition(
                          scale: animation,
                   child: FadeTransition(
                    opacity: animation,
                         child: child,
                        ),
                              );
                        },
                                 child: Text(
                               '$teamA_score',
                         key: ValueKey(teamA_score),
                           style: TextStyle(
                         fontSize: teamA_score.toString().length >= 3 ? 50 : 150,
                            fontWeight: FontWeight.bold,
                         color: Colors.orange,
                     ),
                    ),
                             ),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                     teamA_score++;
                                  });
                                },style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  minimumSize: Size(150, 50),
                                ), child: Text("Add 1 Point"),),
                                SizedBox(height: 10,),
                                ElevatedButton(onPressed: (){
                                   setState(() {
                                     teamA_score+=2;
                                  });
                                },style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  minimumSize: Size(150, 50),
                                ), child: Text("Add 2 Point"),), 
                                    SizedBox(height: 10,), 
                                ElevatedButton(onPressed: (){
                                    setState(() {
                                      teamA_score+=3;
                                    });
                                },style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  minimumSize: Size(150, 50),
                                ), child: Text("Add 3 Point"),),
                              ],
                    
                            ),
                           SizedBox(
                            height: 400,
                             child: VerticalDivider(
                                                  
                                                    
                              color: Colors.grey,
                              thickness: 3,
                               ),
                           ),
                    
                            Column(
                              children: [
                                Text('team B' , style: TextStyle(fontSize: 50,color: Colors.white),),
                                AnimatedSwitcher(
                        duration: Duration(milliseconds: 400),
                        transitionBuilder: ( child, animation) {
                              return ScaleTransition(
                          scale: animation,
                   child: FadeTransition(
                    opacity: animation,
                         child: child,
                        ),
                              );
                        },
                                 child: Text(
                               '$teamB_score',
                         key: ValueKey(teamB_score),
                           style: TextStyle(
                         fontSize: teamB_score.toString().length >= 3 ? 50 : 150,
                            fontWeight: FontWeight.bold,
                         color: Colors.orange,
                     ),
                    ),
                             ),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                     teamB_score++;
                                  });
                                  
                                },style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  minimumSize: Size(150, 50),
                                ), child: Text("Add 1 Point"),),
                                SizedBox(height: 10,),
                                ElevatedButton(onPressed: (){
                                    setState(() {
                                      teamB_score+=2;
                                    });
                                },style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  minimumSize: Size(150, 50),
                                ), child: Text("Add 2 Point"),), 
                                    SizedBox(height: 10,), 
                                ElevatedButton(onPressed: (){
                                    setState(() {
                                      teamB_score+=3;
                                    });
                                },style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  minimumSize: Size(150, 50),
                                ), child: Text("Add 3 Point"),),
                              ],
                    
                            ),
                            
                          ],
                        ),
                          Spacer(),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            teamA_score=0;
                            teamB_score=0;
                          });
                        },style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  minimumSize: Size(150, 50),
                                ), child: Text("reset"),),
                                  Spacer(),
          ],
        ),
      ),
     
    );
  }
}