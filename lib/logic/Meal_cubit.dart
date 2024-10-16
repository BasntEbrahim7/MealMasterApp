import 'package:bloc/bloc.dart';
import 'package:mealmasterapp/data/app_repo/Dio_halper.dart';
import 'package:meta/meta.dart';

part 'Meal_state.dart';

class MealCubit extends Cubit<MealState> {
  String? UserMeal;
  MealCubit() : super(MealInitial());
  getMealBySearch(){
  DioHelper.getData(url: "search.php",
    query: {'s':UserMeal
    }).then(
        (value){}

 ).catchError((error){});
  }
}
