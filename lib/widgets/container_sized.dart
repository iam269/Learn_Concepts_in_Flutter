import 'package:flutter/material.dart';

// =============================================================================
// CONTAINER vs SIZEDBOX - Explicație în Flutter
// =============================================================================

// Container - Este un widget foarte flexibil care combină painting, positioning,
// și sizing (dimensiuni). Poate avea decoration, margin, padding, etc.

// SizedBox - Este un widget simplu care stabilește exact dimensiunile (width/height)
// pentru copilul său. Este mai performant decât Container când ai nevoie doar de dimensiuni.

// ============================================================================
// EXEMPLUL 1: Container cu dimensiuni și styling
// ============================================================================
class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Lățimea
      height: 200, // Înălțimea
      margin: const EdgeInsets.all(20), // Margine exterioară
      padding: const EdgeInsets.all(16), // Spațiu interior
      decoration: BoxDecoration(
        color: Colors.blue, // Culoarea de fundal
        borderRadius: BorderRadius.circular(16), // Colțuri rotunjite
        border: Border.all(color: Colors.red, width: 3), // Bordură
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      alignment: Alignment.center, // Aliniere conținut
      transform: Matrix4.rotationZ(0.1), // Rotire
      child: const Text(
        'Container',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

// ============================================================================
// EXEMPLUL 2: SizedBox - doar pentru dimensiuni (mai performant)
// ============================================================================
class SizedBoxExample extends StatelessWidget {
  const SizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, // Lățime fixă
      height: 150, // Înălțime fixă
      child: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text('SizedBox', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ============================================================================
// EXEMPLUL 3: SizedBox pentru spațiere (în loc de Container gol)
// ============================================================================
class SizedBoxSpacingExample extends StatelessWidget {
  const SizedBoxSpacingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 100, height: 50, color: Colors.red),
        // SizedBox pentru spațiu vertical - mai performant decât Container gol
        const SizedBox(height: 20),
        Container(width: 100, height: 50, color: Colors.blue),
        const SizedBox(height: 20),
        Container(width: 100, height: 50, color: Colors.green),
      ],
    );
  }
}

// ============================================================================
// EXEMPLUL 4: SizedBox.expand() - umple tot spațiul disponibil
// ============================================================================
class SizedBoxExpandExample extends StatelessWidget {
  const SizedBoxExpandExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: const SizedBox.expand(child: Text('Ocupa tot spațiul disponibil')),
    );
  }
}

// ============================================================================
// EXEMPLUL 5: Container cu gradient
// ============================================================================
class ContainerGradientExample extends StatelessWidget {
  const ContainerGradientExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Text(
          'Gradient',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

// ============================================================================
// EXEMPLUL 6: Container cu imagine de fundal
// ============================================================================
class ContainerImageExample extends StatelessWidget {
  const ContainerImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://picsum.photos/200'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ============================================================================
// Widget principal pentru a testa toate exemplele
// ============================================================================
class ContainerSizedDemo extends StatelessWidget {
  const ContainerSizedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container vs SizedBox')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Container Example',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ContainerExample(),
            SizedBox(height: 30),
            Text(
              'SizedBox Example',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBoxExample(),
            SizedBox(height: 30),
            Text(
              'Spacing with SizedBox',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBoxSpacingExample(),
            SizedBox(height: 30),
            Text(
              'Gradient Container',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ContainerGradientExample(),
          ],
        ),
      ),
    );
  }
}
