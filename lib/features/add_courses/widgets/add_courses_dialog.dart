import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzimak/core/config/screen_util.dart';
import 'package:tanzimak/core/data/course_model.dart';
import 'package:tanzimak/features/add_courses/cubit/add_courses_cubit.dart';
import 'package:tanzimak/features/add_courses/widgets/time_picker.dart';

import '../../../core/config/app_colors.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../l10n/app_localizations.dart';

class AddCoursesDialog extends StatefulWidget {
  const AddCoursesDialog({super.key});

  @override
  State<AddCoursesDialog> createState() => _AddCoursesDialogState();
}

class _AddCoursesDialogState extends State<AddCoursesDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _courseNameController;
  late final TextEditingController _courseCodeController;
  late final TextEditingController _courseHoursController;
  final List<TimeSlot> _timings = [];

  @override
  void initState() {
    super.initState();
    _courseNameController = TextEditingController();
    _courseCodeController = TextEditingController();
    _courseHoursController = TextEditingController();
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    _courseCodeController.dispose();
    _courseHoursController.dispose();
    super.dispose();
  }

  void _showTimeSlotPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: SizedBox(
            height: 450.h(context),
            child: TimeSlotPicker(
              onSave: (newTimeSlot) {
                setState(() {
                  _timings.add(newTimeSlot);
                });
                Navigator.pop(ctx);
              },
            ),
          ),
        );
      },
    );
  }

  /// Handles the final "Save Course" button press
  void _saveCourse() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (_timings.isEmpty) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.pleaseAddTiming),
          backgroundColor: Colors.orangeAccent,
        ),
      );
      return;
    }

    final creditHours = int.tryParse(_courseHoursController.text);
    if (creditHours == null) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.pleaseEnterValidHours),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final model = CourseModel(
      name: _courseNameController.text,
      code: _courseCodeController.text,
      creditHours: creditHours,
      timings: _timings,
    );
    context.read<AddCoursesCubit>().addCourse(model);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l10n.addCourse, style: theme.titleMedium),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const Divider(color: AppColors.lightGrey),

                /// Course Details
                CustomTextField(
                  controller: _courseNameController,
                  title: l10n.courseName,
                  hintText: l10n.courseNameHint,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _courseCodeController,
                        title: l10n.courseCode,
                        hintText: l10n.courseCodeHint,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: _courseHoursController,
                        title: l10n.courseHours,
                        hintText: l10n.courseHoursHint,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h(context)),

                Text(l10n.courseTimings, style: theme.titleMedium),
                SizedBox(height: 8.h(context)),

                /// List of Added Timings
                SizedBox(
                  height: _timings.isEmpty ? 0 : 130.h(context),
                  child: ListView.builder(
                    itemCount: _timings.length,
                    itemBuilder: (ctx, index) {
                      final slot = _timings[index];
                      return Card(
                        child: ListTile(
                          title: Text(slot.toString()),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                _timings.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /// "Add Timing" Button
                GestureDetector(
                  onTap: _showTimeSlotPicker,
                  child: Row(
                    children: [
                      const Icon(Icons.add_circle_outline, color: Colors.blue),
                      SizedBox(width: 8.w(context)),
                      Text(
                        l10n.addAnotherTiming,
                        style: theme.titleMedium!.copyWith(color: Colors.blue),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.h(context)),
                PrimaryButton(
                  onTap: _saveCourse,
                  title: l10n.saveCourse,
                  color: Colors.deepOrangeAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
