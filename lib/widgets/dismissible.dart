import 'package:flutter/material.dart';

/// Dismissible Demo Widget
///
/// Dismissible is a widget that can be dismissed by dragging in the
/// specified direction. It's commonly used for swipe-to-delete
/// functionality in list items.
class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({super.key});

  @override
  State<DismissibleDemo> createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  // Sample list of items
  final List<String> _items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Basic Dismissible
            _buildSectionTitle('1. Swipe to Delete (Horizontal)'),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Dismissible(
                    key: Key(item),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      setState(() {
                        _items.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$item deleted'),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              setState(() {
                                _items.insert(index, item);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        title: Text(item),
                        leading: const CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: Icon(Icons.drag_handle, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Vertical Dismiss
            _buildSectionTitle('2. Vertical Dismiss (Swipe Up/Down)'),
            const SizedBox(height: 8),
            _buildVerticalDismissibleExample(),

            const SizedBox(height: 16),

            // Dismissible with confirm
            _buildSectionTitle('3. Confirm Before Dismiss'),
            const SizedBox(height: 8),
            _buildConfirmDismissExample(),

            const SizedBox(height: 16),

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
                      '• Use Dismissible widget wrapping the dismissible content',
                    ),
                    _buildKeyPoint(
                      '• direction: controls which directions allow dismissal',
                    ),
                    _buildKeyPoint(
                      '• background: widget shown behind the dismissed item',
                    ),
                    _buildKeyPoint(
                      '• onDismissed: callback when item is dismissed',
                    ),
                    _buildKeyPoint(
                      '• confirmDismiss: callback to confirm before dismiss',
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

  Widget _buildVerticalDismissibleExample() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildVerticalDismissibleItem('A', Colors.red, 'Swipe Up'),
          _buildVerticalDismissibleItem('B', Colors.blue, 'Swipe Down'),
          _buildVerticalDismissibleItem('C', Colors.green, 'Swipe Up'),
        ],
      ),
    );
  }

  Widget _buildVerticalDismissibleItem(String label, Color color, String text) {
    return Dismissible(
      key: Key(label),
      direction: DismissDirection.vertical,
      background: Container(
        color: Colors.red,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 10),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 10),
        child: const Icon(Icons.archive, color: Colors.white),
      ),
      onDismissed: (direction) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$label dismissed: $direction')));
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        color: color.withOpacity(0.3),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmDismissExample() {
    return ElevatedButton.icon(
      onPressed: () => _showConfirmDialog(),
      icon: const Icon(Icons.delete_forever),
      label: const Text('Show Confirm Dialog Example'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(16),
      ),
    );
  }

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Dismiss'),
        content: const Text(
          'Swipe the card below to dismiss it. A confirmation will appear.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showDismissibleWithConfirm();
            },
            child: const Text('TRY IT'),
          ),
        ],
      ),
    );
  }

  void _showDismissibleWithConfirm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Confirm Dismiss')),
          body: Center(
            child: Dismissible(
              key: const Key('confirm_dismiss'),
              direction: DismissDirection.horizontal,
              confirmDismiss: (direction) async {
                return await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirm'),
                    content: Text('Are you sure you want to delete this item?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('DELETE'),
                      ),
                    ],
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Item deleted!')));
                Navigator.pop(context);
              },
              child: const Card(
                margin: EdgeInsets.all(16),
                child: ListTile(
                  title: Text('Swipe me to delete'),
                  subtitle: Text('You will be asked to confirm'),
                  leading: CircleAvatar(child: Icon(Icons.swipe)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
