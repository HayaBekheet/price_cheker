import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:super_banners/super_banners.dart';

import '/gen/assets.gen.dart';
import '/common/themes/colours.dart';
import 'custom_divider.dart';
import 'offer_card.dart';
import 'money_with_saudi_riyal_symbol.dart';
import 'iconed_title.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tr(context: context, 'home.product_card.title'),
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: Colors.white),
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    spacing: 10.0,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        spacing: 10.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "زجاجة مياه بركة",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: Colours.kHighlightColor4),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const CustomDivider(),
                          Container(
                            padding: const EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                              color: Colours.kHighlightColor4.withValues(
                                alpha: 0.2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7.0),
                              ),
                            ),
                            child: MoneyWithSaudiRiyalSymbol(
                              money: 35.00,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colours.kHighlightColor4),
                              symbolColor: Colours.kHighlightColor4,
                            ),
                          ),
                          //const OfferCard(),
                          Row(
                            spacing: 5.0,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colours.kSuccessColor,
                              ),
                              Text(
                                tr(
                                  context: context,
                                  'home.product_card.available',
                                ),
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(color: Colours.kSuccessColor),
                              ),
                            ],
                          ),
                          const CustomDivider(),
                          Text(
                            tr(context: context, 'home.product_card.details'),
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colours.kHighlightColor4),
                          ),
                          IconedTitle(
                            icon: Icons.language_outlined,
                            title: "بلد المنشأ: مصر",
                          ),
                          IconedTitle(
                            icon: Icons.event_busy_outlined,
                            title: "تاريخ الإنتهاء: 2025/09/13",
                          ),
                          IconedTitle(
                            icon: Icons.electric_meter_outlined,
                            title: "الحجم: 250 مل",
                          ),
                          IconedTitle(
                            icon: Icons.info_outline,
                            title:
                                "استمتع بنقاء ينعش حواسك مع كل رشفة. زجاجة مياهنا المصممة بعناية تجمع بين الأداء المتفوق والراحة اليومية.",
                          ),
                        ],
                      ),
                      Image.asset(Assets.images.png.dummyBusinessLogo.path),
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  CornerBanner(
                    bannerPosition: context.locale.languageCode == 'ar'
                        ? CornerBannerPosition.topLeft
                        : CornerBannerPosition.topRight,
                    bannerColor: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: Text(
                        "إشترى خمس عبوات واحصل على السادسة مجاناً",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colours.kHighlightColor4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
