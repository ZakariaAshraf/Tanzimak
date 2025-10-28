import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tanzimak/core/data/course_model.dart';

part 'add_courses_state.dart';

class AddCoursesCubit extends Cubit<AddCoursesState> {
  AddCoursesCubit() : super(AddCoursesInitial());
  List<CourseModel>courses=[];
  // List<CourseModel>courses=CourseModel.getMockCourses();
  addCourse(CourseModel courseModel){
    emit(AddCoursesLoading());
    courses.add(courseModel);
    emit(AddCoursesSuccess(courses: courses));
  }
  removeCourse(CourseModel courseModel){
    emit(AddCoursesLoading());
    courses.remove(courseModel);
    emit(AddCoursesSuccess(courses: courses));
  }
}
