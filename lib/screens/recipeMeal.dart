import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/models/model.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Meals meal;

  RecipeDetailsPage({required this.meal});

  @override
  Widget build(BuildContext context) {
    // Define consistent styles for the ingredients and measures
    TextStyle ingredientTextStyle = GoogleFonts.adamina(
      textStyle: TextStyle(
        color: Color(0xFF550507),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );

    TextStyle measureTextStyle = GoogleFonts.adamina(
      textStyle: TextStyle(
        color: Color(0xFF630209),
        fontSize: 16,
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xffe7e0d8),
      appBar: AppBar(
        title: Text(
          meal.strMeal ?? 'Recipe Details',
          style: GoogleFonts.adamina(
            textStyle: TextStyle(
              color: Color(0xFF550507),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color(0xffe7e0d8),
        iconTheme: IconThemeData(color: Color(0xFF550507)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            meal.strMealThumb != null
                ? Center(
              child: Image.network(
                meal.strMealThumb!,
                height: 250,
              ),
            )
                : SizedBox.shrink(),
            SizedBox(height: 20),
            Text(
              'Category: ${meal.strCategory ?? 'N/A'}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF550507),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Recipe Details (Dummy Data):',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF550507),
              ),
            ),
            SizedBox(height: 10),

           Center(
             child: Container(
               width: 350,
               height: 455,
               decoration: BoxDecoration(color:Colors.brown.shade200,borderRadius: BorderRadius.circular(15)),

               child: Center(
                 child: ListView(
                   padding: const EdgeInsets.all(8.0),
                   physics: const BouncingScrollPhysics(),
                   children: [Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       SizedBox(height: 20,),

                       _buildIngredientRow(meal.strIngredient1, meal.strMeasure1, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient2, meal.strMeasure2, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient3, meal.strMeasure3, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient4, meal.strMeasure4, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient5, meal.strMeasure5, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient6, meal.strMeasure6, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient7, meal.strMeasure7, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient8, meal.strMeasure8, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient9, meal.strMeasure9, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient10, meal.strMeasure10, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient11, meal.strMeasure11, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient12, meal.strMeasure12, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient13, meal.strMeasure13, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient14, meal.strMeasure14, ingredientTextStyle, measureTextStyle),
                       _buildIngredientRow(meal.strIngredient15, meal.strMeasure15, ingredientTextStyle, measureTextStyle),
                     ],
                   ),
                 ]),
               ),
             ),
           ) // Ingredient and measure rows with consistent text styles

          ],
        ),
      ),
    );
  }

  // Helper function to build each ingredient and measure row with consistent styles
  Widget _buildIngredientRow(
      String? ingredient, String? measure, TextStyle ingredientStyle, TextStyle measureStyle) {
    return Row(

      children: [
        SizedBox(width: 20,),
        Expanded(
          flex: 1,
           // Adjusts how much space the ingredient takes
          child: Text(measure ?? '', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF550507))),
        ),
        SizedBox(width: 10), // Adds some spacing between ingredient and measure
        Expanded(
          flex: 1,
           // Adjusts how much space the measure takes

          child: Text(ingredient ?? '', style: TextStyle(fontSize:20,color: Color(0xFF550507),fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
