import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../asset/icon_asset.dart';
import '../../../../cubit/page/history/body/item/history_page_body_result_item_cubit.dart';
import '../../../../model/page/history/result_info.dart';
import '../../../button/image_button.dart';
import '../../../material_container.dart';

class HistoryPageBodyResultItem extends StatelessWidget {
  final EdgeInsets? margin;

  const HistoryPageBodyResultItem({Key? key, this.margin}) : super(key: key);

  Widget _buildPercentagesBox(HistoryPageBodyResultItemCheck state) {
    var color = state.percentages >= 70
        ? HexColor('#26D222')
        : state.percentages >= 40
            ? HexColor('#FBFF42')
            : Colors.red;

    return Container(
      height: 20,
      margin: const EdgeInsets.only(left: 13),
      padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: HexColor('#d9d9d9'), borderRadius: BorderRadius.circular(3)),
      child: Text(state.percentages.toString(),
          style: TextStyle(color: color, fontWeight: FontWeight.w400)),
    );
  }

  Widget _buildSourceIcon(TextSource source) {
    var assetPath =
        source == TextSource.docx ? IconAsset.docxFile : IconAsset.pdf;

    return Container(
        margin: const EdgeInsets.only(left: 13),
        child: Image.asset(assetPath, width: 20, height: 20));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryPageBodyResultItemCubit,
        HistoryPageBodyResultItemState>(builder: (context, state) {
      if (state is HistoryPageBodyResultItemShow) {
        return MaterialContainer(
          height: 104,
          width: 310,
          borderRadius: BorderRadius.circular(5),
          margin: margin,
          color: HexColor('#eeeeee'),
          onTap: state.onTap,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25))
          ],
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 13, bottom: 8, left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Text(state.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                            if (state is HistoryPageBodyResultItemCheck)
                              _buildPercentagesBox(state),
                            if (state.source != TextSource.userInput)
                              _buildSourceIcon(state.source)
                          ],
                        ),
                      ),
                      Text(
                        state.text,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )),
              Positioned(
                  top: 8,
                  right: 8,
                  child: ImageButton(
                      assetPath: IconAsset.close,
                      imageColor: Colors.black,
                      imageHeight: 15,
                      imageWidth: 15,
                      onTap: state.onTap))
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
