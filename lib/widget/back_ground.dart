import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/wallpaperflare.com_wallpaper.jpg',
              ))),
      // child:
      // Image.asset(
      //   'assets/images/wallpaperflare.com_wallpaper.jpg',
      //   fit: BoxFit.contain,
      // ),
    );
  }
}
