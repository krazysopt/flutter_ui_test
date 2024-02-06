
import 'package:flutter/material.dart';
import 'package:flutter_ui_test/model/advert.dart';
import 'package:flutter_ui_test/widgets/common/text/common_label.dart';

import '../../const/constants.dart';
import '../common/inkwell/common_inkwell.dart';

class AdBox extends StatelessWidget {

  /// avert model
  final Advert advert;

  /// callback when clicked close button
  final Function()? onClose;

  /// advertisement widget
  const AdBox({
    Key? key,
    required this.advert,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 54,
          margin: const EdgeInsets.symmetric(vertical: 20),
          color: Constants.fgPrimary,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 90,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Container()),
                      CommonLabel(advert.msg1,
                        fontSize: Constants.fntMiddleSize,
                        color: Constants.blueLight,
                      ),
                      const SizedBox(height: 3,),
                      CommonLabel(advert.msg2,
                        color: Colors.white,
                        fontSize: Constants.fntSmallSize,
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                )
              ),
              // close button
              CommonInkWell(
                onTap: onClose,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: const Icon(Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(3.5),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Constants.fgPrimary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.new_releases,
                color: Constants.redLight,
                size: 37,
              ),
            ),
          ),
        ),
      ],
    );
  }

}

