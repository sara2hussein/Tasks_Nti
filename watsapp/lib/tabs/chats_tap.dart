import 'package:flutter/material.dart';
import '../widgets/chat_tile.dart';
import '../screens/chat_screen.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) {
        return ChatTile(
          name: "Contact ${i + 1}",
          message: "Message preview ${i + 1}",
          time: "12:${i + 10}",
          unread: i % 3 == 0 ? 2 : 0,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(title: "Contact ${i + 1}"),
            ),
          ),
        );
      },
    );
  }
}
