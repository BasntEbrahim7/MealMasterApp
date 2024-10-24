import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/Meal_cubit.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _bounceAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Full-screen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Fade-in animation
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Bounce effect for the icon
    _bounceAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.bounceOut))
        .animate(_controller);

    // Scale animation for text
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    // Start the animations
    _controller.forward();

    // Delay for splash screen and navigate to the home screen
    Future.delayed(const Duration(seconds:4), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MealCubit(),
            child: MainScreen(),
          ),
        ),
      );}
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white70, // Darker red from your input
              Color(0xff630209), // Rich red for depth
              Color(0xFFC9BCB3), // Lighter neutral tone for contrast
            ],
            begin: Alignment.topLeft, // Starts from the top-left
            end: Alignment.bottomRight, // Blends towards bottom-right
            stops: [0.2, 0.5, 0.9], // Adjusts how the colors are distributed
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with bounce animation
            ScaleTransition(
              scale: _bounceAnimation,
              child: const Icon(
                Icons.foggy,
                color: Color(0xFFC3C7CA),
                size: 150,
              ),
            ),
            const SizedBox(height: 50), // Increase spacing between icon and text
            // Text with scale and fade transition
            ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: const Text(
                    'Discover tasty recipes\nfrom what’s already in your kitchen!',
                    textAlign: TextAlign.center, // Center the text
                    style: TextStyle(
                      fontFamily: 'Adamina',
                      fontSize: 25, // Increased font size for better readability
                      fontWeight: FontWeight.bold, // Slightly less bold for elegance
                      letterSpacing: 1.2, // Add letter spacing for better readability
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0), // Subtle shadow for depth
                          blurRadius: 4.0,
                          color: Color.fromARGB(100, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
