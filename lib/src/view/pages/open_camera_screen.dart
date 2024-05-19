import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OpenCameraScreen extends StatefulWidget {
  const OpenCameraScreen({super.key});

  @override
  State<OpenCameraScreen> createState() => _OpenCameraScreenState();
}

class _OpenCameraScreenState extends State<OpenCameraScreen> {
  late List<CameraDescription> cameras;

  late CameraController cameraController;

  Future<void> isCameraEnabled() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.veryHigh,
      enableAudio: false,
    );
    await cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Theme(
        data: ThemeData(
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          ),
        ),
        child: FutureBuilder(
          future: isCameraEnabled(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Stack(
              children: [
                CameraPreview(cameraController),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.image),
                            onPressed: () async {
                              final selectedImage = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (selectedImage == null) return;
                              if (mounted) {
                                Navigator.pop(context, selectedImage.path);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: Colors.white,
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.circle,
                            size: 45,
                          ),
                          onPressed: () async {
                            final picture = await cameraController.takePicture();
                            if (mounted) {
                              Navigator.pop(context, picture.path);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
