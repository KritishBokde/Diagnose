import 'package:diagnose/screens/camerascreen.dart';
import 'package:flutter/material.dart';

class Diseasescreen extends StatelessWidget {
  final String image;
  final String tag;
  const Diseasescreen({super.key, required this.image, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.chevron_left)),
        title: const Text("back"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 220,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Icon(
                Icons.ac_unit_rounded,
                size: 60,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Supporting farmers in\nSafeguarding their Crop Health",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Camerascreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent),
                  child: const ListTile(
                    leading: Icon(Icons.camera_alt_outlined),
                    title: Text(
                      "Take Picture",
                      style: TextStyle(fontSize: 27),
                    ),
                    subtitle: Text("of your plant"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent),
                  child: const ListTile(
                    leading: Icon(Icons.camera_alt_outlined),
                    title: Text(
                      "Import",
                      style: TextStyle(fontSize: 27),
                    ),
                    subtitle: Text("from Gallery"),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
