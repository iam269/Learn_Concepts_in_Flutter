import 'package:flutter/material.dart';
import 'widgets/rowscols.dart';
import 'widgets/button.dart';
import 'widgets/container_sized.dart';
import 'widgets/listview_gridview.dart';
import 'widgets/snackbar.dart';
import 'widgets/dismissible.dart';
import 'widgets/drawer.dart';
import 'widgets/image.dart';
import 'widgets/alert_dialog.dart';
import 'widgets/bottom_sheet.dart';
import 'widgets/animated_text.dart';
import 'widgets/bottom_navigation.dart';
import 'widgets/dropdown.dart';
import 'widgets/forms.dart';
import 'widgets/stack_positioned.dart';
import 'widgets/tabbar.dart';
import 'widgets/imagepicker.dart';
import 'widgets/location.dart';

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
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Dismissible',
            description: 'Widget that can be dismissed by swiping',
            widget: const DismissibleDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Drawer',
            description: 'Navigation drawer widget for side menu',
            widget: const DrawerDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Image',
            description: 'Display images from network, assets, or memory',
            widget: const ImageDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'AlertDialog',
            description: 'Dialog widget for user confirmation',
            widget: const AlertDialogDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Bottom Sheet',
            description: 'Sliding panel that appears from bottom of screen',
            widget: const BottomSheetDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Bottom Navigation',
            description: 'Bottom navigation bar for switching between views',
            widget: const BottomNavigationDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Dropdown',
            description: 'Dropdown button for selecting options from a list',
            widget: const DropdownDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Forms',
            description: 'Form widgets with validation and TextFormField',
            widget: const FormsDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Stack and Positioned',
            description:
                'Stack overlays with Positioned for absolute positioning',
            widget: const StackPositionedDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'TabBar',
            description: 'Tab bar widget for switching between views',
            widget: const Tabbar(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Animated Text',
            description: 'Animated text widgets with various effects',
            widget: const AnimatedTextDemo(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Image Picker',
            description: 'Capture or select images from gallery',
            widget: const ImagePickerWidget(),
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'Location',
            description: 'Display and interact with location data',
            widget: const LocationWidget(),
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
