import 'package:flutter/material.dart';

/// Image Widget Demo
///
/// Flutter provides several ways to display images including from assets,
/// network, memory, and file system.
class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Widget Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Network Image
            _buildSectionTitle('1. Network Image'),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Image.network(
                        'https://picsum.photos/400/200',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.error,
                              size: 50,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Image.network - loads from URL'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Asset Image
            _buildSectionTitle('2. Asset Image'),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: const Image(
                        image: AssetImage('icons/icon.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Image.asset - loads from assets folder'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Image Fit Modes
            _buildSectionTitle('3. BoxFit Modes'),
            const SizedBox(height: 8),
            _buildFitModeGrid(),

            const SizedBox(height: 16),

            // Image with Border and Border Radius
            _buildSectionTitle('4. Image with Styling'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://picsum.photos/200',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://picsum.photos/200',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Fade In Image
            _buildSectionTitle('5. Fade In Image'),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: FadeInImage.assetNetwork(
                placeholder: 'icons/icon.png',
                image: 'https://picsum.photos/400/200',
                fit: BoxFit.cover,
              ),
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
                    _buildKeyPoint('• Image.network - loads images from URL'),
                    _buildKeyPoint(
                      '• Image.asset - loads images from assets folder',
                    ),
                    _buildKeyPoint(
                      '• Image.file - loads images from file system',
                    ),
                    _buildKeyPoint('• Image.memory - loads images from bytes'),
                    _buildKeyPoint(
                      '• BoxFit controls how image fills its container',
                    ),
                    _buildKeyPoint(
                      '• use loadingBuilder and errorBuilder for better UX',
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

  Widget _buildFitModeGrid() {
    final fitModes = [
      {'name': 'BoxFit.cover', 'mode': BoxFit.cover},
      {'name': 'BoxFit.contain', 'mode': BoxFit.contain},
      {'name': 'BoxFit.fill', 'mode': BoxFit.fill},
      {'name': 'BoxFit.fitWidth', 'mode': BoxFit.fitWidth},
      {'name': 'BoxFit.fitHeight', 'mode': BoxFit.fitHeight},
      {'name': 'BoxFit.none', 'mode': BoxFit.none},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: fitModes.length,
      itemBuilder: (context, index) {
        final fit = fitModes[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(7),
                  ),
                  child: Image.network(
                    'https://picsum.photos/100',
                    fit: fit['mode'] as BoxFit,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  fit['name'] as String,
                  style: const TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
