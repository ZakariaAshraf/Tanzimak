import 'package:flutter/material.dart';

import 'features/start_screen/views/start_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tanzimak',
      debugShowCheckedModeBanner: false,
      home: StartScreenView(),
    );
  }
}
