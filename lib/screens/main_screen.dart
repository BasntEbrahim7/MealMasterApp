import 'package:flutter/material.dart';
import 'package:mealmasterapp/containers/gridview_conts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealmasterapp/screens/search_screen.dart';

import 'MenuScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7e0d8),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: EdgeInsets.only(
          top: 30.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()));
                  },
                  child: Icon(Icons.menu_open_sharp, color: Color(0xff630209), size: 40),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  child: Icon(Icons.search_rounded, color: Color(0xff630209), size: 40),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Wrapping the texts in a SingleChildScrollView
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Hi !",
                      style: GoogleFonts.adamina(
                        textStyle: TextStyle(
                          color: Color(0xFF550507),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "What would you like to cook today?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 15),
                    // Adding the GridView
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(), // Prevent GridView from scrolling separately
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10, // Increased spacing
                      ),
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return GridviewConts(
                          borderRadius: 15,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
