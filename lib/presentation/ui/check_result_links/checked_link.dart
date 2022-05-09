import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../asset/history_page_asset.dart';
import '../button/image_button.dart';

class CheckedLink extends StatelessWidget {
  final String url;

  final int percentages;

  const CheckedLink({Key? key, required this.url, required this.percentages})
      : super(key: key);

  Color _buildPercentagesColor(int percentages) {
    return percentages >= 70
        ? HexColor('#EB0C0C')
        : percentages >= 40
            ? HexColor('#FFD600')
            : HexColor('#9EFF00');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: Text(url,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis))),
          Container(
              alignment: Alignment.center,
              height: 40,
              margin: const EdgeInsets.only(left: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.only(right: 9),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(20),
                          color: _buildPercentagesColor(percentages)),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(percentages.toString(),
                                style: const TextStyle(fontSize: 9))),
                      ),
                    ),
                    ImageButton(
                        onTap: () {},
                        assetPath: HistoryPageAsset.show,
                        width: 35,
                        height: 35,
                        imageWidth: 20,
                        imageHeight: 20,
                        color: HexColor('#523634'))
                  ]))
        ],
      );
    }));
  }
}
