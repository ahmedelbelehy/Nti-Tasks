import 'package:doctorhunt_app/ui/component/onboarding/custom_buttons.dart';
import 'package:doctorhunt_app/ui/screen/data/home_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -20,
            left: -104,
            child: Image.asset(
              'assets/images/Ellipse 153.png',
              width: 342,
              height: 342,
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 30),

                  ClipOval(
                    child: Image.asset(
                      'assets/images/do.jpg',
                      width: 336,
                      height: 336,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Column(
                    children: const [
                      SizedBox(height: 24),
                      Text(
                        "Easy Appointments",
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Contrary to popular belief, Lorem Ipsum is not/n"
                        "simply random text. It has roots in a piece of it/n"
                        " over 2000 years old.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  CustomButtons(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
