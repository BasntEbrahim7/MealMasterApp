import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealmasterapp/screens/recipe_screen.dart';

class GridviewConts extends StatefulWidget {
  final double borderRadius;

  GridviewConts({this.borderRadius = 0});

  @override
  State<GridviewConts> createState() => _GridviewContsState();
}

class _GridviewContsState extends State<GridviewConts> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeScreen()));
      },
      child:

          Container(
            width: 130,
            height: 130,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
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
              image: const DecorationImage(
                image: AssetImage('assets/images/burger.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child:
            Stack(
              children: [

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
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
                // Text overlay
              ],
            ),
          ),
    );
  }
}
