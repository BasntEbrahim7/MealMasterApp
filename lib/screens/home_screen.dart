import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../containers/homecontainers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextStyle headingStyle = const TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: Color(0xFF550507),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xE3E3E3FF),
      //
      //   // actions: [
      //   //   Switch(
      //   //     value: _themeMode == ThemeMode.dark,
      //   //     onChanged: (bool value) {
      //   //       setState(() {
      //   //         _themeMode = value ? ThemeMode.dark : ThemeMode.light;
      //   //       });
      //   //       onThemeChanged(value);
      //   //     },
      //   //   ),
      //   // ],
      // ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/toma.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title text
                Text(
                  'Get your favorite\n food recipe.',
                  style: GoogleFonts.adamina(textStyle: TextStyle(color:Color(0xFF550507),fontSize: 50 ,fontWeight: FontWeight.bold)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                signContainers(
                  text2: 'Let\'s Start',
                  color: const Color(0xFF550507),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//   void onThemeChanged(bool isDark) {
//     setState(() {
//       _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
//     });
//     // Optionally, you can handle additional actions when the theme changes
//   }
}



