import 'package:chat_app/wedgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Screen/textcontenar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ContactItem> contacts = [
    ContactItem(
      name: "user1",
      avatarUrl:
          "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000",
    ),
    ContactItem(
      name: "user2",
      avatarUrl:
          "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&auto=format&fit=crop&w=1170&q=80",
    ),
    ContactItem(
      name: "user3",
      avatarUrl:
          "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000",
    ),
    ContactItem(
      name: "user4",
      avatarUrl:
          "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&auto=format&fit=crop&w=1170&q=80",
    ),
    ContactItem(
      name: "user5",
      avatarUrl:
          "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000",
    ),
    ContactItem(
      name: "user6",
      avatarUrl:
          "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&auto=format&fit=crop&w=1170&q=80",
    ),
    ContactItem(
      name: "user7",
      avatarUrl:
          "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000",
    ),
    ContactItem(
      name: "user8",
      avatarUrl:
          "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&auto=format&fit=crop&w=1170&q=80",
    ),
    ContactItem(
      name: "user9",
      avatarUrl:
          "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000",
    ),
  ];

  int currentIndex = 0;
  final List<String> text = ["All", "Unread", "Favorites", "Groups", "+"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Chat',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              children: List.generate(
                text.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextContainer(
                    text: text[index],
                    isSelected: currentIndex == index,
                    onTap: () => setState(() => currentIndex = index),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: ContactTile(contact: contacts[index]),
                );
              },
            ),
          ),

          
        ],
      ),
      bottomNavigationBar: CustomTabBar(),
    );
  }
}

class ContactItem {
  final String name;
  final String avatarUrl;

  ContactItem({required this.name, required this.avatarUrl});
}

class ContactTile extends StatelessWidget {
  final ContactItem contact;

  const ContactTile({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(contact.avatarUrl),
        radius: 30,
      ),
      title: Text(
        contact.name,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: () {},
    );
  }
}
