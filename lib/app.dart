
import 'package:flutter/material.dart';

import 'package:flutter_application_77/homeview.dart';



//stateless widget does not required mutable state.
//stateful widget is a widget that require mutable state. means change the state

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      theme: ThemeData(
         primarySwatch: Colors.blue
      ),
      home: const HomeView(),
    );
  }
}