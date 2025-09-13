import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '/common/themes/colours.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withValues(alpha: 0.4),
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
      ),
      child: Column(
        spacing: 5.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr(context: context, 'home.product_card.offer'),
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Colors.orange),
          ),
          Text(
            "إشترى خمس عبوات واحصل على السادسة مجاناً",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colours.kHighlightColor4),
          ),
        ],
      ),
    );
  }
}
