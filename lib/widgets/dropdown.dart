import 'package:flutter/material.dart';

/// Demo widget showcasing DropDown (DropdownButton) in Flutter.
///
/// DropDown is a material widget that displays a dropdown menu that
/// allows users to select one option from a list of items.
class DropdownDemo extends StatefulWidget {
  const DropdownDemo({super.key});

  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}

class _DropdownDemoState extends State<DropdownDemo> {
  // Example 1: Simple string dropdown
  String? _selectedItem = 'Option 1';
  final List<String> _items = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  // Example 2: Dropdown with objects
  String? _selectedCountry = 'Romania';
  final List<Map<String, String>> _countries = [
    {'code': 'RO', 'name': 'Romania'},
    {'code': 'US', 'name': 'United States'},
    {'code': 'UK', 'name': 'United Kingdom'},
    {'code': 'DE', 'name': 'Germany'},
    {'code': 'FR', 'name': 'France'},
  ];

  // Example 3: Dropdown with icons
  String? _selectedIcon = 'Home';
  final List<_IconItem> _iconItems = [
    _IconItem(name: 'Home', icon: Icons.home),
    _IconItem(name: 'Search', icon: Icons.search),
    _IconItem(name: 'Settings', icon: Icons.settings),
    _IconItem(name: 'Profile', icon: Icons.person),
  ];

  // Example 4: Color dropdown
  String? _selectedColorName = 'Red';
  final List<_ColorItem> _colors = [
    _ColorItem(name: 'Red', color: Colors.red),
    _ColorItem(name: 'Blue', color: Colors.blue),
    _ColorItem(name: 'Green', color: Colors.green),
    _ColorItem(name: 'Yellow', color: Colors.yellow),
    _ColorItem(name: 'Purple', color: Colors.purple),
  ];

  Color? _selectedColorValue = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example 1: Basic DropdownButton
            const Text(
              'Example 1: Basic DropDownButton',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Simple dropdown with string items:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _selectedItem,
                isExpanded: true,
                underline: const SizedBox(),
                hint: const Text('Select an option'),
                items: _items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
            ),
            Text(
              'Selected: $_selectedItem',
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 2: Dropdown with custom items (objects)
            const Text(
              'Example 2: DropDown with Custom Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dropdown using Map objects with code and name:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _selectedCountry,
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down),
                iconEnabledColor: Colors.deepPurple,
                items: _countries.map((Map<String, String> country) {
                  return DropdownMenuItem<String>(
                    value: country['name'],
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 16,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            country['code']!,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(country['name']!),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCountry = newValue;
                  });
                },
              ),
            ),
            Text(
              'Selected Country: $_selectedCountry',
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 3: Dropdown with icons
            const Text(
              'Example 3: DropDown with Icons',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dropdown displaying icons in items:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _selectedIcon,
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down_circle),
                items: _iconItems.map((_IconItem item) {
                  return DropdownMenuItem<String>(
                    value: item.name,
                    child: Row(
                      children: [
                        Icon(item.icon, color: Colors.deepPurple),
                        const SizedBox(width: 12),
                        Text(item.name),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedIcon = newValue;
                  });
                },
              ),
            ),
            Text(
              'Selected: $_selectedIcon',
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 4: Color dropdown with visual preview
            const Text(
              'Example 4: DropDown with Color Preview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dropdown showing color preview in items:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _selectedColorName,
                isExpanded: true,
                underline: const SizedBox(),
                items: _colors.map((_ColorItem colorItem) {
                  return DropdownMenuItem<String>(
                    value: colorItem.name,
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: colorItem.color,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.black26),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(colorItem.name),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedColorName = newValue;
                    // Find the corresponding color value
                    for (var item in _colors) {
                      if (item.name == newValue) {
                        _selectedColorValue = item.color;
                        break;
                      }
                    }
                  });
                },
              ),
            ),
            Row(
              children: [
                const Text('Selected Color: ', style: TextStyle(fontSize: 16)),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _selectedColorValue,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 5: DropdownButtonFormField
            const Text(
              'Example 5: DropdownButtonFormField',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Form field dropdown with validation:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedItem,
              decoration: InputDecoration(
                labelText: 'Select Option',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              items: _items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select an option';
                }
                return null;
              },
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            // Example 6: Custom styled dropdown
            const Text(
              'Example 6: Custom Styled DropDown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dropdown with custom styling:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _selectedItem,
                isExpanded: true,
                underline: const SizedBox(),
                dropdownColor: Colors.deepPurple[50],
                style: const TextStyle(color: Colors.deepPurple, fontSize: 16),
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.deepPurple,
                ),
                items: _items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
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
                    '💡 Key Points about DropDown:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text('• Use DropdownButton widget for dropdown menus'),
                  SizedBox(height: 4),
                  Text('• Value property holds the currently selected item'),
                  SizedBox(height: 4),
                  Text('• OnChanged callback provides selected value'),
                  SizedBox(height: 4),
                  Text('• Items is a list of DropdownMenuItem widgets'),
                  SizedBox(height: 4),
                  Text('• DropdownButtonFormField includes form validation'),
                  SizedBox(height: 4),
                  Text('• Use isExpanded: true to fill parent width'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper classes for typed dropdown items
class _IconItem {
  final String name;
  final IconData icon;

  _IconItem({required this.name, required this.icon});
}

class _ColorItem {
  final String name;
  final Color color;

  _ColorItem({required this.name, required this.color});
}
