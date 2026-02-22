# Learn Concepts in Flutter in 30 Days

This repository contains examples and explanations for fundamental concepts in Flutter.

## Container and SizedBox - Video #1

This is the **first video** from the Flutter tutorial series based on the playlist: [Flutter Tutorial for Beginners](https://www.youtube.com/watch?v=GDAzKTnav9E&list=PL9n0l8rSshSmNoWh4KQ28nJn8npfMtzcs&index=30)

### What you'll learn:

#### Container
`Container` is one of the most used widgets in Flutter. It's extremely flexible and combines multiple functionalities:

- **Dimensions (width, height)** - Sets width and height
- **Margin** - External space around the widget
- **Padding** - Internal space (between content and edges)
- **Decoration** - Colored background, gradients, images, borders, shadows
- **Alignment** - Content alignment inside

```dart
Container(
  width: 200,
  height: 200,
  margin: const EdgeInsets.all(20),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.red, width: 3),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 10,
        offset: const Offset(5, 5),
      ),
    ],
  ),
  child: const Text('Container'),
)
```

#### SizedBox
`SizedBox` is a simpler and more performant widget, used strictly for:

- **Fixed dimensions** - exact width and height
- **Spacing** - creating vertical or horizontal space between widgets
- **Expand** - filling all available space

```dart
// Fixed dimensions
SizedBox(
  width: 150,
  height: 150,
  child: Text('SizedBox'),
)

// Vertical spacing
const SizedBox(height: 20)

// Fill all available space
const SizedBox.expand(child: Text('Full'))
```

### Key difference:

| Feature | Container | SizedBox |
|---------|-----------|----------|
| Performance | Slower | Faster |
| Styling | Complete | Dimensions only |
| Easy to use | Yes | Yes |
| Best practice | When you need styling | Just for dimensions/spacing |

### Project structure:

```
lib/
├── main.dart                 # Main app
└── widgets/
    └── container_sized.dart  # Container & SizedBox examples
```

### Example files - Fundamental: Container & SizedBox

| Day | File | Description | Link |
|------|------|-------------|------|
| 1 | container_sized.dart | Container and SizedBox examples | [`lib/widgets/container_sized.dart`](lib/widgets/container_sized.dart) |
| 2 | rowscols.dart | Rows and Columns examples | [`lib/widgets/rowscols.dart`](lib/widgets/rowscols.dart) |
| 3 | button.dart | Button examples (TextButton, ElevatedButton) | [`lib/widgets/button.dart`](lib/widgets/button.dart) |

---

## Day 1: Container and SizedBox

Full code for [`lib/widgets/container_sized.dart`](lib/widgets/container_sized.dart):

```dart
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
```

---

## Day 2: Rows and Columns

Full code for [`lib/widgets/rowscols.dart`](lib/widgets/rowscols.dart):

```dart
import 'package:flutter/material.dart';

class Rowscols extends StatelessWidget {
  const Rowscols({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rows and Columns")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row example with mainAxisAlignment
            const Text(
              'Row - mainAxisAlignment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height: 60, width: 60, color: Colors.red),
                const SizedBox(width: 8),
                Container(height: 60, width: 60, color: Colors.blue),
                const SizedBox(width: 8),
                Container(height: 60, width: 60, color: Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            // Row example with spaceEvenly
            const Text(
              'Row - spaceEvenly',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 60, width: 60, color: Colors.orange),
                Container(height: 60, width: 60, color: Colors.purple),
                Container(height: 60, width: 60, color: Colors.teal),
              ],
            ),
            const SizedBox(height: 20),
            // Column example
            const Text(
              'Column',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 40, width: 80, color: Colors.red),
                  const SizedBox(height: 8),
                  Container(height: 40, width: 80, color: Colors.blue),
                  const SizedBox(height: 8),
                  Container(height: 40, width: 80, color: Colors.green),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Wrap example for overflow handling
            const Text(
              'Wrap - handles overflow',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Container(height: 60, width: 60, color: Colors.red),
                Container(height: 60, width: 60, color: Colors.blue),
                Container(height: 60, width: 60, color: Colors.green),
                Container(height: 60, width: 60, color: Colors.orange),
                Container(height: 60, width: 60, color: Colors.purple),
                Container(height: 60, width: 60, color: Colors.teal),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Day 3: Buttons

Full code for [`lib/widgets/button.dart`](lib/widgets/button.dart):

```dart
import 'package:flutter/material.dart';

/// This file demonstrates the use of Text Button and Elevated Button in Flutter.
///
/// Buttons are essential widgets in any Flutter application for user interaction.
/// Flutter offers several types of buttons, the most common being TextButton and ElevatedButton.

// ============================================================================
// TEXT BUTTON
// ============================================================================

/// TextButton is a button that displays text without a visible background or border in its default state.
/// It is typically used for secondary actions or in contexts where the primary action should stand out.
class TextButtonExample extends StatelessWidget {
  const TextButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Text Button Examples',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Example 1: Simple TextButton with onPressed
        TextButton(
          onPressed: () {
            print('TextButton pressed!');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You pressed TextButton!'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: const Text('Simple Text Button'),
        ),

        const SizedBox(height: 12),

        // Example 2: TextButton with custom style
        TextButton(
          onPressed: () => print('Custom styled TextButton'),
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
          child: const Text('Styled Text Button'),
        ),

        const SizedBox(height: 12),

        // Example 3: TextButton with icon
        TextButton.icon(
          onPressed: () => print('TextButton with icon'),
          icon: const Icon(Icons.add, size: 20),
          label: const Text('Add'),
        ),

        const SizedBox(height: 12),

        // Example 4: Disabled TextButton
        TextButton(
          onPressed: null,
          child: const Text('Disabled Text Button'),
        ),
      ],
    );
  }
}

// ============================================================================
// ELEVATED BUTTON
// ============================================================================

/// ElevatedButton (formerly RaisedButton) is a button that has an elevated (raised)
/// background with a shadow that suggests three-dimensionality.
class ElevatedButtonExample extends StatelessWidget {
  const ElevatedButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Elevated Button Examples',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Example 1: Simple ElevatedButton
        ElevatedButton(
          onPressed: () {
            print('ElevatedButton pressed!');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You pressed ElevatedButton!'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: const Text('Elevated Button'),
        ),

        const SizedBox(height: 12),

        // Example 2: ElevatedButton with custom style
        ElevatedButton(
          onPressed: () => print('Styled ElevatedButton'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('Custom Style'),
        ),

        const SizedBox(height: 12),

        // Example 3: ElevatedButton with icon
        ElevatedButton.icon(
          onPressed: () => print('ElevatedButton with icon'),
          icon: const Icon(Icons.save),
          label: const Text('Save'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),

        const SizedBox(height: 12),

        // Example 4: ElevatedButton with oval shape
        ElevatedButton(
          onPressed: () => print('Oval ElevatedButton'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text('Oval Shape'),
        ),

        const SizedBox(height: 12),

        // Example 5: Disabled ElevatedButton
        ElevatedButton(
          onPressed: null,
          child: const Text('Disabled Button'),
        ),
      ],
    );
  }
}

// ============================================================================
// MAIN WIDGET
// ============================================================================

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Button & Elevated Button'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Buttons are fundamental elements in Flutter UI.\n'
                  '• TextButton - for secondary actions (discreet)\n'
                  '• ElevatedButton - for primary actions (prominent)',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const TextButtonExample(),
            const Divider(height: 48),
            const ElevatedButtonExample(),
            const SizedBox(height: 24),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comparison: TextButton vs ElevatedButton',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'TextButton:\n'
                      '• Transparent background\n'
                      '• Ideal for secondary actions\n'
                      '• Less prominent\n'
                      '• Used in toolbars, dialogs',
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ElevatedButton:\n'
                      '• Colored background with shadow\n'
                      '• Ideal for primary actions\n'
                      '• Attracts attention\n'
                      '• Used for Save, Submit, etc.',
                      style: TextStyle(fontSize: 13),
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
}
```

### Running the project:

```bash
flutter run
```

### Official resources:
- [Container Documentation](https://api.flutter.dev/flutter/widgets/Container-class.html)
- [SizedBox Documentation](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)

---

Follow the [YouTube playlist](https://www.youtube.com/watch?v=GDAzKTnav9E&list=PL9n0l8rSshSmNoWh4KQ28nJn8npfMtzcs&index=30) for more Flutter tutorials!
