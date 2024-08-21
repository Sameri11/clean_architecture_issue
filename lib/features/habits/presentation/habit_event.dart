part of 'habit_bloc.dart';

@immutable
sealed class HabitEvent {}

final class HabitGetAllHabits extends HabitEvent {}
