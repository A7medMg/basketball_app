import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int teamA_score = 0;

  int teamB_score = 0;
  void reset() {
    teamA_score = 0;
    teamB_score = 0;
    emit(CounterTeamReset());}
  void teamIncrement({required String team,required int points}) {
    if (team == 'A') {
      teamA_score += points;
      emit(CounterTeamAIncrement());
    } else {
      teamB_score += points;
      emit(CounterTeamBIncrement());
    }
  }
}
