import 'package:flutter/material.dart';

class AboutContainers extends StatelessWidget {
  final String text1;
  final String text2;

  const AboutContainers({
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff630209), // Background color for the container
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(  // Clip to apply rounded corners
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          title: Text(
            text1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text2,
                style: TextStyle(
                  color: Color(0xFFB9A7A2),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
          tilePadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          collapsedBackgroundColor: const Color(0xff630209),
          backgroundColor: const Color(0xff630209),
          iconColor: Colors.white,
        ),
      ),
    );
  }
}
