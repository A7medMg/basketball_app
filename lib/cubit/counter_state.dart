part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}
final class CounterTeamAIncrement extends CounterState {}
final class CounterTeamBIncrement extends CounterState {}
final class CounterTeamReset extends CounterState {}


