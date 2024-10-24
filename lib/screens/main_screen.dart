import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealmasterapp/containers/gridview_conts.dart';
import 'package:mealmasterapp/screens/search_screen.dart';
import '../logic/show_meal_cubit.dart';
import '../logic/show_meal_state.dart';
import 'MenuScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch meals for all letters (A-Z) when the screen is initialized
    context.read<mealCubit>().getAllMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7e0d8),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: EdgeInsets.only(
          top: 30.0,
        ),
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

                    // BlocBuilder to update the GridView when meals are fetched
                    BlocBuilder<mealCubit, mealState>(
                      builder: (context, state) {
                        if (state is mealLoading) {
                          // Show loading spinner while data is being fetched
                          return Center(child: CircularProgressIndicator());
                        } else if (state is mealError) {
                          // Show error message if fetching meals fails
                          return Center(
                            child: Text(
                              'Error fetching meals: ${state.message}',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                          );
                        } else if (state is mealLoaded) {
                          var meals = state.meals;

                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(), // Prevent GridView from scrolling separately
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10, // Increased spacing
                            ),
                            itemCount: meals.length,
                            itemBuilder: (context, index) {
                              var meal = meals[index];
                              return GridviewConts(
                                mealName: meal['strMeal'] ?? "Meal", // Display meal name
                                mealImage: meal['strMealThumb'] ?? '', // Display meal image
                                borderRadius: 15,
                                mealRecipe: meal['strInstructions'] ?? "No instructions available.",
                                ing1: meal['strIngredient1'] ?? "",
                                ing2: meal['strIngredient2'] ?? "",
                                ing3: meal['strIngredient3'] ?? "",
                                ing4: meal['strIngredient4'] ?? "",
                                ing5: meal['strIngredient5'] ?? "",
                                ing6: meal['strIngredient6'] ?? "",
                                ing7: meal['strIngredient7'] ?? "",
                                ing8: meal['strIngredient8'] ?? "",
                                ing9: meal['strIngredient9'] ?? "",
                                ing10: meal['strIngredient10'] ?? "",
                                ing11: meal['strIngredient11'] ?? "",
                                ing12: meal['strIngredient12'] ?? "",
                                ing13: meal['strIngredient13'] ?? "",
                                ing14: meal['strIngredient14'] ?? "",
                                ing15: meal['strIngredient15'] ?? "",

                              );
                            },
                          );
                        }
                        // Show default loading spinner when no state is available
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
