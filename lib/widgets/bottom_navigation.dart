import 'package:flutter/material.dart';

/// Demo widget showcasing Bottom Navigation in Flutter.
///
/// Bottom Navigation is a material widget that displays a row of small
/// icons and optional text labels, used to switch between 3-5 different
/// views or destinations in an app.
class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({super.key});

  @override
  State<BottomNavigationDemo> createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  // Current selected index for bottom navigation
  int _currentIndex = 0;

  // List of pages to display when bottom navigation item is tapped
  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  // List of navigation items
  final List<BottomNavigationBarItem> _navigationItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      activeIcon: Icon(Icons.search),
      label: 'Search',
      backgroundColor: Colors.orange,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
      backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      activeIcon: Icon(Icons.settings),
      label: 'Settings',
      backgroundColor: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // Example 1: Basic BottomNavigationBar
          const Text(
            'Example 1: Basic BottomNavigationBar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Basic Bottom Navigation with currentIndex and onTap callback
          SizedBox(
            height: 150,
            child: Column(
              children: [
                // Display the current page
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: Text(
                      'Page: ${_pages[_currentIndex].runtimeType.toString()}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                // Basic Bottom Navigation Bar
                BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search_outlined),
                      activeIcon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined),
                      activeIcon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),

          // Example 2: BottomNavigationBar with type specification
          const Text(
            'Example 2: BottomNavigationBar with fixed type',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Fixed type - all items have equal width
          SizedBox(
            height: 120,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue[50],
                    alignment: Alignment.center,
                    child: const Text(
                      'Fixed Type - Equal Width Items',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.deepPurple,
                  unselectedItemColor: Colors.grey,
                  showUnselectedLabels: true,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),

          // Example 3: BottomNavigationBar with shifting type
          const Text(
            'Example 3: BottomNavigationBar with shifting type',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Shifting type - selected item is larger
          SizedBox(
            height: 120,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orange[50],
                    alignment: Alignment.center,
                    child: const Text(
                      'Shifting Type - Selected Item Larger',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                BottomNavigationBar(
                  type: BottomNavigationBarType.shifting,
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey[300],
                  items: _navigationItems,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),

          // Example 4: BottomNavigationBar with custom icons and labels
          const Text(
            'Example 4: Custom Icons and Badge',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: 120,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.green[50],
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Custom Styling',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '3 notifications',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  elevation: 16,
                  selectedFontSize: 14,
                  unselectedFontSize: 12,
                  iconSize: 28,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      activeIcon: Icon(Icons.home, size: 32),
                      label: 'Home',
                      tooltip: 'Go to Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      activeIcon: Icon(Icons.search, size: 32),
                      label: 'Search',
                      tooltip: 'Search content',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_outlined),
                      activeIcon: Icon(Icons.notifications, size: 32),
                      label: 'Notifications',
                      tooltip: 'View notifications',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      activeIcon: Icon(Icons.settings, size: 32),
                      label: 'Settings',
                      tooltip: 'App settings',
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Information section
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '💡 Key Points about Bottom Navigation:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text('• Use BottomNavigationBar widget for bottom navigation'),
                SizedBox(height: 4),
                Text('• CurrentIndex controls which item is selected'),
                SizedBox(height: 4),
                Text('• OnTap callback provides the tapped index'),
                SizedBox(height: 4),
                Text('• Type: fixed (equal width) or shifting (animated)'),
                SizedBox(height: 4),
                Text('• Show 3-5 destinations for optimal UX'),
                SizedBox(height: 4),
                Text('• Always include labels for clarity'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder pages for bottom navigation demonstration
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text('Home Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.orange),
          SizedBox(height: 16),
          Text('Search Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 64, color: Colors.green),
          SizedBox(height: 16),
          Text('Profile Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Colors.purple),
          SizedBox(height: 16),
          Text('Settings Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
