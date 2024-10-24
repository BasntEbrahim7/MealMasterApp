import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealmasterapp/logic/show_meal_state.dart';
import '../data/app_repo/Dio_halper.dart';

// MealCubit to handle fetching of meals
class mealCubit extends Cubit<mealState> {
  mealCubit() : super(mealInitial());

  static mealCubit get(BuildContext context) => BlocProvider.of(context);

  // Fetch meals by the first letter
  void getMealsByFirstLetter(String letter) {
    emit(mealLoading()); // Emit loading state

    DioHelper.getData(
      url: "search.php",
      query: {'f': letter},
    ).then((value) {
      List<Map<String, String?>> meals = List<Map<String, String?>>.from(
        value.data['meals'].map(
              (meal) => Map<String, String?>.from(meal),
        ),
      );

      emit(mealLoaded(meals)); // Emit loaded state with the meals
    }).catchError((error) {
      print("Error fetching meals: $error");
      emit(mealError("Failed to load meals")); // Emit error state
    });
  }

  // Fetch meals for all letters from 'A' to 'Z'
  void getAllMeals() async {
    emit(mealLoading()); // Emit loading state
    List<Map<String, String?>> allMeals = [];

    try {
      // Iterate through each letter from 'A' to 'Z'
      for (var i = 65; i <= 90; i++) {
        String letter = String.fromCharCode(i);

        // Fetch meals for each letter
        final response = await DioHelper.getData(
          url: "search.php",
          query: {'f': letter},
        );

        // Check if meals are returned and add them to the list
        if (response.data['meals'] != null) {
          List<Map<String, String?>> meals = List<Map<String, String?>>.from(
            response.data['meals'].map(
                  (meal) => Map<String, String?>.from(meal),
            ),
          );
          allMeals.addAll(meals); // Append meals for the current letter
        }
      }

      emit(mealLoaded(allMeals));  // Emit loaded state with all meals
    } catch (error) {
      print("Error fetching meals: $error");
      emit(mealError(error.toString())); // Emit error state
    }
  }
}
