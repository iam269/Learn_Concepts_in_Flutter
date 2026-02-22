import 'package:flutter/material.dart';

// =============================================================================
// CONTAINER vs SIZEDBOX - Explanation in Flutter
// =============================================================================

// Container - Is a very flexible widget that combines painting, positioning,
// and sizing. It can have decoration, margin, padding, etc.

// SizedBox - Is a simple widget that sets exact dimensions (width/height)
// for its child. It is more performant than Container when you only need dimensions.

// ============================================================================
// EXAMPLE 1: Container with dimensions and styling
// ============================================================================
class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Width
      height: 200, // Height
      margin: const EdgeInsets.all(20), // External margin
      padding: const EdgeInsets.all(16), // Internal padding
      decoration: BoxDecoration(
        color: Colors.blue, // Background color
        borderRadius: BorderRadius.circular(16), // Rounded corners
        border: Border.all(color: Colors.red, width: 3), // Border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      alignment: Alignment.center, // Content alignment
      transform: Matrix4.rotationZ(0.1), // Rotation
      child: const Text(
        'Container',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 2: SizedBox - only for dimensions (more performant)
// ============================================================================
class SizedBoxExample extends StatelessWidget {
  const SizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, // Fixed width
      height: 150, // Fixed height
      child: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text('SizedBox', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 3: SizedBox for spacing (instead of empty Container)
// ============================================================================
class SizedBoxSpacingExample extends StatelessWidget {
  const SizedBoxSpacingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 100, height: 50, color: Colors.red),
        // SizedBox for vertical spacing - more performant than empty Container
        const SizedBox(height: 20),
        Container(width: 100, height: 50, color: Colors.blue),
        const SizedBox(height: 20),
        Container(width: 100, height: 50, color: Colors.green),
      ],
    );
  }
}

// ============================================================================
// EXAMPLE 4: SizedBox.expand() - fills all available space
// ============================================================================
class SizedBoxExpandExample extends StatelessWidget {
  const SizedBoxExpandExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: const SizedBox.expand(child: Text('Fill all available space')),
    );
  }
}

// ============================================================================
// EXAMPLE 5: Container with gradient
// ============================================================================
class ContainerGradientExample extends StatelessWidget {
  const ContainerGradientExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Text(
          'Gradient',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 6: Container with background image
// ============================================================================
class ContainerImageExample extends StatelessWidget {
  const ContainerImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://picsum.photos/200'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ============================================================================
// Main widget to test all examples
// ============================================================================
class ContainerSizedDemo extends StatelessWidget {
  const ContainerSizedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container vs SizedBox')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Container Example',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ContainerExample(),
            SizedBox(height: 30),
            Text(
              'SizedBox Example',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBoxExample(),
            SizedBox(height: 30),
            Text(
              'Spacing with SizedBox',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBoxSpacingExample(),
            SizedBox(height: 30),
            Text(
              'Gradient Container',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ContainerGradientExample(),
          ],
        ),
      ),
    );
  }
}
