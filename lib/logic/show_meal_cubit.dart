import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../data/models/model 2.dart';
import 'Meal_state.dart';
import 'show_meal_state.dart';


class MealCubit extends Cubit<MealState> {
  final Dio _dio;

  MealCubit(this._dio) : super(MealInitial());

  Future<void> fetchRandomMeals(int count) async {
    emit(MealLoading());
    try {
      final List<Meal> meals = [];
      for (int i = 0; i < count; i++) {
        final response = await _dio.get('https://www.themealdb.com/api/json/v1/1/random.php');
        final meal = Meal.fromJson(response.data);
        meals.add(meal);
      }
      emit(MealLoaded(meals));
    } catch (e) {
      emit(MealError('Failed to fetch meals: ${e.toString()}'));
    }
  }
}
