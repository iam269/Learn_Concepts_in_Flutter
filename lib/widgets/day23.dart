import 'package:flutter/material.dart';

class FirebaseConnect extends StatelessWidget {
  const FirebaseConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Connection'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Connecting Flutter to Firebase',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Steps to connect:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                '1. Create a project in Firebase Console\n'
                '2. Run: flutterfire configure\n'
                '3. Add google-services.json (Android) or GoogleService-Info.plist (iOS)\n'
                '4. Initialize Firebase in main.dart',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}