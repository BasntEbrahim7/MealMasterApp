import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealmasterapp/screens/main_screen.dart';
import 'package:mealmasterapp/screens/welcome_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe7e0d8),
      appBar: AppBar(
        backgroundColor: const Color(0xffe7e0d8),
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Hero Image Section
            HeroSection(),
            const SizedBox(height: 20),

            // Form Section
            SignUpForm(
              formKey: _formKey,
              obscureText: _obscureText,
              onObscureTextChanged: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 240,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade300,
            offset: const Offset(4.0, 4.0),
            blurRadius: 10,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: const Color(0xff79433d),
            offset: const Offset(4.0, 4.0),
            blurRadius: 10,
            spreadRadius: 1.0,
          ),
        ],
        image: const DecorationImage(
          image: AssetImage("assets/images/pizza.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool obscureText;
  final Function onObscureTextChanged;

  SignUpForm({
    required this.formKey,
    required this.obscureText,
    required this.onObscureTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffe7e0d8).withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade300,
            offset: const Offset(4.0, 4.0),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: const Offset(4.0, 4.0),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              "Sign Up",
              style: GoogleFonts.adamina(
                textStyle: const TextStyle(
                  color: Color(0xFF550507),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Name Field
            CustomInputField(
              hintText: "Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Phone Number Field
            CustomInputField(
              hintText: "Phone number",
              validator: (value) {
                if (value == null || value.isEmpty || !RegExp(r'^\+?[0-9]{11}$').hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Email Field
            CustomInputField(
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Password Field
            CustomInputField(
              hintText: "Password",
              obscureText: obscureText,
              suffixIcon: IconButton(
                icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                color: Colors.black,
                onPressed: () => onObscureTextChanged(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff630209),
                fixedSize: const Size(170, 50),
                elevation: 10,
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?) validator;

  CustomInputField({
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
          borderSide: const BorderSide(color: Color(0xFF550507)), // Default border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xFF550507), width: 1.5), // When focused
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xFF550507), width: 1.5), // When not focused
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.5), // Error border
        ),
        labelText: hintText,
        labelStyle: const TextStyle(color: Colors.black),
        errorStyle: const TextStyle(color: Colors.red), // Error message color
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
