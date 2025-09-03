import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input_bar.dart';

class ChatScreen extends StatefulWidget {
  final String title;
  const ChatScreen({super.key, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [
    {"text": "hi", "isMe": true},
  ];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add({"text": text, "isMe": true});
    });

    // 👇 الرد التلقائي
    if (text.toLowerCase() == "hi") {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _messages.add({"text": "hallo", "isMe": false});
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // الرسائل الجديدة تحت
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[_messages.length - 1 - index];
                return MessageBubble(
                  text: msg["text"],
                  isMe: msg["isMe"],
                );
              },
            ),
          ),
          MessageInputBar(onSend: _sendMessage),
        ],
      ),
    );
  }
}
