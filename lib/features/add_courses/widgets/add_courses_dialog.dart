import 'package:flutter/material.dart';
import 'package:tanzimak/core/data/course_model.dart';

import '../../../core/config/app_colors.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';

class AddCoursesDialog extends StatefulWidget {
  final BuildContext context;


   const AddCoursesDialog({super.key, required this.context});

  @override
  State<AddCoursesDialog> createState() => _AddCoursesDialogState();
}

class _AddCoursesDialogState extends State<AddCoursesDialog> {
  final List<CourseModel> courses=CourseModel.getMockCourses();

  @override
  Widget build(BuildContext context) {
    TextEditingController courseNameController = TextEditingController();
    TextEditingController courseCodeController = TextEditingController();
    TextEditingController courseHoursController = TextEditingController();

    var theme = Theme.of(context).textTheme;
    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 500,
        child: Column(
          children: [
            /// heading
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add Courses", style: theme.titleMedium),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Divider(color: AppColors.lightGrey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: courseNameController,
                  title: "Course Name",
                  hintText: "e.g. Introduction to Programming",
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: courseCodeController,
                        title: "Course Code",
                        hintText: "e.g. CS101",
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: courseHoursController,
                        title: "Course Hours",
                        hintText: "e.g. 3",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: 12, minute: 0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course Timing", style: theme.titleMedium),
                        Row(
                          children: [
                            Icon(Icons.add_circle_outline, color: Colors.blue),
                            Text(
                              "Add another Timing",
                              style: theme.titleMedium!.copyWith(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: PrimaryButton(
                    onTap: () {
                      CourseModel model = CourseModel(
                        name: courseNameController.text,
                        code: courseCodeController.text,
                        creditHours: int.parse(courseHoursController.text),
                        timings: [
                          TimeSlot(
                            day: DayOfWeek.sunday,
                            startTime: TimeOfDay.now(),
                            endTime: TimeOfDay(hour: 2, minute: 10),
                          ),
                          TimeSlot(
                            day: DayOfWeek.sunday,
                            startTime: TimeOfDay.now(),
                            endTime: TimeOfDay(hour: 2, minute: 10),
                          ),
                        ],
                      );
                      print(courses);
                      courses.add(model);
                      setState(() {});
                      print(courses);
                      Navigator.pop(context);
                    },
                    title: "Save Course",
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
