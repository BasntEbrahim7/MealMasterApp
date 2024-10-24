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
      body: SingleChildScrollView( // Wrap content in a scrollable view
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            meal.strMealThumb != null
                ? Center(
              child: Image.network(
                meal.strMealThumb!,
                height: 200,
              ),
            )
                : SizedBox.shrink(),
            SizedBox(height: 10),
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
              'Recipe Details:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF550507),
              ),
            ),
            SizedBox(height: 10),

            // Scrollable container for ingredients
            Center(
              child: Container(
                width: 250,
                height: 364,
                decoration: BoxDecoration(
                  color: Colors.brown.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 20),
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
              ),
            ),SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recipe Instructions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff550507),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                meal.strInstructions??"", // Show the recipe instructions
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build each ingredient and measure row with consistent styles
  Widget _buildIngredientRow(String? ingredient, String? measure, TextStyle ingredientStyle, TextStyle measureStyle) {
    return Row(
      children: [
        SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: Text(measure ?? '', style: measureStyle),
        ),
        Expanded(
          flex: 1,
          child: Text(ingredient ?? '', style: ingredientStyle),
        ),
      ],
    );
  }
}
