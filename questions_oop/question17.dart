class Message {
  String sender;
  String receiver;
  String content;
  String timestamp;

  Message(this.sender, this.receiver, this.content, this.timestamp);

  void show() {
    print(sender);
    print(content);
  }
}

void main() {
  Message msg = Message('Ali', 'Mahmoud', ',Hello, how are you?', '2024-06-01 10:00');
  msg.show();
}
