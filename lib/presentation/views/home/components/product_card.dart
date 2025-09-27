import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:super_banners/super_banners.dart';

import '/gen/assets.gen.dart';
import '/common/themes/colours.dart';
import 'custom_divider.dart';
import 'product_price.dart';
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
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    spacing: 10.0,
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 10.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "زجاجة مياه بركة",
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  color: Colours.kHighlightColor4,
                                  fontSize: 25.0,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            spacing: 5.0,
                            children: [
                              const Icon(
                                CupertinoIcons.barcode,
                                color: Colours.kHighlightColor4,
                                size: 30.0,
                              ),
                              Text(
                                "M10289",
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(color: Colours.kHighlightColor4),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          const CustomDivider(),
                          const ProductPrice(),
                          Container(
                            padding: const EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF3498DB),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7.0),
                              ),
                            ),
                            child: Row(
                              spacing: 5.0,
                              children: [
                                const Icon(
                                  Icons.redeem_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  "إشترى خمس عبوات واحصل على السادسة مجاناً",
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
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
                          const SizedBox(height: 1.0),
                          const CustomDivider(),
                          Text(
                            tr(context: context, 'home.product_card.details'),
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colours.kHighlightColor4),
                          ),
                          /*IconedTitle(
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
                          ),*/

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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    CornerBanner(
                      bannerPosition: context.locale.languageCode == 'ar'
                          ? CornerBannerPosition.topLeft
                          : CornerBannerPosition.topRight,
                      bannerColor: Color(0xFF3498DB),
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Text(
                          tr(context: context, 'home.product_card.offer'),
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
