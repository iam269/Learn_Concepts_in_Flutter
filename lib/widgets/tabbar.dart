import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('WhatsApp'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: "Chats"),
              Tab(icon: Icon(Icons.chat_bubble), text: "Status"),
              Tab(icon: Icon(Icons.camera), text: "Camera"),
              Tab(icon: Icon(Icons.call), text: "Calls"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Chats')),
            Center(child: Text('Status')),
            Center(child: Text('Calls')),
            Center(child: Text('Camera')),
          ],
        ),
      ),
    );
  }
}
