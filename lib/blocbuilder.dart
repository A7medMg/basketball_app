
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class Counter_App1 extends StatefulWidget {
  const Counter_App1({super.key});

  @override
  State<Counter_App1> createState() => _Counter_App1State();
}

// ignore: camel_case_types
class _Counter_App1State extends State<Counter_App1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        title: const Text('Counter App'),
      ),
      body:BlocBuilder<CounterCubit,CounterState>(
          builder: (context,state){
            return  Container(
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
                              '${BlocProvider.of<CounterCubit>(context).teamA_score}',
                              key: ValueKey(BlocProvider.of<CounterCubit>(context).teamA_score),
                              style: TextStyle(
                                fontSize: BlocProvider.of<CounterCubit>(context).teamA_score.toString().length >= 3 ? 50 : 150,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          ElevatedButton(onPressed: (){
                            BlocProvider.of<CounterCubit>(context).teamIncrement(team: "A", points: 1);
                          },style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            minimumSize: Size(150, 50),
                          ), child: Text("Add 1 Point"),),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            BlocProvider.of<CounterCubit>(context).teamIncrement(team: "A", points: 2);
                          },style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            minimumSize: Size(150, 50),
                          ), child: Text("Add 2 Point"),),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            BlocProvider.of<CounterCubit>(context).teamIncrement(team: "A", points: 3);
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
                              '${ BlocProvider.of<CounterCubit>(context).teamB_score}',
                              key: ValueKey(BlocProvider.of<CounterCubit>(context).teamB_score),
                              style: TextStyle(
                                fontSize: BlocProvider.of<CounterCubit>(context).teamB_score.toString().length >= 3 ? 50 : 150,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          ElevatedButton(onPressed: (){
                            BlocProvider.of<CounterCubit>(context).teamIncrement(team: "B", points: 1);

                          },style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            minimumSize: Size(150, 50),
                          ), child: Text("Add 1 Point"),),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            BlocProvider.of<CounterCubit>(context).teamIncrement(team: "B", points: 2);
                          },style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            minimumSize: Size(150, 50),
                          ), child: Text("Add 2 Point"),),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            BlocProvider.of<CounterCubit>(context).teamIncrement(team: "B", points:3);
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
                    BlocProvider.of<CounterCubit>(context).reset();
                  },style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    minimumSize: Size(150, 50),
                  ), child: Text("reset"),),
                  Spacer(),
                ],
              ),
            );
          }

      )
      ,

    );
  }
}
