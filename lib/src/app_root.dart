// lib/app_root.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc package
import '../logic/Meal_cubit.dart';
import '../screens/home_screen.dart';

class AppRoot extends StatefulWidget {
  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  final TextStyle headingStyle = const TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: Color(0xFF550507),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MealCubit>(
            create: (context) => MealCubit(), // Initialize your MealCubit here
          ),
        ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,

      home: BlocProvider(
        create: (context) => MealCubit(), // Create and provide MealCubit
        child: HomeScreen(), // Pass HomeScreen as a child
      ),
    ));
  }
}
