import 'package:flutter/material.dart';
import '../widgets/status_tile.dart';
import '../widgets/channel_tile.dart';

class UpdatesTab extends StatelessWidget {
  const UpdatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 6),
          child: Text("STATUS", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ),
        StatusTile(title: "My status", subtitle: "Tap to add status update", isMine: true),
        StatusTile(title: "Mona", subtitle: "10 minutes ago"),
        StatusTile(title: "Ahmed", subtitle: "Today, 8:30 AM"),
        Divider(height: 24),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 6),
          child: Text("CHANNELS", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ),
        ChannelTile(title: "Flutter News", subtitle: "New post • 2h"),
        ChannelTile(title: "Tech Deals", subtitle: "Flash sale"),
      ],
    );
  }
}
