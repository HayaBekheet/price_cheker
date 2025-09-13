import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:price_checker_2/presentation/views/home/components/product_card.dart';

import '../settings/settings.dart';
import '/gen/assets.gen.dart';
import '/common/functions/is_device_mobile.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                isDeviceMobile()
                    ? Assets.images.jpg.portraitGrocery.path
                    : Assets.images.jpg.landscapeStore.path,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withValues(alpha: 0.7),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SettingsScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  spacing: 20.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.png.logo.path,
                      color: Colors.white,
                    ),
                    Image.asset(Assets.images.png.scanner.path, scale: 2.0),
                    Text(
                      tr(context: context, 'home.call_to_action'),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const ProductCard(),
          ],
        ),
      ),
    );
  }
}
