import 'package:flutter/material.dart';
import 'package:mealmasterapp/screens/about_screen.dart';
import 'package:mealmasterapp/screens/sign_in.dart';
import 'package:mealmasterapp/screens/sign_up.dart';

class SignPage extends StatefulWidget {

  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7e0d8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              height: 400,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.5),
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: const Color(0xff79433d).withOpacity(0.5),
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15,
                    spreadRadius: 1.0,
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage("assets/images/about.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(
                       // Pass the callback correctly
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF550507),
                fixedSize: const Size(300, 75),
                shadowColor: const Color(0xFF550507),
                elevation: 10,
              ),
              child: const Text(
                "Sign in",
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF550507),
                fixedSize: const Size(300, 75),
                shadowColor: const Color(0xFF550507),
                elevation: 10,
              ),
              child: const Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutScreen(
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF550507),
                fixedSize: const Size(300, 75),
                shadowColor: const Color(0xFF550507),
                elevation: 10,
              ),
              child: const Text(
                "About",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
