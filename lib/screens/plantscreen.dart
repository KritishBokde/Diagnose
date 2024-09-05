import 'package:diagnose/screens/diseasescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Plantscreen extends StatelessWidget {
  const Plantscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'image': 'assets/images/berry.png',
        'tag': 'berry1',
        'label': AppLocalizations.of(context)!.berryLeaf
      },
      {
        'image': 'assets/images/guava.png',
        'tag': 'guava1',
        'label': AppLocalizations.of(context)!.guavaLeaf
      },
      {
        'image': 'assets/images/orange.png',
        'tag': 'orange1',
        'label': AppLocalizations.of(context)!.orangeLeaf
      },
      {
        'image': 'assets/images/tomato.png',
        'tag': 'tomato1',
        'label': AppLocalizations.of(context)!.tomatoLeaf
      },
      {
        'image': 'assets/images/berry.png',
        'tag': 'berry',
        'label': AppLocalizations.of(context)!.berryLeaf
      },
      {
        'image': 'assets/images/guava.png',
        'tag': 'guava',
        'label': AppLocalizations.of(context)!.guavaLeaf
      },
      {
        'image': 'assets/images/orange.png',
        'tag': 'orange',
        'label': AppLocalizations.of(context)!.orangeLeaf
      },
      {
        'image': 'assets/images/tomato.png',
        'tag': 'tomato',
        'label': AppLocalizations.of(context)!.tomatoLeaf
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  AppLocalizations.of(context)!.plantSubDiseasetitle,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FontMain'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/apple.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 220,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              AppLocalizations.of(context)!.selectPlant,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Diseasescreen(
                          image: item['image']!,
                          tag: item['tag']!,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Hero(
                          tag: item['tag']!,
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                      ),
                      Text(item['label']!, style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
