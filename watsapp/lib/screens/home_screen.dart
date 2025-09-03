import 'package:flutter/material.dart';
import 'package:flutter_application_2/tabs/chats_tap.dart';
import 'package:flutter_application_2/tabs/updates_tap.dart';
import '../tabs/communities_tab.dart';

import '../tabs/calls_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == "settings") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Open Settings (TODO)")),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "new_group",
                child: Text("New group"),
              ),
              const PopupMenuItem(
                value: "new_broadcast",
                child: Text("New broadcast"),
              ),
              const PopupMenuItem(
                value: "linked_devices",
                child: Text("Linked devices"),
              ),
              const PopupMenuItem(
                value: "starred",
                child: Text("Starred messages"),
              ),
              const PopupMenuItem(
                value: "settings",
                child: Text("Settings"),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.groups)),
            Tab(text: "Chats"),
            Tab(text: "Updates"),
            Tab(text: "Calls"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          CommunitiesTab(),
          ChatsTab(),
          UpdatesTab(),
          CallsTab(),
        ],
      ),
    );
  }
}
