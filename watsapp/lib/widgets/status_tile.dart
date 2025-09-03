import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isMine;

  const StatusTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isMine = false,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: isMine ? primary.withOpacity(0.15) : Colors.grey.withOpacity(0.2),
            child: Text(title[0]),
          ),
          if (isMine)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
                child: const Icon(Icons.add, size: 16, color: Colors.white),
              ),
            ),
        ],
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
