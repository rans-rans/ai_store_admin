import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../pages/open_camera_screen.dart';

class SelectImageButton extends StatefulWidget {
  final Function(String?) onImageSelected;
  const SelectImageButton({required this.onImageSelected, super.key});

  @override
  State<SelectImageButton> createState() => _SelectImageButtonState();
}

class _SelectImageButtonState extends State<SelectImageButton> {
  void selectImage() {
    Permission.camera.isGranted.then((granted) async {
      if (!granted) {
        final permissionGranted = await Permission.camera.request();
        if (permissionGranted != PermissionStatus.granted) return;
      }
      if (mounted) {
        final imagePath = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const OpenCameraScreen(),
          ),
        ) as String?;

        widget.onImageSelected(imagePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: selectImage,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: const Text("Select image"),
    );
  }
}
