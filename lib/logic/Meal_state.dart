import '../data/models/model.dart';

abstract class MealState {}

class MealInitial extends MealState {}

class MealGetLoadingState extends MealState {}

class MealGetSuccessState extends MealState {
 final List<Meals> meals;

 MealGetSuccessState(this.meals);
}
class MealGetErrorState extends MealState {
 final String error;
 MealGetErrorState(this.error);
}







