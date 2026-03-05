import 'package:flutter/material.dart';

/// Demo widget showcasing Stack and Positioned in Flutter.
///
/// Stack is a widget that positions its children relative to the edges
/// of its box. This is useful for overlaying widgets on top of each other.
/// Positioned is used to position a child of a Stack widget.
class StackPositionedDemo extends StatelessWidget {
  const StackPositionedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & Positioned Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example 1: Basic Stack
            const Text(
              'Example 1: Basic Stack',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Stack widget that overlays children on top of each other:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Container(width: 150, height: 150, color: Colors.red),
                    Container(width: 100, height: 100, color: Colors.green),
                    Container(width: 50, height: 50, color: Colors.blue),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 2: Stack with Positioned
            const Text(
              'Example 2: Stack with Positioned',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Using Positioned to place widgets at specific positions:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Container(width: 200, height: 200, color: Colors.grey[300]),
                    const Positioned(
                      top: 10,
                      left: 10,
                      child: Icon(Icons.star, color: Colors.amber, size: 40),
                    ),
                    const Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(Icons.favorite, color: Colors.red, size: 40),
                    ),
                    const Positioned(
                      bottom: 10,
                      left: 10,
                      child: Icon(Icons.home, color: Colors.blue, size: 40),
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: Icon(
                        Icons.settings,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                    const Positioned(
                      top: 80,
                      left: 70,
                      child: Icon(Icons.person, color: Colors.purple, size: 60),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 3: Stack with images and overlay
            const Text(
              'Example 3: Image with Overlay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Common pattern: Image with text overlay:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 300,
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.landscape,
                          size: 100,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent,
                            ],
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Beautiful Landscape',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 4: Positioned with different alignments
            const Text(
              'Example 4: Positioned with various properties',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Using top, bottom, left, right, width, and height:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 250,
                height: 250,
                child: Stack(
                  children: [
                    Container(width: 250, height: 250, color: Colors.grey[200]),
                    // Positioned from top-left
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'top/left',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                    // Positioned from top-right with width
                    Positioned(
                      top: 20,
                      right: 20,
                      width: 60,
                      child: Container(
                        height: 60,
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'top/right',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                    // Positioned with all sides
                    Positioned(
                      left: 50,
                      right: 50,
                      top: 100,
                      bottom: 100,
                      child: Container(
                        color: Colors.green,
                        child: const Center(
                          child: Text(
                            'center',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // Positioned from bottom-right
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.orange,
                        child: const Center(
                          child: Text(
                            'bottom/right',
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 5: IndexedStack
            const Text(
              'Example 5: IndexedStack',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Shows one child at a time while maintaining state:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const IndexedStackDemo(),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 6: Stack with alignment
            const Text(
              'Example 6: Stack with Alignment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Using alignment property to position children:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.purple[300],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.purple[500],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.purple[700],
                      child: const Center(
                        child: Text(
                          'Center',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

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
                    '💡 Key Points about Stack & Positioned:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text('• Stack overlays children on top of each other'),
                  SizedBox(height: 4),
                  Text('• First child is at the bottom, last child is on top'),
                  SizedBox(height: 4),
                  Text(
                    '• Positioned positions children relative to Stack edges',
                  ),
                  SizedBox(height: 4),
                  Text('• Use top, bottom, left, right for positioning'),
                  SizedBox(height: 4),
                  Text('• IndexedStack shows one child at a time'),
                  SizedBox(height: 4),
                  Text(
                    '• Stack with alignment positions non-positioned children',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Demo for IndexedStack - shows one child at a time
class IndexedStackDemo extends StatefulWidget {
  const IndexedStackDemo({super.key});

  @override
  State<IndexedStackDemo> createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  int _currentIndex = 0;

  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];

  final List<String> _labels = ['Page 1', 'Page 2', 'Page 3', 'Page 4'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: IndexedStack(
            index: _currentIndex,
            children: List.generate(4, (index) {
              return Container(
                color: _colors[index],
                child: Center(
                  child: Text(
                    _labels[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? _colors[index] : Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tap dots to switch (state is preserved)',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
