part of 'add_courses_cubit.dart';

@immutable
sealed class AddCoursesState {}

final class AddCoursesInitial extends AddCoursesState {}

final class AddCoursesLoading extends AddCoursesState {}

final class AddCoursesSuccess extends AddCoursesState {
  final List<CourseModel> courses;

  AddCoursesSuccess({required this.courses});
}
