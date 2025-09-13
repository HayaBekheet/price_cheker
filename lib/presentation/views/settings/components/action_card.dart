import 'package:flutter/material.dart';

import '/common/functions/is_device_mobile.dart';
import '/common/themes/colours.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.function,
    required this.iconData,
    this.iconSize,
    required this.title,
    this.titleStyle,
    this.description,
    this.color,
  });

  final void Function()? function;
  final IconData iconData;
  final double? iconSize;
  final String title;
  final TextStyle? titleStyle;
  final String? description;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: isDeviceMobile() ? null : 60.0,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          color: Colours.kFillColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: (color ?? Colours.kSecondaryColor).withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  iconData,
                  size: iconSize,
                  color: color ?? Colours.kSecondaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: titleStyle ??
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: color ?? Colours.kSecondaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                  ),
                  if (description != null)
                    Text(
                      description!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: color ?? Colours.kHighlightColor1),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
