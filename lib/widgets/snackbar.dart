import 'package:flutter/material.dart';

/// SnackBar Demo Widget
///
/// SnackBar is a lightweight message widget that displays at the bottom
/// of the screen. It's used to provide feedback after user actions.
class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Basic SnackBar
            _buildSectionTitle('1. Basic SnackBar'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Simple SnackBar - appears at bottom of screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a basic SnackBar!')),
                );
              },
              child: const Text('Show Basic SnackBar'),
            ),

            const SizedBox(height: 24),

            // SnackBar with Duration
            _buildSectionTitle('2. SnackBar with Duration'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('This message stays for 5 seconds!'),
                    duration: const Duration(seconds: 5),
                    backgroundColor: Colors.orange,
                  ),
                );
              },
              child: const Text('Show Long Duration SnackBar'),
            ),

            const SizedBox(height: 24),

            // SnackBar with Action
            _buildSectionTitle('3. SnackBar with Action Button'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Item deleted'),
                    action: SnackBarAction(
                      label: 'UNDO',
                      textColor: Colors.yellow,
                      onPressed: () {
                        // Handle undo action
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Action undoned!')),
                        );
                      },
                    ),
                  ),
                );
              },
              child: const Text('Show SnackBar with Action'),
            ),

            const SizedBox(height: 24),

            // SnackBar with Custom Design
            _buildSectionTitle('4. Custom SnackBar Design'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.white),
                        const SizedBox(width: 8),
                        const Text('Success! Operation completed.'),
                      ],
                    ),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(16),
                  ),
                );
              },
              child: const Text('Show Custom SnackBar'),
            ),

            const SizedBox(height: 24),

            // Multiple SnackBars (Latest one replaces previous)
            _buildSectionTitle('5. Multiple SnackBars'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Show multiple snackbars - only the last one will be visible
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('First message')));
                Future.delayed(const Duration(milliseconds: 500), () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Second message')),
                  );
                });
              },
              child: const Text('Show Multiple SnackBars'),
            ),

            const SizedBox(height: 24),

            // SnackBar Behavior
            _buildSectionTitle('6. SnackBar Behavior'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Floating SnackBar'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: const Text('Floating SnackBar'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fixed SnackBar (default)'),
                    behavior: SnackBarBehavior.fixed,
                  ),
                );
              },
              child: const Text('Fixed SnackBar'),
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
                      '• Use ScaffoldMessenger.of(context).showSnackBar()',
                    ),
                    _buildKeyPoint('• Default duration is 4 seconds'),
                    _buildKeyPoint(
                      '• behavior: SnackBarBehavior.floating for floating style',
                    ),
                    _buildKeyPoint(
                      '• action: SnackBarAction for interactive buttons',
                    ),
                    _buildKeyPoint(
                      '• Use SnackBarController for programmatic control',
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
}
