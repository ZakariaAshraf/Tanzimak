import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzimak/core/config/app_colors.dart';
import 'package:tanzimak/core/data/course_model.dart';
import 'package:tanzimak/features/add_courses/cubit/add_courses_cubit.dart';
import 'package:tanzimak/features/add_courses/widgets/course_item.dart';
import '../../../widgets/primary_button.dart';
import '../../preference/views/set_your_preferences_screen.dart';
import '../widgets/add_courses_dialog.dart';
import '../../../l10n/app_localizations.dart';

class AddCoursesScreen extends StatelessWidget {
  const AddCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;
    List<CourseModel> courses = context.watch<AddCoursesCubit>().courses;
   bool isAvailableCourses (){
     if (courses.isEmpty) {
       return false;
     }
     return true;
   }
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addCourses, style: theme.titleLarge),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              l10n.addCoursesDescription,
              style: theme.bodyMedium!.copyWith(color: Colors.grey.shade600),
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              itemBuilder: (context, index) => BlocProvider(
                create: (context) => AddCoursesCubit(),
                child: CourseItem(
                  item: courses[index],
                  onTap: () => context.read<AddCoursesCubit>().removeCourse(courses[index]),
                ),
              ),
              itemCount: courses.length,
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AddCoursesDialog(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                width: 327,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    l10n.addNewCourse,
                    style: theme.bodyMedium!.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: PrimaryButton(
              color: isAvailableCourses() ? AppColors.primary : Colors.grey ,
              title: l10n.generateSchedules(courses.length),
              onTap: isAvailableCourses() ? (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetYourPreferencesScreen(courses: courses,),
                  ),
                );
              } : null ,
            ),
          ),
        ],
      ),
    );
  }
}
