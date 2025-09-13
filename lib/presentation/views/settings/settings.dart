import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '/common/service_locator.dart';
import '/common/app_preferences/app_preferences.dart';
import 'components/action_card.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = 'settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> _changeAppLanguage(BuildContext context) async {
    if (context.locale.languageCode == 'en') {
      context.setLocale(const Locale('ar', 'SA'));
      await getIt<AppPreferences>().setLanguageCode('ar');
    } else {
      context.setLocale(const Locale('en', 'US'));
      await getIt<AppPreferences>().setLanguageCode('en');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(tr(context: context, 'settings.title'))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            spacing: 10.0,
            children: [
              const SizedBox(height: 5),
              ActionCard(
                function: () async {
                  await _changeAppLanguage(context);
                },
                iconData: Icons.language_outlined,
                title: tr(context: context, 'settings.change_language.title'),
                description: tr('settings.change_language.description'),
              ),
              ActionCard(
                function: () {},
                iconData: Icons.dns_outlined,
                title: tr(context: context, 'settings.ip.title'),
              ),
              ActionCard(
                function: () {},
                iconData: Icons.anchor_outlined,
                title: tr(context: context, 'settings.port.title'),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
