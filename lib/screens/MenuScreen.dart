import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7e0d8),
      appBar: AppBar(
        title: Text('Menu Page',style: GoogleFonts.adamina(textStyle: TextStyle(color:Color(0xFF550507),fontSize: 30,fontWeight: FontWeight.bold))),
        centerTitle: true,
        backgroundColor: Color(0xffe7e0d8) ,
        iconTheme:IconThemeData(color: Color((0xFF550507))),
      ),body: Column(
      children: [

      ],
    ),
    );
  }
}
