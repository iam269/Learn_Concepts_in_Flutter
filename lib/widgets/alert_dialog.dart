import 'package:flutter/material.dart';

/// AlertDialog Demo Widget
///
/// AlertDialog is a material design dialog that interrupts the user with
/// urgent information, decisions, or actions.
class AlertDialogDemo extends StatelessWidget {
  const AlertDialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Basic AlertDialog
            _buildSectionTitle('1. Basic AlertDialog'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _showBasicDialog(context),
              child: const Text('Show Basic AlertDialog'),
            ),

            const SizedBox(height: 16),

            // AlertDialog with Actions
            _buildSectionTitle('2. AlertDialog with Actions'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _showDialogWithActions(context),
              child: const Text('Show Dialog with Buttons'),
            ),

            const SizedBox(height: 16),

            // Confirmation Dialog
            _buildSectionTitle('3. Confirmation Dialog'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _showConfirmationDialog(context),
              child: const Text('Show Confirmation Dialog'),
            ),

            const SizedBox(height: 16),

            // Custom AlertDialog
            _buildSectionTitle('4. Custom AlertDialog'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _showCustomDialog(context),
              child: const Text('Show Custom Dialog'),
            ),

            const SizedBox(height: 16),

            // Dialog with TextField
            _buildSectionTitle('5. Dialog with TextField'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _showDialogWithTextField(context),
              child: const Text('Show Dialog with Input'),
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
                      '• Use showDialog() with AlertDialog widget',
                    ),
                    _buildKeyPoint('• title: sets the dialog title'),
                    _buildKeyPoint('• content: sets the dialog body content'),
                    _buildKeyPoint(
                      '• actions: list of buttons (TextButton, ElevatedButton)',
                    ),
                    _buildKeyPoint('• Return true/false from Navigator.pop()'),
                    _buildKeyPoint(
                      '• Use barrierDismissible: false to prevent closing',
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

  void _showBasicDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Basic AlertDialog'),
        content: const Text(
          'This is a simple AlertDialog with just a message. '
          'It is used to display important information to the user.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showDialogWithActions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose an Option'),
        content: const Text(
          'What would you like to do? Choose one of the options below.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Option 1 selected')),
              );
            },
            child: const Text('Option 1'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Option 2 selected')),
              );
            },
            child: const Text('Option 2'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Option 3 selected')),
              );
            },
            child: const Text('Option 3'),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Item'),
        content: const Text(
          'Are you sure you want to delete this item? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Cancelled')));
            },
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item deleted!'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('DELETE'),
          ),
        ],
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.check_circle, color: Colors.green),
            ),
            const SizedBox(width: 12),
            const Text('Success!'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.emoji_events, size: 60, color: Colors.amber),
            SizedBox(height: 16),
            Text(
              'Your action has been completed successfully!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(120, 40),
              ),
              child: const Text('GREAT!'),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialogWithTextField(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Your Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Your name',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hello, ${controller.text}!')),
                );
              }
            },
            child: const Text('SUBMIT'),
          ),
        ],
      ),
    );
  }
}
