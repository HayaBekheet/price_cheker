import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '/common/service_locator.dart';
import '/common/app_preferences/app_preferences.dart';
import '/common/themes/colours.dart';
import 'number_field.dart';

class EditProductDisplayButtons extends StatefulWidget {
  const EditProductDisplayButtons({super.key});

  @override
  State<EditProductDisplayButtons> createState() =>
      _EditProductDisplayButtonsState();
}

class _EditProductDisplayButtonsState extends State<EditProductDisplayButtons> {
  int displayTime = getIt<AppPreferences>().getProductCardDisplayTime();
  late final TextEditingController displayTimeController;

  @override
  void initState() {
    super.initState();
    displayTimeController = TextEditingController(text: '$displayTime');
  }

  void _setNewDisplayTime(int newDisplayTime) async {
    await getIt<AppPreferences>().setProductCardDisplayTime(newDisplayTime);
    setState(() {
      displayTime = newDisplayTime;
      displayTimeController.text = '$displayTime';
    });
  }

  void _resetDisplayTimeController() {
    setState(() {
      displayTimeController.text = '$displayTime';
    });
  }

  @override
  void dispose() {
    super.dispose();
    displayTimeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr(context: context, 'settings.product_display_time'),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colours.kHighlightColor4),
        ),
        Row(
          spacing: 5.0,
          children: [
            IconButton(
              onPressed: () {
                int newDisplayTime = displayTime + 1;
                if (newDisplayTime <= 60) {
                  _setNewDisplayTime(newDisplayTime);
                }
              },
              icon: const Icon(
                Icons.add_circle,
                color: Colours.kHighlightColor4,
              ),
            ),
            Expanded(
              child: NumberField(
                controller: displayTimeController,
                onSubmit: (value) {
                  int? newDisplayTime = int.tryParse(value);
                  if (value.isNotEmpty &&
                      newDisplayTime != null &&
                      newDisplayTime >= 0 &&
                      newDisplayTime <= 60) {
                    _setNewDisplayTime(newDisplayTime);
                  } else {
                    _resetDisplayTimeController();
                  }
                },
              ),
            ),
            IconButton(
              onPressed: () {
                int newDisplayTime = displayTime - 1;
                if (newDisplayTime >= 0) {
                  _setNewDisplayTime(newDisplayTime);
                }
              },
              icon: const Icon(
                Icons.remove_circle,
                color: Colours.kHighlightColor4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
