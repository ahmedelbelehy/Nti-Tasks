import 'package:flutter/material.dart';
import 'package:ui/component/theme.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = appColorScheme;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Stack(
              children: [
                SizedBox(
                  height: 444,
                  width: double.infinity,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Onboarding Image.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          colorScheme.surface.withOpacity(0.0),
                          colorScheme.surface,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 28,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    colorScheme.surface.withOpacity(0.12),
                    colorScheme.surface,
                  ],
                  center: Alignment.topCenter,
                  radius: 1.2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SpaceGrotesk',
                            color: colorScheme.onBackground,
                          ),
                          children: [
                            const TextSpan(text: 'Discover, Collect and Sell '),
                            TextSpan(
                              text: 'NFTs',
                              style: TextStyle(
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: -8,
                        right: 50,
                        child: Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Image(
                            image: AssetImage("assets/images/Line mark.png"),
                            width: 100,
                            height: 15,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'A vibrant marketplace where creators showcase their unique NFTs.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'SpaceGrotesk',
                      color: colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(3, (index) {
                          final isActive = index == 0;
                          return Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.only(right: index < 2 ? 6 : 0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isActive
                                  ? colorScheme.onBackground
                                  : colorScheme.onBackground.withOpacity(0.3),
                            ),
                          );
                        }),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16),
                          backgroundColor: colorScheme.onBackground,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
