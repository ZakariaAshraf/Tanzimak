import 'package:flutter/material.dart';
import 'package:tanzimak/core/config/app_colors.dart';
import 'package:tanzimak/widgets/primary_button.dart';

import '../../add_courses/views/add_courses_screen.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 230),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text("Tanzimak", style: theme.displayLarge),
                Text(
                  "Build your perfect university schedule without the stress.",
                  style: theme.bodyMedium!.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: PrimaryButton(
              title: "Get Started",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCoursesScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
