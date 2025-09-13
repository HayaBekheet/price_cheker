import 'package:flutter/material.dart';

import '/gen/assets.gen.dart';
import '/common/functions/is_device_mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                isDeviceMobile()
                    ? Assets.images.jpg.portraitGrocery.path
                    : Assets.images.jpg.landscapeStore.path,
                fit: BoxFit.fitHeight,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
