import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealmasterapp/screens/recipeMeal.dart';
import '../data/models/model.dart';
import '../logic/Meal_cubit.dart';
import '../logic/Meal_state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealCubit, MealState>(
      listener: (context, state) {
        if (state is MealGetErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        var cubit = MealCubit.get(context);

        return Scaffold(
          backgroundColor: Color(0xffe7e0d8),
          appBar: AppBar(
            title: Text(
              'Search Page',
              style: GoogleFonts.adamina(
                textStyle: TextStyle(
                  color: Color(0xFF550507),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xffe7e0d8),
            iconTheme: IconThemeData(color: Color(0xFF550507)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF550507), size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      borderSide: BorderSide(color: Color(0xFF550507)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFF550507), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFF550507), width: 1.5),
                    ),
                  ),
                  onChanged: (value) {
                    cubit.getMealBySearch(value); // Trigger meal search
                  },
                ),
                SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<MealCubit, MealState>(
                    builder: (context, state) {
                      if (state is MealGetLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is MealGetSuccessState) {
                        if (state.meals.isEmpty) {
                          return Center(child: Text('No results found',style: TextStyle(fontSize: 20),),);
                        } else {
                          return ListView.builder(
                            itemCount: state.meals.length,
                            itemBuilder: (context, index) {
                              final Meals meal = state.meals[index];
                              return ListTile(
                                leading: meal.strMealThumb != null
                                    ? Image.network(
                                  meal.strMealThumb!,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                )
                                    : SizedBox.shrink(),
                                title: Text(
                                  meal.strMeal!,
                                  style: TextStyle(color: Color(0xFF550507),fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  meal.strCategory ?? 'N/A',
                                  style: TextStyle(color: Color(0xFF550507,),fontSize: 15,fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  // Navigate to RecipeDetailsPage with meal details
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RecipeDetailsPage(meal: meal),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        }
                      } else if (state is MealGetErrorState) {
                        return Center(child: Text('Error: ${state.error}'));
                      }
                      return Center(child: Text('Start searching for meals',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
