import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealmasterapp/screens/recipe_screen.dart';

class GridviewConts extends StatelessWidget {
  final String mealImage; // Parameter for meal image
  final String mealName;  // Parameter for meal name
  final double borderRadius;

  GridviewConts({
    required this.mealImage,
    required this.mealName,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeScreen()));
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
