import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diagnose/language_provider.dart';
import 'package:diagnose/screens/animalscreen.dart';
import 'package:diagnose/screens/commumityscreen.dart';
import 'package:diagnose/screens/plantscreen.dart';
import 'package:diagnose/screens/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Controllerscreen extends StatefulWidget {
  const Controllerscreen({super.key});

  @override
  State<Controllerscreen> createState() => _ControllerscreenState();
}

class _ControllerscreenState extends State<Controllerscreen> {
  int _page = 0;
  final List<Widget> _screens = [
    const Plantscreen(),
    const Animalscreen(),
    const Commumityscreen(),
    const Profilescreen(),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const Icon(Icons.menu),
            title: const Text(
              "AgriNos",
              style: TextStyle(fontFamily: "FontMain", color: Colors.green),
            ),
            centerTitle: true,
            actions: [
              OutlinedButton(
                onPressed: () async {
                  await showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(
                        100, 100, 0, 0),
                    items: LanguageProvider.languages.map((language) {
                      return PopupMenuItem(
                        value: language['locale'],
                        child: Text(language['name']),
                      );
                    }).toList(),
                  ).then((value) {
                    if (value != null) {
                      context
                          .read<LanguageProvider>()
                          .changeLanguage(value as String);
                    }
                  });
                },
                child: const Text("en"),
              ),
              const SizedBox(
                width: 13,
              )
            ]),
        body: _screens[_page],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          backgroundColor: const Color(0xFFCAF0F8),
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          items: [
            SvgPicture.asset(
              'assets/images/plant.svg',
              height: 24,
              width: 24,
              allowDrawingOutsideViewBox: true,
            ),
            SvgPicture.asset(
              'assets/images/animal.svg',
              height: 24,
              width: 24,
              allowDrawingOutsideViewBox: true,
            ),
            SvgPicture.asset(
              'assets/images/community.svg',
              height: 24,
              width: 24,
              allowDrawingOutsideViewBox: true,
            ),
            SvgPicture.asset(
              'assets/images/profile.svg',
              height: 24,
              width: 24,
              allowDrawingOutsideViewBox: true,
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ));
  }
}
