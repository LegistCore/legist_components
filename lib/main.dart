import 'package:flutter/material.dart';
import 'package:legist_components/app_router.dart';
import 'package:legist_components/show_case/second_sprint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SecondSprint.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute, 
    );
  }
}
