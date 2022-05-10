import 'package:flutter/material.dart';

import '../../../model/layer/operation_layer/check/second_check_layer_body_content_data.dart';
import '../../check_result_links/check_result_links.dart';
import '../../wave_bar/wave_bar.dart';

class SecondCheckLayerBody extends StatelessWidget {
  final SecondCheckLayerBodyContentData data;

  const SecondCheckLayerBody({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2, bottom: 15),
      child: Column(
        children: [
          const Text('The uniqueness of your text is equal to',
              style: TextStyle(
                  fontFamily: 'Audrey',
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          Container(
            margin:
                const EdgeInsets.only(top: 19, bottom: 20, left: 31, right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WaveBar(progress: data.sourceProgress),
                WaveBar(progress: data.newProgress)
              ],
            ),
          ),
          Container(
            height: 1,
            width: 232,
            color: Colors.black.withOpacity(0.5),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 13),
                child: CheckResultLinks(
                  links: data.links,
                  scrollbarCrossAxisMargin: 20,
                )),
          )
        ],
      ),
    );
  }
}
