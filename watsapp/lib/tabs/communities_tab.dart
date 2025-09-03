import 'package:flutter/material.dart';
import '../widgets/community_tile.dart';

class CommunitiesTab extends StatelessWidget {
  const CommunitiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 6),
          child: Text("YOUR COMMUNITIES", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ),
        CommunityTile(title: "Flutter Devs", subtitle: "New announcement • 2:45 PM"),
        CommunityTile(title: "UX Arabia", subtitle: "Nada: Design handoff"),
        CommunityTile(title: "Tech Jobs MENA", subtitle: "42 new posts"),
        Divider(height: 24),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 6),
          child: Text("DISCOVER", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ),
        CommunityTile(title: "Open Source Builders", subtitle: "Join to see updates"),
      ],
    );
  }
}
