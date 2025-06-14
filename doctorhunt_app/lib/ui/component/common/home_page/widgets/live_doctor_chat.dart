import 'package:doctorhunt_app/ui/screen/data/chatdoctor.dart';
import 'package:flutter/material.dart';

class LiveDoctorCard extends StatelessWidget {
  final String imageUrl;

  const LiveDoctorCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DoctorChatScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 117,
        height: 168,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) {
              print('Error loading image: $imageUrl');
            },
          ),
        ),
        child: Stack(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black54,
                child: Icon(Icons.play_arrow, color: Colors.white, size: 20),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "LIVE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
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