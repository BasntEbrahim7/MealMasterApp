abstract class mealState {}

class mealInitial extends mealState {}

class mealLoading extends mealState {}

class mealLoaded extends mealState {
 final List<Map<String, String?>> meals;

 mealLoaded(this.meals);
}

class mealError extends mealState {
 final String message;

 mealError(this.message);
}
