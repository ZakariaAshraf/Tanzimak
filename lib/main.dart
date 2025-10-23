import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzimak/features/add_courses/cubit/add_courses_cubit.dart';

import 'features/start_screen/views/start_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AddCoursesCubit())],
      child: MaterialApp(
        title: 'Tanzimak',
        debugShowCheckedModeBanner: false,
        home: StartScreenView(),
      ),
    );
  }
}
