# Learn Concepts in Flutter

This repository contains examples and explanations for fundamental concepts in Flutter.

## Container and SizedBox - Video #1

This is the **first video** from the Flutter tutorial series based on the playlist: [Flutter Tutorial for Beginners](https://www.youtube.com/watch?v=GDAzKTnav9E&list=PL9n0l8rSshSmNoWh4KQ28nJn8npfMtzcs&index=30)

### What you'll learn:

#### Container
`Container` is one of the most used widgets in Flutter. It's extremely flexible and combines multiple functionalities:

- **Dimensions (width, height)** - Sets width and height
- **Margin** - External space around the widget
- **Padding** - Internal space (between content and edges)
- **Decoration** - Colored background, gradients, images, borders, shadows
- **Alignment** - Content alignment inside

```dart
Container(
  width: 200,
  height: 200,
  margin: const EdgeInsets.all(20),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.red, width: 3),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 10,
        offset: const Offset(5, 5),
      ),
    ],
  ),
  child: const Text('Container'),
)
```

#### SizedBox
`SizedBox` is a simpler and more performant widget, used strictly for:

- **Fixed dimensions** - exact width and height
- **Spacing** - creating vertical or horizontal space between widgets
- **Expand** - filling all available space

```dart
// Fixed dimensions
SizedBox(
  width: 150,
  height: 150,
  child: Text('SizedBox'),
)

// Vertical spacing
const SizedBox(height: 20)

// Fill all available space
const SizedBox.expand(child: Text('Full'))
```

### Key difference:

| Feature | Container | SizedBox |
|---------|-----------|----------|
| Performance | Slower | Faster |
| Styling | Complete | Dimensions only |
| Easy to use | Yes | Yes |
| Best practice | When you need styling | Just for dimensions/spacing |

### Project structure:

```
lib/
├── main.dart                 # Main app
└── widgets/
    └── container_sized.dart  # Container & SizedBox examples
```

### Example files - Fundamental: Container & SizedBox

| File | Description | Link |
|------|-------------|------|
| container_sized.dart | All Container and SizedBox examples | [`lib/widgets/container_sized.dart`](lib/widgets/container_sized.dart) |

### Running the project:

```bash
flutter run
```

### Official resources:
- [Container Documentation](https://api.flutter.dev/flutter/widgets/Container-class.html)
- [SizedBox Documentation](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)

---

Follow the [YouTube playlist](https://www.youtube.com/watch?v=GDAzKTnav9E&list=PL9n0l8rSshSmNoWh4KQ28nJn8npfMtzcs&index=30) for more Flutter tutorials!
