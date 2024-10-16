import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: RecipeGrid(),
    );
  }
}

class RecipeGrid extends StatefulWidget {
  @override
  _RecipeGridState createState() => _RecipeGridState();
}

class _RecipeGridState extends State<RecipeGrid> {
  // Sample recipe data
  final List<Map<String, String>> recipes = [
    {'title': 'Spaghetti', 'image': 'https://via.placeholder.com/150'},
    {'title': 'Tacos', 'image': 'https://via.placeholder.com/150'},
    {'title': 'Sushi', 'image': 'https://via.placeholder.com/150'},
    {'title': 'Pizza', 'image': 'https://via.placeholder.com/150'},
    {'title': 'Burger', 'image': 'https://via.placeholder.com/150'},
    // Add more recipes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Grid'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10, // Horizontal spacing
          mainAxisSpacing: 10, // Vertical spacing
          childAspectRatio: 0.7, // Aspect ratio of each item
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeContainer(
            title: recipes[index]['title']!,
            imageUrl: recipes[index]['image']!,
          );
        },
      ),
    );
  }
}

class RecipeContainer extends StatelessWidget {
  final String title;
  final String imageUrl;

  RecipeContainer({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueAccent,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
