import 'package:doctorhunt_app/ui/component/common/home_page/widgets/live_doctor_chat.dart';
import 'package:doctorhunt_app/ui/screen/data/chatdoctor.dart';
import 'package:doctorhunt_app/ui/screen/data/finddoctor.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00E0C6), Color(0xFF2DCDDF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and avatar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi Handwerker!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 6),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const FindDoctorsPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Find Your Doctor",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            "assets/images/header.jpg",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Search bar
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 12),
                          Text(
                            "Search...",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Spacer(),
                          Icon(Icons.close, color: Colors.grey),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Live Doctors Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Live Doctors",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      height: 168,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          // Generate doctor image URL based on index (1 to 3)
                          String imageUrl =
                              'assets/images/doctor ${index + 1}.jpg';
                          return LiveDoctorCard(imageUrl: imageUrl);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Categories Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CategoryIcon(
                      icon: Icons.medication,
                      color: Color(0xFF6366F1),
                    ),
                    _CategoryIcon(
                      icon: Icons.favorite,
                      color: Color(0xFF10B981),
                    ),
                    _CategoryIcon(
                      icon: Icons.remove_red_eye,
                      color: Color(0xFFF59E0B),
                    ),
                    _CategoryIcon(
                      icon: Icons.local_hospital,
                      color: Color(0xFFEF4444),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Popular Doctors Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Popular Doctor",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF00E0C6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _DoctorCard(
                            name: "Dr. Fillerup Grab",
                            specialty: "Medicine",
                            image: "assets/images/popular doctor 1.jpg",
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _DoctorCard(
                            name: "Dr. Blessing",
                            specialty: "Dentist",
                            image: "assets/images/popular_doctor 2.jpg",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Feature Doctor Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Feature Doctor",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF00E0C6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _FeatureDoctor(
                            name: "Dr. Crick",
                            price: "\$25/hr",
                            rating: "3.7",
                            image: "assets/images/feature_doctor 1.jpg",
                          ),
                          SizedBox(width: 12),
                          _FeatureDoctor(
                            name: "Dr. Strain",
                            price: "\$22/hr",
                            rating: "3.0",
                            image: "assets/images/feature_doctor 2.jpg",
                          ),
                          SizedBox(width: 12),
                          _FeatureDoctor(
                            name: "Dr. Lachinet",
                            price: "\$29/hr",
                            rating: "2.9",
                            image: "assets/images/feature_doctor 3.jpg",
                          ),
                          SizedBox(width: 12),
                          _FeatureDoctor(
                            name: "Dr. Crick",
                            price: "\$25/hr",
                            rating: "3.7",
                            image: "assets/images/feature_doctor 1.jpg",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF00E0C6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.home, color: Colors.white, size: 24),
            ),
            const Icon(Icons.favorite_outline, color: Colors.grey, size: 24),
            const Icon(
              Icons.calendar_today_outlined,
              color: Colors.grey,
              size: 24,
            ),
            const Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 24),
          ],
        ),
      ),
    );
  }


}

class _CategoryIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _CategoryIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}

class _DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;

  const _DoctorCard({
    required this.name,
    required this.specialty,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 264,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            specialty,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureDoctor extends StatelessWidget {
  final String name;
  final String price;
  final String rating;
  final String image;

  const _FeatureDoctor({
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 96,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 8,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 12),
                const SizedBox(width: 2),
                Text(rating, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
