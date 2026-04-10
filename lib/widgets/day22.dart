import 'package:flutter/material.dart';

class BundleIdExample extends StatelessWidget {
  const BundleIdExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bundle ID'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Renaming App Bundle ID',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'To rename the bundle identifier in Flutter:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                '1. Open pubspec.yaml\n'
                '2. Update the "applicationId" in android/app/build.gradle\n'
                '3. For iOS, update the bundle identifier in ios/Runner.xcodeproj',
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