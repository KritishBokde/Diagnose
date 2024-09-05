import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camerascreen extends StatefulWidget {
  const Camerascreen({super.key});

  @override
  State<Camerascreen> createState() => _CamerascreenState();
}

class _CamerascreenState extends State<Camerascreen> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }
  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SafeArea(
        child: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              child: CameraPreview(
                cameraController!,
              )),
          IconButton(
              onPressed: () async {
                await cameraController!.takePicture();
              },
              icon: const Icon(
                Icons.camera,
                color: Colors.red,
                size: 60,
              ))
        ],
      ),
    ));
  }
  Future<void> _setupCameraController() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        setState(() {
          cameraController = CameraController(cameras.first, ResolutionPreset.ultraHigh);
        });
        await cameraController?.initialize().then((_) {
          if (!mounted) return;
          setState(() {});
        }).catchError((error) {
          print('Error Initialized camera: $error');
        });
      } else {
        print('No cameras available');
      }
    } catch (e) {
      print('Error getting available cameras: $e');
    }
  }
}
