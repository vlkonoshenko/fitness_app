import 'package:fitness_app/models/exercise.dart';

class DayResult {
  final DateTime date;
  final List<Exercise> exercises;

  DayResult(this.date, this.exercises);
}
