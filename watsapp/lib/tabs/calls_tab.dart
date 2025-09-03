import 'package:flutter/material.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (_, __) => const Divider(height: 0),
      itemBuilder: (context, i) {
        final incoming = i % 2 == 0;
        final missed = i % 3 == 0;
        return ListTile(
          leading: CircleAvatar(child: Text("C${i + 1}")),
          title: Text("Caller ${i + 1}"),
          subtitle: Row(
            children: [
              Icon(
                incoming ? Icons.call_received : Icons.call_made,
                size: 16,
                color: missed ? Colors.red : Colors.green,
              ),
              const SizedBox(width: 6),
              Text(missed ? "Missed • Yesterday" : "Today, 3:${i} PM"),
            ],
          ),
          trailing: Icon(i % 2 == 0 ? Icons.call : Icons.videocam),
        );
      },
    );
  }
}
