import 'package:flutter/material.dart';

class DoctorChatScreen extends StatefulWidget {
  final String backgroundImageUrl;

  const DoctorChatScreen({super.key, required this.backgroundImageUrl});

  @override
  State<DoctorChatScreen> createState() => _DoctorChatScreenState();
}

class _DoctorChatScreenState extends State<DoctorChatScreen> {
  final TextEditingController _commentController = TextEditingController();

  final List<Comment> comments = [
    Comment(
      name: "Everhart Tween",
      message: "Thanks for sharing doctor ❤️",

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
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark overlay for better text visibility
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Top Bar
                _buildTopBar(),

                // Spacer to push comments to bottom
                const Spacer(),

                // Comments List
                _buildCommentsList(),

                // Comment Input
                _buildCommentInput(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Back Button
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 20),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
            ),
          ),

          const Spacer(),

          // Doctor Profile Icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                "assets/images/WhatsApp Image 2025-06-13 at 04.40.46_bafc9579.jpg",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.blue.shade100,
                    child: const Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 300),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return _buildCommentItem(comments[index]);
        },
      ),
    );
  }

  Widget _buildCommentItem(Comment comment) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            backgroundImage: AssetImage(comment.avatar),
            onBackgroundImageError: (exception, stackTrace) {
              print('Error loading avatar: $exception');
            },
          ),

          const SizedBox(width: 12),

          // Comment Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  comment.message,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
      child: Row(
        children: [
          // Comment Input Field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: "Add a Comment.....",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  prefixIcon: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Send Button
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white, size: 20),
              onPressed: _sendComment,
            ),
          ),
        ],
      ),
    );
  }

  void _sendComment() {
    if (_commentController.text.trim().isNotEmpty) {
      setState(() {
        comments.insert(
          0,
          Comment(
            name: "You",
            message: _commentController.text.trim(),

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
  final String name;
  final String message;
  final String avatar;

  Comment({required this.name, required this.message, required this.avatar});
}
