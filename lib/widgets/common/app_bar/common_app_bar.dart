import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../../../model/basket.dart';
import '../../../model/user.dart';
import '../image/common_circle_avatar.dart';
import '../text/common_label.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// icon of app bar
  final IconData iconData;

  /// callback when pressed app bar icon
  final Function()? onLeadingPressed;

  /// login user info
  final User user;

  /// basket info
  final Basket basket;

  /// app bar
  const CommonAppBar({
    Key? key,
    this.iconData = Icons.arrow_back,
    required this.onLeadingPressed,
    required this.user,
    required this.basket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      titleSpacing: 5,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // welcome
          CommonLabel('Welcome, ${user.firstName}',
            color: Constants.white,
            fontSize: Constants.fntMiddleSize,
          ),
          // location
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined,
                color: Constants.greyMiddle,
                size: 20,
              ),
              CommonLabel(user.location,
                color: Constants.greyMiddle,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Constants.fgPrimary,
      shadowColor: Colors.transparent,
      leading: Builder(
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonCircleAvatar(
                profilePath: user.avatar,
                onTap: onLeadingPressed,
              )
            ],
          );
        },
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // shopping basket
            BasketBox(basket: basket),
            const SizedBox(width: 10,),
          ],
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}

class BasketBox extends StatelessWidget {
  final Basket basket;

  /// basket box
  const BasketBox({
    Key? key,
    required this.basket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // shopping basket
        Container(
          padding: const EdgeInsets.only(top: 3, right: 1),
          child: const Icon(CupertinoIcons.shopping_cart,
            color: Colors.white,
          ),
        ),
        // shopping count
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: const BoxDecoration(
              color: Constants.redLight,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CommonLabel(
                basket.getCounts().toString(),
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

}

