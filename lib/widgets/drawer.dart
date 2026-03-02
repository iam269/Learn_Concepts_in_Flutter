import 'package:flutter/material.dart';

/// Drawer Demo Widget
///
/// Drawer is a material design panel that slides in from the left edge
/// of the screen. It's commonly used for navigation menus.
class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Basic Drawer
            _buildSectionTitle('1. Basic Drawer (Swipe from Left)'),
            const SizedBox(height: 8),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Swipe from the left edge of the screen or tap the menu icon to open the drawer.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Drawer with Header
            _buildSectionTitle('2. Drawer with Header'),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _openDrawerWithHeader(context),
              icon: const Icon(Icons.menu),
              label: const Text('Open Drawer with Header'),
            ),

            const SizedBox(height: 16),

            // End Drawer
            _buildSectionTitle('3. End Drawer (Right Side)'),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _openEndDrawer(context),
              icon: const Icon(Icons.menu_open),
              label: const Text('Open End Drawer (Right)'),
            ),

            const SizedBox(height: 16),

            // Custom Drawer
            _buildSectionTitle('4. Custom Drawer with Sections'),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _openCustomDrawer(context),
              icon: const Icon(Icons.view_list),
              label: const Text('Open Custom Drawer'),
            ),

            const SizedBox(height: 24),

            // Info Card
            Card(
              color: Colors.deepPurple.shade900,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.info, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Key Points:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildKeyPoint(
                      '• Use Drawer widget as drawer property of Scaffold',
                    ),
                    _buildKeyPoint(
                      '• Use DrawerHeader for branded header section',
                    ),
                    _buildKeyPoint(
                      '• Use UserAccountsDrawerHeader for user info',
                    ),
                    _buildKeyPoint(
                      '• endDrawer property for right-side drawer',
                    ),
                    _buildKeyPoint(
                      '• Use ListTile for menu items with onTap callback',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    );
  }

  Widget _buildKeyPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.deepPurple),
                ),
                SizedBox(height: 12),
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Home tapped')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Settings tapped')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Help tapped')));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Logout tapped')));
            },
          ),
        ],
      ),
    );
  }

  void _openDrawerWithHeader(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void _openEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void _openCustomDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildCustomDrawerContent(),
    );
  }

  Widget _buildCustomDrawerContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Navigation',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildSectionTile(Icons.dashboard, 'Dashboard', () {}),
          _buildSectionTile(Icons.analytics, 'Analytics', () {}),
          _buildSectionTile(Icons.people, 'Customers', () {}),
          _buildSectionTile(Icons.inventory, 'Products', () {}),
          const Divider(),
          _buildSectionTile(Icons.settings, 'Settings', () {}),
          _buildSectionTile(Icons.help, 'Help & Support', () {}),
        ],
      ),
    );
  }

  Widget _buildSectionTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      onTap: onTap,
    );
  }
}

/// EndDrawer Demo Widget (Right Side Drawer)
class EndDrawerDemo extends StatelessWidget {
  const EndDrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('End Drawer Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Left Drawer', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                'Right Drawer',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Link'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Swipe from right edge to open end drawer'),
      ),
    );
  }
}
