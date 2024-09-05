import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Commumityscreen extends StatefulWidget {
  const Commumityscreen({super.key});

  @override
  State<Commumityscreen> createState() => _CommumityscreenState();
}

class _CommumityscreenState extends State<Commumityscreen> {
  final List<ImageProvider> profileImage = [
    const AssetImage('assets/images/profile_img.jpeg')
  ];
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              SvgPicture.asset(
                'assets/images/community.svg',
                fit: BoxFit.fill,
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 10,),
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Community Connect",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FontMain'),
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        controller: textController,
                        autofocus: false,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: 'Search Queries',
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
                const Icon(Icons.filter_alt_rounded, size: 35,),
                const SizedBox(
                  width: 13,
                )
              ],
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  const Icon(Icons.emoji_emotions_sharp, size: 30, color: Colors.black,),
                  const SizedBox(
                    width: 18,
                  ),
                  const Icon(Icons.image, size: 30,),
                  const SizedBox(
                    width: 18,
                  ),
                  const Icon(Icons.attach_file, size: 30,),
                  const Spacer(flex: 1,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text("Post", style: TextStyle(fontSize: 17),)),
                  ),
                  const SizedBox(width: 19,)
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: profileImage.length,
                  itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: profileImage[index],
                    radius: 30,
                  ),
                  title: const Text("Name Name"),
                  subtitle: const Text("afnuie aienfas fainerye fddfbyiean afmowmae"),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
