import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/recipe_screen.dart';

class GridviewConts extends StatelessWidget {
  final String mealImage; // Parameter for meal image
  final String mealName; // Parameter for meal name
  final String mealRecipe; // Parameter for meal instructions/recipe
  final double borderRadius;

  // Parameters for up to 15 ingredients
  final String ing1;
  final String ing2;
  final String ing3;
  final String ing4;
  final String ing5;
  final String ing6;
  final String ing7;
  final String ing8;
  final String ing9;
  final String ing10;
  final String ing11;
  final String ing12;
  final String ing13;
  final String ing14;
  final String ing15;

  GridviewConts({
    required this.mealImage,
    required this.mealName,
    required this.mealRecipe,
    this.borderRadius = 0,
    required this.ing1,
    required this.ing2,
    required this.ing3,
    required this.ing4,
    required this.ing5,
    required this.ing6,
    required this.ing7,
    required this.ing8,
    required this.ing9,
    required this.ing10,
    required this.ing11,
    required this.ing12,
    required this.ing13,
    required this.ing14,
    required this.ing15,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeScreen(
              mealName: mealName,            // Pass the meal name
              mealImage: mealImage,          // Pass the meal image
              mealInstructions: mealRecipe,  // Pass the meal recipe
              // Pass all 15 ingredients to RecipeScreen
              ing1: ing1,
              ing2: ing2,
              ing3: ing3,
              ing4: ing4,
              ing5: ing5,
              ing6: ing6,
              ing7: ing7,
              ing8: ing8,
              ing9: ing9,
              ing10: ing10,
              ing11: ing11,
              ing12: ing12,
              ing13: ing13,
              ing14: ing14,
              ing15: ing15,
            ),
          ),
        );
      },
      child: Container(
        width: 130,
        height: 130,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(mealImage), // Display meal image from URL
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Overlay for gradient effect on image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Text overlay for meal name
            Positioned(
              bottom: 10,
              left: 5,
              right: 5,
              child: Text(
                mealName,
                style: GoogleFonts.adamina(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
