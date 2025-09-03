import 'package:flutter/material.dart';

class ChannelTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const ChannelTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.campaign)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
