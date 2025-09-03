import 'package:flutter/material.dart';

class CommunityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const CommunityTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.groups)),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
