import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Image Picker'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.grey),
              ),
              child: _imageFile != null
                  ? Image.file(
                      File(_imageFile!.path),
                      fit: BoxFit.contain,
                      width: 300,
                      height: 300,
                    )
                  : const Center(child: Text('Image not Picked')),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final XFile? photo = await _picker.pickImage(
                  source: ImageSource.gallery,
                );
                setState(() {
                  _imageFile = photo;
                });
                if (photo != null) {
                  debugPrint('Image Picked: ${photo.path}');
                }
              },
              child: const Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final XFile? photo = await _picker.pickImage(
                  source: ImageSource.camera,
                );
                setState(() {
                  _imageFile = photo;
                });
                if (photo != null) {
                  debugPrint('Image Picked: ${photo.path}');
                }
              },
              child: const Text('Take Photo with Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
