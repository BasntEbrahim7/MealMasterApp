import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  final String mealName;         // The name of the meal
  final String mealImage;        // The URL of the meal's image
  final String mealInstructions; // The recipe instructions
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

  // Constructor to accept meal details
  const RecipeScreen({
    Key? key,
    required this.mealName,
    required this.mealImage,
    required this.mealInstructions,
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
  }) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    // List of all ingredients
    List<String> ingredients = [
      widget.ing1,
      widget.ing2,
      widget.ing3,
      widget.ing4,
      widget.ing5,
      widget.ing6,
      widget.ing7,
      widget.ing8,
      widget.ing9,
      widget.ing10,
      widget.ing11,
      widget.ing12,
      widget.ing13,
      widget.ing14,
      widget.ing15,
    ];

    // Remove empty ingredient fields (in case some ingredients are not provided)
    ingredients = ingredients.where((ingredient) => ingredient.isNotEmpty).toList();

    return Scaffold(
      backgroundColor: Color(0xffe7e0d8),
      appBar: AppBar(
        title: Text(
          widget.mealName, // Display the meal name in the AppBar
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffe7e0d8),
        iconTheme: IconThemeData(color: Color(0xff630209)), // Icon color
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Color(0xff79433d),
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0,
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(widget.mealImage), // Show the meal image
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Text(
              //     'Recipe Instructions',
              //     style: TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xff550507),
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // SizedBox(height: 10),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Text(
              //     widget.mealInstructions, // Show the recipe instructions
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: Colors.black87,
              //     ),
              //     textAlign: TextAlign.justify,
              //   ),
              // ),
              SizedBox(height: 20),

              // Display the ingredients section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff550507),
                      ),
                    ),
                    SizedBox(height: 10),
                    // List of ingredients
                    ...ingredients.map((ingredient) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '- $ingredient',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    )),
                    SizedBox(height: 25,),
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
                        widget.mealInstructions, // Show the recipe instructions
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
            ],
          ),
        ),
      ),
    );
  }
}
