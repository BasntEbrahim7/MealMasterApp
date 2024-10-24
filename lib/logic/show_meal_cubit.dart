import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealmasterapp/logic/show_meal_state.dart';
import '../data/app_repo/Dio_halper.dart';

class mealCubit extends Cubit<mealState> {
  mealCubit() : super(mealInitial());

  static mealCubit get(context) => BlocProvider.of(context);

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
}
