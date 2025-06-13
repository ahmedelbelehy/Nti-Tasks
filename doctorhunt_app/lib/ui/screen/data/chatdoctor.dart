import 'package:flutter/material.dart';

class DoctorChatScreen extends StatefulWidget {
  final String backgroundImageUrl;
  const DoctorChatScreen({super.key, required this.backgroundImageUrl});

  @override
  State<DoctorChatScreen> createState() => _DoctorChatScreenState();
}

class _DoctorChatScreenState extends State<DoctorChatScreen> {
  final _commentController = TextEditingController();
  final List<Comment> comments = [
    Comment(
      name: "Everhart Tween",
      message: "Thanks for shareing doctor ❤️",
      avatar: "assets/images/photo1.jpg",
    ),
    Comment(
      name: "Bonebrake Mash",
      message: "They treat immune system disorders",
      avatar: "assets/images/poto2.jpg",
    ),
    Comment(
      name: "Handler Wack",
      message: "This is the largest directory 👍",
      avatar: "assets/images/photo3.jpg",
    ),
    Comment(
      name: "Comfort Love",
      message: "Depending on their education 😊",
      avatar: "assets/images/photo4.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            widget.backgroundImageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, size: 20),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/WhatsApp Image 2025-06-13 at 04.40.46_bafc9579.jpg",
                        ),
                        radius: 25,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder:
                        (_, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(comments[i].avatar),
                          ),
                          title: Text(
                            comments[i].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            comments[i].message,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextField(
                            controller: _commentController,
                            decoration: const InputDecoration(
                              hintText: "Add a comment...",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: _sendComment,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        comments.insert(
          0,
          Comment(
            name: "You",
            message: text,
            avatar: "assets/images/backcaht.jpg",
          ),
        );
      });
      _commentController.clear();
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}

class Comment {
  final String name, message, avatar;
  Comment({required this.name, required this.message, required this.avatar});
}
