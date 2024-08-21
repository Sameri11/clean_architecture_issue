part of 'habit_bloc.dart';

@immutable
sealed class HabitState {}

final class HabitInitial extends HabitState {}

final class HabitLoading extends HabitState {}

final class HabitFailure extends HabitState {
  final String error;
  HabitFailure(this.error);
}

final class HabitGetAllSuccess extends HabitState {
  final List<Habit> habits;
  HabitGetAllSuccess(this.habits);
}
