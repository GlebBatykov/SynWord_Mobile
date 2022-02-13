import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:poseidon/poseidon.dart';

class PremiumPageTitleBar extends StatelessWidget {
  const PremiumPageTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28, right: 28, top: 14, bottom: 14),
      child: LayoutBuilder(builder: ((context, constraints) {
        var width = constraints.maxWidth;

        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: width * 0.33,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 3)
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            child: InkWell(
                                onTap: () {
                                  GetIt.instance<Poseidon>().pop();
                                },
                                child: const Icon(Icons.arrow_back,
                                    color: Colors.black, size: 25))),
                      )),
                ),
              ),
              Container(
                  width: width * 0.33,
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/premium-page/crown.png')),
              SizedBox(width: width * 0.33)
            ]);
      })),
    );
  }
}
