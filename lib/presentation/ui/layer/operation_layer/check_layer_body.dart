import 'package:flutter/material.dart';
import 'package:synword/presentation/ui/layer/layer_properties.dart';

import '../../../model/layer/operation_layer/check/check_layer_body_content_data.dart';
import '../../check_result_links/check_result_links.dart';
import '../../custom_scrollbar.dart';
import '../../wave_bar/wave_bar.dart';

class CheckLayerBody extends StatelessWidget {
  final CheckLayerBodyContentData data;

  const CheckLayerBody({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = data.layerSize;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowIndicator();

        return true;
      },
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height -
              LayerProperties.headerHeight -
              LayerProperties.marginTop -
              LayerProperties.marginBottom,
          margin: const EdgeInsets.only(top: 12, bottom: 15),
          child: Column(
            children: [
              const Text('The uniqueness of your text is equal to',
                  style: TextStyle(
                      fontFamily: 'Audrey',
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
              Container(
                margin: const EdgeInsets.only(top: 19, bottom: 20),
                child: WaveBar(progress: data.progress),
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
        ),
      ),
    );
  }
}
