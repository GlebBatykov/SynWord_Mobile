import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword/presentation/cubit/layer/operation_layer/operation_layer.dart';

import '../../../../../asset/icon_asset.dart';
import '../../../../../asset/premium_page_asset.dart';
import '../../../../../model/layer/operation_layer/rephrase/rephrase_layer_body_preparation_data.dart';
import '../../../../material_container.dart';
import 'rephrase_layer_preparation_section_item.dart';

class RephraseLayerPreparation extends StatelessWidget {
  final RephraseLayerBodyPreparationData data;

  const RephraseLayerPreparation({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var coinsImage = Image.asset(PremiumPageAsset.coins, width: 13, height: 13);

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowIndicator();

        return true;
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 248,
              height: 167,
              margin: const EdgeInsets.only(bottom: 26, top: 9),
              padding: const EdgeInsets.only(top: 17, left: 12, bottom: 13),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor('#DDC5A2'),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 18),
                      child: Text(
                        'STANDART',
                        style: TextStyle(
                            fontFamily: 'Audrey',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      )),
                  const RephraseLayerPreparationSectionItem(
                      title: 'Replacing words with synonyms'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child:
                            RephraseLayerPreparationSectionItem(title: 'Price'),
                      ),
                      Text(data.rephasePrice.toString(),
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                      Padding(
                          padding: const EdgeInsets.only(left: 7, right: 3),
                          child: coinsImage),
                    ],
                  ),
                  MaterialContainer(
                    margin: const EdgeInsets.only(top: 24),
                    onTap: () {
                      data.layerCubit.setRephraseType(RephraseType.synonymizer);

                      data.layerCubit.work();
                    },
                    color: HexColor('#DDC5A2'),
                    width: 111,
                    height: 24,
                    child: const Center(
                        child: Text('SELECT',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700))),
                  )
                ],
              ),
            ),
            Container(
                width: 248,
                height: 187,
                padding: const EdgeInsets.only(top: 17, left: 12, bottom: 13),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: HexColor('#DDC5A2'),
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(bottom: 18),
                        child: Text(
                          'STANDART',
                          style: TextStyle(
                              fontFamily: 'Audrey',
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        )),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 8, top: 2),
                              child: Image.asset(PremiumPageAsset.point,
                                  width: 10, height: 10)),
                          const Flexible(
                              child: Text(
                                  'Complete paraphrasing of the text without changing its meaning',
                                  style: TextStyle(fontSize: 13)))
                        ]),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: RephraseLayerPreparationSectionItem(
                              title: 'Price'),
                        ),
                        Text(data.enhancedRephrasePrice.toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                        Padding(
                            padding: const EdgeInsets.only(left: 7, right: 3),
                            child: coinsImage),
                      ],
                    ),
                    MaterialContainer(
                      margin: const EdgeInsets.only(top: 24),
                      onTap: () {
                        data.layerCubit.setRephraseType(RephraseType.enhanced);

                        data.layerCubit.work();
                      },
                      color: HexColor('#c56a56'),
                      width: 111,
                      height: 24,
                      child: const Center(
                          child: Text('SELECT',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w700))),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconAsset.wallet, width: 17, height: 17),
                    Container(
                        margin: const EdgeInsets.only(left: 10, right: 6),
                        child: Text(data.coins.toString(),
                            style: const TextStyle())),
                    coinsImage
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
