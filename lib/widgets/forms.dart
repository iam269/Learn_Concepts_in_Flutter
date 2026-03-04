import 'package:flutter/material.dart';

/// Demo widget showcasing Forms in Flutter.
///
/// Forms are used to collect user input with validation support.
/// Flutter provides TextFormField and Form widgets for building forms.
class FormsDemo extends StatefulWidget {
  const FormsDemo({super.key});

  @override
  State<FormsDemo> createState() => _FormsDemoState();
}

class _FormsDemoState extends State<FormsDemo> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Text controllers for form fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _bioController = TextEditingController();

  // Form field values
  String _gender = 'Male';
  bool _acceptTerms = false;
  String _country = 'Romania';
  double _sliderValue = 50;

  final List<String> _countries = [
    'Romania',
    'United States',
    'United Kingdom',
    'Germany',
    'France',
    'Spain',
    'Italy',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Print form values
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Phone: ${_phoneController.text}');
      print('Age: ${_ageController.text}');
      print('Gender: $_gender');
      print('Country: $_country');
      print('Bio: ${_bioController.text}');
      print('Accept Terms: $_acceptTerms');
      print('Slider Value: $_sliderValue');
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _phoneController.clear();
    _ageController.clear();
    _bioController.clear();
    setState(() {
      _gender = 'Male';
      _acceptTerms = false;
      _country = 'Romania';
      _sliderValue = 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms Demo'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetForm,
            tooltip: 'Reset Form',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Example 1: Basic TextFormField
              const Text(
                'Example 1: TextFormField with Validation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Text fields with different validation rules:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),

              // Name field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (value.length < 3) {
                    return 'Name must be at least 3 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Simple email validation
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password field
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Phone field
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length < 10) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Age field
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  hintText: 'Enter your age',
                  prefixIcon: Icon(Icons.cake),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  final age = int.tryParse(value);
                  if (age == null) {
                    return 'Please enter a valid number';
                  }
                  if (age < 1 || age > 150) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // Example 2: Dropdown in Form
              const Text(
                'Example 2: DropdownButtonFormField',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Dropdown selection within a form:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                value: _country,
                decoration: const InputDecoration(
                  labelText: 'Country',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                items: _countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _country = newValue!;
                  });
                },
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // Example 3: Radio Buttons in Form
              const Text(
                'Example 3: Radio Buttons',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Gender selection using radio buttons:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),

              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Male'),
                            value: 'Male',
                            groupValue: _gender,
                            onChanged: (String? value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Female'),
                            value: 'Female',
                            groupValue: _gender,
                            onChanged: (String? value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // Example 4: Slider in Form
              const Text(
                'Example 4: Slider',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Slider for selecting a range:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),

              InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Satisfaction Level',
                  border: OutlineInputBorder(),
                ),
                child: Column(
                  children: [
                    Text(
                      'Value: ${_sliderValue.toInt()}%',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: '${_sliderValue.toInt()}%',
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('0%', style: TextStyle(color: Colors.grey)),
                        Text('100%', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // Example 5: Checkbox in Form
              const Text(
                'Example 5: Checkbox',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Terms and conditions checkbox:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),

              CheckboxListTile(
                value: _acceptTerms,
                onChanged: (bool? value) {
                  setState(() {
                    _acceptTerms = value!;
                  });
                },
                title: const Text('I accept the terms and conditions'),
                subtitle: const Text('Please read our Terms of Service'),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // Example 6: Multiline TextField
              const Text(
                'Example 6: Multiline TextFormField',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bio field with multiple lines:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  hintText: 'Tell us about yourself',
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value != null && value.length > 500) {
                    return 'Bio must be less than 500 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // Example 7: Switch in Form
              const Text(
                'Example 7: Switch',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Toggle switch for notifications:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),

              SwitchListTile(
                title: const Text('Enable Notifications'),
                subtitle: const Text('Receive push notifications'),
                value: true,
                onChanged: (bool value) {
                  // Handle switch change
                },
                secondary: const Icon(Icons.notifications),
              ),

              const SizedBox(height: 30),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Submit Form',
                    style: TextStyle(fontSize: 18),
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
                      '💡 Key Points about Forms:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text('• Use Form widget to group multiple form fields'),
                    SizedBox(height: 4),
                    Text('• GlobalKey<FormState> for form validation'),
                    SizedBox(height: 4),
                    Text('• TextFormField for text input with validation'),
                    SizedBox(height: 4),
                    Text('• validator property defines validation logic'),
                    SizedBox(height: 4),
                    Text('• DropdownButtonFormField for dropdown in forms'),
                    SizedBox(height: 4),
                    Text('• Use formKey.currentState.validate() to validate'),
                    SizedBox(height: 4),
                    Text('• formKey.currentState.reset() clears the form'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
