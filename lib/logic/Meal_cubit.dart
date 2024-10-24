import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealmasterapp/data/app_repo/Dio_halper.dart';
import 'package:mealmasterapp/data/models/model.dart';
import 'package:mealmasterapp/logic/Meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());

  // Method to get the MealCubit instance easily

  static MealCubit get(BuildContext context) => BlocProvider.of(context);
  // Function to get meal by name
  void getMealBySearch(String mealName) {
    emit(MealGetLoadingState()); // Notify UI that loading has started

    // Make the API call
    DioHelper.getData(
      url: "search.php",
      query: {'s': mealName},
    ).then((value) {
      if (value.data['meals'] != null) {
        List<Meals> meals = List<Meals>.from(
            value.data['meals'].map((meal) => Meals.fromJson(meal))
        );
        emit(MealGetSuccessState(meals)); // Emit success state with meals
      } else {
        emit(MealGetSuccessState([])); // Emit success state with empty list
      }
    }).catchError((error) {
      emit(MealGetErrorState(error.toString())); // Notify UI of an error
    });
  }
}

