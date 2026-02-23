import 'package:flutter/material.dart';
import 'widgets/rowscols.dart';
import 'widgets/button.dart';
import 'widgets/container_sized.dart';
import 'widgets/listview_gridview.dart';
import 'widgets/snackbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Widgets")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            title: 'Rows and Columns',
            description: 'Linear layout widgets for arranging children',
            widget: const Rowscols(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Buttons',
            description: 'Various button types in Flutter',
            widget: const ButtonWidget(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Container & SizedBox',
            description: 'Box model widgets for layout control',
            widget: const ContainerSizedDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'ListView and GridView',
            description: 'Scrollable list and grid widgets',
            widget: const ListViewGridView(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'SnackBar',
            description: 'Lightweight message widget for user feedback',
            widget: const SnackBarDemo(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required String description,
    required Widget widget,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(description, style: TextStyle(color: Colors.grey.shade300)),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.arrow_forward, size: 16),
                  SizedBox(width: 4),
                  Text('Tap to view', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
