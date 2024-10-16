import 'package:flutter/material.dart';

class Containers extends StatefulWidget {
  final String text1;
  final String text2;
  final double borderRadius;

  const Containers({
    super.key,
    required this.text2,
    required this.text1,
    this.borderRadius = 0,
  });

  @override
  State<Containers> createState() => _ContainersState();
}

class _ContainersState extends State<Containers> {
  bool isExpanded1 = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded1 = !isExpanded1;
        });
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        height: isExpanded1 ? 120 : 70,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.expand_more,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
            if (isExpanded1)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  widget.text2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
