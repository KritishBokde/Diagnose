import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'diseasescreen.dart';

class Animalscreen extends StatelessWidget {
  const Animalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'image': 'assets/images/donkey.png',
        'tag': 'donkey1',
        'label': AppLocalizations.of(context)!.donkey
      },
      {
        'image': 'assets/images/horse.png',
        'tag': 'horse1',
        'label': AppLocalizations.of(context)!.horse
      },
      {
        'image': 'assets/images/cow.png',
        'tag': 'cow1',
        'label': AppLocalizations.of(context)!.cow
      },
      {
        'image': 'assets/images/buffalo.png',
        'tag': 'buffalo1',
        'label': AppLocalizations.of(context)!.buffalo
      },
      {
        'image': 'assets/images/cat.png',
        'tag': 'cat1',
        'label': AppLocalizations.of(context)!.cat
      },
      {
        'image': 'assets/images/cows_grp.png',
        'tag': 'cows1',
        'label': AppLocalizations.of(context)!.cows
      },
      {
        'image': 'assets/images/donkey.png',
        'tag': 'donkey',
        'label': AppLocalizations.of(context)!.donkey
      },
      {
        'image': 'assets/images/cat.png',
        'tag': 'cat',
        'label': AppLocalizations.of(context)!.cat
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
                  AppLocalizations.of(context)!.animalSubDiseasetitle,
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
                  'assets/images/goat.png',
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
              AppLocalizations.of(context)!.selectAnimal,
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
