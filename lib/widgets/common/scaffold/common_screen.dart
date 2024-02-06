
import 'package:flutter/material.dart';

import '../../../const/constants.dart';

class CommonScreen extends StatelessWidget {
  /// app bar
  final PreferredSizeWidget? appBar;

  /// main body
  final Widget body;

  /// advertisement
  final Widget? ad;

  final Widget? bottom;

  /// common screen widget
  const CommonScreen({
    Key? key,
    this.appBar,
    required this.body,
    this.ad,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //double appBarHeight = 0;
    double screenHeight = MediaQuery.of(context).size.height;
    if (appBar != null) {
      double appBarHeight = AppBar().preferredSize.height;
      screenHeight = screenHeight - appBarHeight - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    }

    return Scaffold(
      appBar: appBar,
      backgroundColor: Constants.bgPrimary,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          body,
                          if (ad != null) ...[
                            Positioned(
                              left: 0,
                              bottom: 0,
                              right: 0,
                              child: ad!,
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (bottom != null) ...[
                      bottom!,
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

}