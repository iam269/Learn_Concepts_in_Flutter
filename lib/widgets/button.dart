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
///
/// Main features:
/// - No background by default (transparent)
/// - Text is colored (default with the theme's primary color)
/// - Has hover and press effects (slightly illuminates on press)
/// - Ideal for secondary actions in dialogs, forms, etc.
///
/// Important properties:
/// - onPressed: Callback function called when button is pressed (required or can be null for disabled button)
/// - child: The child widget (usually Text)
/// - style: Customization through ButtonStyle
/// - autofocus: Whether the button automatically receives focus
/// - clipBehavior: Clipping control

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
          // onPressed is a callback function that executes when the user presses the button
          // If onPressed is null, the button will be disabled (will not respond to presses)
          onPressed: () {
            // This function executes when the button is pressed
            // Here we can add any desired logic
            print('TextButton pressed!');

            // Example: show SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You pressed TextButton!'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          // child can be any widget, but usually is Text
          child: const Text('Simple Text Button'),
        ),

        const SizedBox(height: 12),

        // Example 2: TextButton with custom style
        TextButton(
          onPressed: () => print('Custom styled TextButton'),
          // styleBuilder allows customization of the button's appearance
          style: TextButton.styleFrom(
            // foregroundColor sets the color of the text and icon
            foregroundColor: Colors.red,
            // backgroundColor sets the background color (rarely used with TextButton)
            // padding adjusts the internal spacing
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            // textStyle allows customization of the text style
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
          child: const Text('Styled Text Button'),
        ),

        const SizedBox(height: 12),

        // Example 3: TextButton with icon (leading icon)
        TextButton.icon(
          onPressed: () => print('TextButton with icon'),
          // icon: the icon widget that appears before the text
          icon: const Icon(Icons.add, size: 20),
          // label: the child widget (the text)
          label: const Text('Add'),
        ),

        const SizedBox(height: 12),

        // Example 4: Disabled TextButton
        // When onPressed is null, the button is disabled (will not respond to presses)
        TextButton(onPressed: null, child: const Text('Disabled Text Button')),
      ],
    );
  }
}

// ============================================================================
// ELEVATED BUTTON
// ============================================================================

/// ElevatedButton (formerly RaisedButton) is a button that has an elevated (raised)
/// background with a shadow that suggests three-dimensionality.
/// It is the most common type of button for primary actions in applications.
///
/// Main features:
/// - Has colored background with shadow (elevation effect)
/// - Text is contrasting for readability
/// - Visual press effect (becomes "thicker" or illuminates)
/// - Ideal for primary actions: "Save", "Submit", "Login"
///
/// Difference from TextButton:
/// - ElevatedButton attracts more attention (primary actions)
/// - TextButton is more discreet (secondary actions)
///
/// Important properties:
/// - onPressed: Callback called on press
/// - child: Button content (Text, Row with icon and text, etc.)
/// - style: Customization through ButtonStyle
/// - autofocus: Auto focus
/// - clipBehavior: Clipping

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
          // onPressed is required for a functional button
          // If null, the button will be visually disabled
          onPressed: () {
            print('ElevatedButton pressed!');

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You pressed ElevatedButton!'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          // child can be any widget, usually Text
          child: const Text('Elevated Button'),
        ),

        const SizedBox(height: 12),

        // Example 2: ElevatedButton with custom style
        ElevatedButton(
          onPressed: () => print('Styled ElevatedButton'),
          style: ElevatedButton.styleFrom(
            // backgroundColor: the button's background color
            backgroundColor: Colors.green,
            // foregroundColor: the color of text and icons
            foregroundColor: Colors.white,
            // padding: internal spacing
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            // shape: the button shape (RoundedRectangleBorder, StadiumBorder, etc.)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            // elevation: the button's shadow (0 = no shadow)
            elevation: 4,
            // textStyle: the text style
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('Custom Style'),
        ),

        const SizedBox(height: 12),

        // Example 3: ElevatedButton with icon and text (using .icon constructor)
        ElevatedButton.icon(
          onPressed: () => print('ElevatedButton with icon'),
          // icon: the icon that appears before the text
          icon: const Icon(Icons.save),
          // label: the button text
          label: const Text('Save'),
          // We can also add style here
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),

        const SizedBox(height: 12),

        // Example 4: ElevatedButton with oval shape (stadium border)
        ElevatedButton(
          onPressed: () => print('Oval ElevatedButton'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            // StadiumBorder creates an oval shape
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text('Oval Shape'),
        ),

        const SizedBox(height: 12),

        // Example 5: Disabled ElevatedButton
        ElevatedButton(
          onPressed: null, // Disabled button
          // When disabled, colors are automatically faded
          child: const Text('Disabled Button'),
        ),
      ],
    );
  }
}

// ============================================================================
// MAIN WIDGET THAT COMBINES BOTH EXAMPLES
// ============================================================================

/// Main widget that displays all button examples
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
            // Introduction
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

            // TextButton section
            const TextButtonExample(),

            const Divider(height: 48),

            // ElevatedButton section
            const ElevatedButtonExample(),

            const SizedBox(height: 24),

            // Comparison table
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comparison: TextButton vs ElevatedButton',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
