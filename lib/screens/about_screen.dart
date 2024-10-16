import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../containers/about_container.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7e0d8),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'About',
          style: GoogleFonts.adamina(
            textStyle: TextStyle(
              color: Color(0xFF550507),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.brown.shade200,
              ),
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 60),
                      const AboutContainers(
                        text1: 'App name and version:',
                        text2: 'MealMaster - Version 1.0.',
                      ),
                      const AboutContainers(
                        text1: "App purpose:",
                        text2:
                        "MealMaster app is an effective app to find any recipe you want",
                      ),
                      const AboutContainers(
                        text1: "Contact information",
                        text2:
                        "basntebrahim5@gamil.com\nBasmala.ashrafabdelrahim2005@gmail.com",
                      ),
                      const AboutContainers(
                        text1: "Developer information",
                        text2: "Developed by"
                            " Basmala Ashraf Abdel_Rahim\n"
                            "Basnt Ibrahim Mohammed",
                      ),
                      Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Rate:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: StarRate(
                                onRatingChanged: (rating) {
                                  // Optional: Implement further actions based on the rating
                                },
                              ),
                            ),
                          ],
                          tilePadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          backgroundColor: const Color(0xff630209),
                          collapsedBackgroundColor: const Color(0xff630209),
                          iconColor: Colors.white,
                        ),
                      ),
                      const AboutContainers(
                        text1: "Legal Disclaimer:",
                        text2:
                        "'This app is provided as-is and the developer is not responsible for any inaccuracies.'",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 100,
            bottom: 530,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/burger.jpg"),
              radius: 80,
            ),
          ),
        ],
      ),
    );
  }
}

class StarRate extends StatefulWidget {
  final Function(int)? onRatingChanged;
  const StarRate({super.key, this.onRatingChanged});

  @override
  State<StarRate> createState() => _StarRateState();
}

class _StarRateState extends State<StarRate> {
  int selectedRating = 0;

  @override
  void initState() {
    super.initState();
    _loadSavedRating(); // Load saved rating when the widget is initialized
  }

  Future<void> _loadSavedRating() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedRating = prefs.getInt('savedRating') ?? 0; // Load the saved rating
    });
    print("Loaded Rating: $selectedRating"); // Debug log
  }

  Future<void> _saveRating(int rating) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('savedRating', rating); // Save the rating
    print("Saved Rating: $rating"); // Debug log
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Optional logic for tap
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedRating = index + 1;
              });
              _saveRating(selectedRating); // Auto-save the rating
              if (widget.onRatingChanged != null) {
                widget.onRatingChanged!(selectedRating); // Call parent callback
              }
            },
            child: Icon(
              index < selectedRating ? Icons.star_rate_sharp : Icons.star_border,
              color: Colors.yellow,
              size: 25,
            ),
          );
        }),
      ),
    );
  }
}
