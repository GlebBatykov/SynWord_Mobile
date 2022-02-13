import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/page/premium_page/premium_page_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/premium/body/premium_page_body_button.dart';

import 'section/premium_page_body_gold_section.dart';
import 'section/premium_page_body_silver_section.dart';

class PremiumPageBody extends StatelessWidget {
  const PremiumPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: LayoutBuilder(builder: ((context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: BlocBuilder<PremiumPageCubit, PremiumPageState>(
              builder: (context, state) {
            if (state is PremiumPageShow) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  PremiumPageBodySilverSection(),
                  PremiumpageBodyGoldSection(),
                ],
              );
            } else if (state is PremiumPageLoad) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 17),
                    color: HexColor('#C4C4C4').withOpacity(0.7),
                  ),
                  const Text('Please wait...',
                      style: TextStyle(fontFamily: 'Araboto-Medium'))
                ],
              );
            } else if (state is PremiumPageActive) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 26),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 5)
                        ]),
                    child: Image.asset('assets/images/premium-page/correct.png',
                        width: 120, height: 120),
                  ),
                  const Text('Thanks for subscription!',
                      style: TextStyle(
                          fontFamily: 'Araboto-Medium', fontSize: 16)),
                  (() {
                    if (state is PremiumPageSilverActive) {
                      return Container(
                        width: 208,
                        height: 145,
                        padding: const EdgeInsets.only(top: 21, bottom: 11),
                        margin: const EdgeInsets.only(top: 23),
                        decoration: BoxDecoration(
                            color: HexColor('#f0f0f0'),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(0.25))
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Your current plan: ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Cabrion',
                                              fontSize: 11),
                                          children: [
                                        TextSpan(
                                            text: 'SILVER',
                                            style: TextStyle(
                                                color: HexColor('#03c6ba')))
                                      ])),
                                ),
                                const Text('Time left: 1 day(s)',
                                    style: TextStyle(
                                        fontFamily: 'Cabrion', fontSize: 11))
                              ],
                            ),
                            PremiumPageBodyButton(
                                title: 'Upgrade to GOLD',
                                color: HexColor('#dbb432').withOpacity(0.56))
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        width: 208,
                        height: 83,
                        padding: const EdgeInsets.only(top: 21, bottom: 11),
                        margin: const EdgeInsets.only(top: 23),
                        decoration: BoxDecoration(
                            color: HexColor('#f0f0f0'),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(0.25))
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Your current plan: ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Cabrion',
                                              fontSize: 11),
                                          children: [
                                        TextSpan(
                                            text: 'GOLD',
                                            style: TextStyle(
                                                color: HexColor('#b7923e')))
                                      ])),
                                ),
                                const Text('Time left: 1 day(s)',
                                    style: TextStyle(
                                        fontFamily: 'Cabrion', fontSize: 11))
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  })()
                ],
              );
            } else {
              return Container();
            }
          }),
        );
      })),
    );
  }
}
