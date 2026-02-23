import 'package:flutter/material.dart';

class ListViewGridView extends StatelessWidget {
  const ListViewGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView and GridView")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ListView Section
            const Text(
              'ListView - Vertical Scrollable List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'ListView displays scrollable items in a linear arrangement. '
              'Use ListView.builder for efficient rendering of large lists.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Item ${index + 1}'),
                    subtitle: const Text('Subtitle'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // ListView.separated
            const Text(
              'ListView.separated - With Dividers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'ListView.separated adds separators between items automatically.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.star, color: Colors.amber),
                    title: Text('Feature ${index + 1}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Horizontal ListView
            const Text(
              'ListView - Horizontal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Set scrollDirection: Axis.horizontal for horizontal scrolling.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.blue.shade100,
                    child: Center(
                      child: Text(
                        'Card ${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            // GridView Section
            const Text(
              'GridView - 2D Scrollable Grid',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'GridView displays items in a 2-dimensional grid layout.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.purple.shade200,
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // GridView.count
            const Text(
              'GridView.count - Fixed Columns',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'GridView.count creates a grid with a fixed number of columns.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(6, (index) {
                  return Container(
                    color: Colors.teal.shade300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 32,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Image ${index + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // GridView.extent
            const Text(
              'GridView.extent - Max Tile Width',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'GridView.extent sets the maximum pixel width for each tile.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: GridView.extent(
                maxCrossAxisExtent: 100,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(8, (index) {
                  return Container(
                    color: Colors.orange.shade300,
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // Key Differences
            const Text(
              'Key Differences',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• ListView: Single column, vertical by default\n'
              '• GridView: Multiple columns, 2D grid layout\n'
              '• Use ListView for lists of similar items\n'
              '• Use GridView for galleries, image grids, etc.\n'
              '• Both support lazy loading with builder constructors',
              style: TextStyle(color: Colors.grey, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
