import 'package:doctorhunt_app/ui/component/onboarding/custom_buttons.dart';
import 'package:doctorhunt_app/ui/screen/onboarding/onboarding3.dart';
import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -20,
            right: -104,
            child: Image.asset(
              'assets/images/Ellipse 153 (1).png',
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
                      'assets/images/e5e1ae30fa8459487b86e056c753aab85a53f3f6.jpg',
                      width: 336,
                      height: 336,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Column(
                    children: const [
                      SizedBox(height: 24),
                      Text(
                        "Choose Best Doctors",
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Contrary to popular belief, Lorem Ipsum is not\n"
                        "simply random text. It has roots in a piece of it\n"
                        "over 2000 years old.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  CustomButtons(onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingPage3 (),
                      ),
                    );
                  }),
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
