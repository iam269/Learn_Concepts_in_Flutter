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
