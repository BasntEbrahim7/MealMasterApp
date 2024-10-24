import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealmasterapp/containers/gridview_conts.dart'; // Ensure this points to your GridviewConts file
import 'package:google_fonts/google_fonts.dart';
import 'package:mealmasterapp/screens/search_screen.dart';
import '../logic/show_meal_cubit.dart';
import 'MenuScreen.dart';
import 'package:dio/dio.dart'; // Import Dio for HTTP requests

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch random meals when the widget is initialized
    context.read<MealCubit>().fetchRandomMeals(6); // Fetch 6 random meals
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealCubit(Dio()), // Provide MealCubit
      child: Scaffold(
        backgroundColor: Color(0xffe7e0d8),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          margin: EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()));
                    },
                    child: Icon(Icons.menu_open_sharp, color: Color(0xff630209), size: 40),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                    },
                    child: Icon(Icons.search_rounded, color: Color(0xff630209), size: 40),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Wrapping the texts in a SingleChildScrollView
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Hi !",
                        style: GoogleFonts.adamina(
                          textStyle: TextStyle(
                            color: Color(0xFF550507),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "What would you like to cook today?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 15),

                      // Adding the GridView
                      BlocBuilder<MealCubit, MealState>(
                        builder: (context, state) {
                          if (state is MealLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is MealLoaded) {
                            return GridView.builder(
                              physics: NeverScrollableScrollPhysics(), // Prevent GridView from scrolling separately
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10, // Increased spacing
                              ),
                              itemCount: state.meals.length,
                              itemBuilder: (context, index) {
                                final meal = state.meals[index];
                                return GridviewConts(
                                  borderRadius: 15,
                                  mealImage: meal.strMealThumb, // Display the meal image
                                  mealName: meal.strMeal, // Display the meal name
                                );
                              },
                            );
                          } else if (state is MealError) {
                            return Center(child: Text(state.message));
                          }

                          return Center(
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<MealCubit>().fetchRandomMeals(20); // Fetch 6 random meals
                              },
                              child: Text('Fetch Random Meals'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
