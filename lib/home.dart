
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

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
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (BuildContext context, state) {
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
                          BlocProvider.of<CounterCubit>(context).teamIncrement(team: "B", points: 3);
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
          ),

        );
      },
      listener: (BuildContext context, state) {
        if(state is CounterTeamAIncrement){
          teamA_score=BlocProvider.of<CounterCubit>(context).teamA_score;

        }else if(state is CounterTeamBIncrement){
          teamB_score=BlocProvider.of<CounterCubit>(context).teamB_score;
        }else if(state is CounterTeamReset){
          teamA_score=0;
          teamB_score=0;
        }
      },

    );
  }
}
