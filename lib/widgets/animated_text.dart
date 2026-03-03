import 'package:flutter/material.dart';

/// Animated Text Widget Demo
///
/// Animated text widgets provide various effects for displaying text with animations.
/// Flutter provides several animated text options through the animations package:
/// - AnimatedTextKit (rotating, fading, scaling, typewriter effects)
/// - DefaultTextStyleTransition
/// - AnimatedSwitcher with text
class AnimatedTextDemo extends StatefulWidget {
  const AnimatedTextDemo({super.key});

  @override
  State<AnimatedTextDemo> createState() => _AnimatedTextDemoState();
}

class _AnimatedTextDemoState extends State<AnimatedTextDemo> {
  // For Typewriter Effect
  final List<String> _typewriterWords = [
    'Welcome to Flutter!',
    'Learn Animated Text',
    'Create Amazing UIs',
    'With Flutter Animations',
  ];
  int _typewriterIndex = 0;

  // For Fade Animation
  final List<String> _fadeWords = ['Hello', 'Flutter', 'Developer', 'World!'];
  int _fadeIndex = 0;

  // For Scale Animation
  final List<String> _scaleWords = ['One', 'Two', 'Three', 'Four'];
  int _scaleIndex = 0;

  // For Rotation Animation
  final List<String> _rotationWords = ['Rotate', 'Spin', 'Turn', 'Twist'];
  int _rotationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Text Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Example 1: Typewriter Effect (built-in)
            _buildSection(
              title: 'Typewriter Effect',
              description:
                  'Text appears character by character like a typewriter',
              child: _buildTypewriterExample(),
            ),
            const SizedBox(height: 32),

            // Example 2: Fade Animation
            _buildSection(
              title: 'Fade Animation',
              description: 'Text fades in and out between words',
              child: _buildFadeExample(),
            ),
            const SizedBox(height: 32),

            // Example 3: Scale Animation
            _buildSection(
              title: 'Scale Animation',
              description: 'Text scales up and down between words',
              child: _buildScaleExample(),
            ),
            const SizedBox(height: 32),

            // Example 4: Rotation Animation
            _buildSection(
              title: 'Rotation Animation',
              description: 'Text rotates in 3D space between words',
              child: _buildRotationExample(),
            ),
            const SizedBox(height: 32),

            // Example 5: Custom Animated DefaultTextStyle
            _buildSection(
              title: 'Custom Text Style Animation',
              description:
                  'Animate text style changes with DefaultTextStyleTransition',
              child: _buildCustomStyleExample(),
            ),
            const SizedBox(height: 32),

            // Example 6: Animated Switcher
            _buildSection(
              title: 'Animated Switcher',
              description: 'Use AnimatedSwitcher for smooth text transitions',
              child: _buildAnimatedSwitcherExample(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.deepPurple.shade200),
          ),
          child: Center(child: child),
        ),
      ],
    );
  }

  // Example 1: Typewriter Effect using Timer
  Widget _buildTypewriterExample() {
    return _TypewriterWidget(
      words: _typewriterWords,
      onComplete: () {
        setState(() {
          _typewriterIndex = (_typewriterIndex + 1) % _typewriterWords.length;
        });
      },
    );
  }

  // Example 2: Fade Animation
  Widget _buildFadeExample() {
    return _FadeTextWidget(
      words: _fadeWords,
      onComplete: () {
        setState(() {
          _fadeIndex = (_fadeIndex + 1) % _fadeWords.length;
        });
      },
    );
  }

  // Example 3: Scale Animation
  Widget _buildScaleExample() {
    return _ScaleTextWidget(
      words: _scaleWords,
      onComplete: () {
        setState(() {
          _scaleIndex = (_scaleIndex + 1) % _scaleWords.length;
        });
      },
    );
  }

  // Example 4: Rotation Animation
  Widget _buildRotationExample() {
    return _RotationTextWidget(
      words: _rotationWords,
      onComplete: () {
        setState(() {
          _rotationIndex = (_rotationIndex + 1) % _rotationWords.length;
        });
      },
    );
  }

  // Example 5: Custom Text Style Animation
  Widget _buildCustomStyleExample() {
    return _CustomStyleWidget();
  }

  // Example 6: Animated Switcher
  Widget _buildAnimatedSwitcherExample() {
    return _AnimatedSwitcherWidget();
  }
}

// Custom Typewriter Widget
class _TypewriterWidget extends StatefulWidget {
  final List<String> words;
  final VoidCallback onComplete;

  const _TypewriterWidget({required this.words, required this.onComplete});

  @override
  State<_TypewriterWidget> createState() => _TypewriterWidgetState();
}

class _TypewriterWidgetState extends State<_TypewriterWidget> {
  String _displayedText = '';
  int _charIndex = 0;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) return;

      setState(() {
        if (!_isDeleting) {
          _displayedText = widget.words[_charIndex].substring(
            0,
            _displayedText.length + 1,
          );
          if (_displayedText.length == widget.words[_charIndex].length) {
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                setState(() => _isDeleting = true);
                _startTyping();
              }
            });
            return;
          }
        } else {
          _displayedText = _displayedText.substring(
            0,
            _displayedText.length - 1,
          );
          if (_displayedText.isEmpty) {
            _isDeleting = false;
            _charIndex = (_charIndex + 1) % widget.words.length;
            widget.onComplete();
          }
        }
      });
      _startTyping();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'monospace',
      ),
    );
  }
}

// Custom Fade Text Widget
class _FadeTextWidget extends StatefulWidget {
  final List<String> words;
  final VoidCallback onComplete;

  const _FadeTextWidget({required this.words, required this.onComplete});

  @override
  State<_FadeTextWidget> createState() => _FadeTextWidgetState();
}

class _FadeTextWidgetState extends State<_FadeTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            _currentIndex = (_currentIndex + 1) % widget.words.length;
            widget.onComplete();
            _controller.reset();
            _controller.forward();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Text(
        widget.words[_currentIndex],
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Custom Scale Text Widget
class _ScaleTextWidget extends StatefulWidget {
  final List<String> words;
  final VoidCallback onComplete;

  const _ScaleTextWidget({required this.words, required this.onComplete});

  @override
  State<_ScaleTextWidget> createState() => _ScaleTextWidgetState();
}

class _ScaleTextWidgetState extends State<_ScaleTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            _currentIndex = (_currentIndex + 1) % widget.words.length;
            widget.onComplete();
            _controller.reset();
            _controller.forward();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Text(
        widget.words[_currentIndex],
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

// Custom Rotation Text Widget
class _RotationTextWidget extends StatefulWidget {
  final List<String> words;
  final VoidCallback onComplete;

  const _RotationTextWidget({required this.words, required this.onComplete});

  @override
  State<_RotationTextWidget> createState() => _RotationTextWidgetState();
}

class _RotationTextWidgetState extends State<_RotationTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            _currentIndex = (_currentIndex + 1) % widget.words.length;
            widget.onComplete();
            _controller.reset();
            _controller.forward();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Text(
        widget.words[_currentIndex],
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }
}

// Custom Style Animation Widget
class _CustomStyleWidget extends StatefulWidget {
  @override
  State<_CustomStyleWidget> createState() => _CustomStyleWidgetState();
}

class _CustomStyleWidgetState extends State<_CustomStyleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isBold = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() => _isBold = !_isBold);
            _controller.reset();
            _controller.forward();
          }
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Text(
          'Animated Style',
          style: TextStyle(
            fontSize: 28 + (_animation.value * 10),
            fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
            color: Color.lerp(Colors.deepPurple, Colors.pink, _animation.value),
          ),
        );
      },
    );
  }
}

// Animated Switcher Widget
class _AnimatedSwitcherWidget extends StatefulWidget {
  @override
  State<_AnimatedSwitcherWidget> createState() =>
      _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<_AnimatedSwitcherWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Text(
            '$_counter',
            key: ValueKey<int>(_counter),
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => setState(() => _counter++),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
