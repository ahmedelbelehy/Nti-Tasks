import 'package:chat_app/wedgets/chat_top_bar.dart';
import 'package:chat_app/wedgets/message_bubble.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> _messages = [
    "Hello 👋",
    "This is a black theme chat!",
    "No typing input here 😊"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Column(
        children: [
          ChatTopBar(), 
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(text: _messages[index]);
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
