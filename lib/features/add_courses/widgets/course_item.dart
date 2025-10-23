import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanzimak/core/config/app_colors.dart';
import 'package:tanzimak/core/data/course_model.dart';

class CourseItem extends StatelessWidget {
  final CourseModel item;
  final Function() onTap;

  const CourseItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Card(
      child: ListTile(
        title: Text(item.name,style: theme.titleMedium,),
        subtitle:Text("${item.timings.toString()}\n${item.creditHours}hrs"),
        leading: Icon(Icons.book,color: AppColors.primary,),
        trailing: IconButton(
          onPressed: onTap,
          icon: Icon(Icons.close, color: Colors.red),
        ),      ),
    );
  }
}
