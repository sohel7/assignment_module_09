import 'package:flutter/material.dart';

import 'blog_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Blog',
      home: BlogScreen(),
    );
  }
}
