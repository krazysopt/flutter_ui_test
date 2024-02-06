import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_test/screens/home/home.dart';
import 'package:get/get.dart';

import '../const/constants.dart';
import '../controller/home_controller.dart';
import '../controller/start_controller.dart';
import '../controller/user_controller.dart';
import '../model/basket.dart';
import '../model/page_item.dart';
import '../widgets/ad/ad_box.dart';
import '../widgets/common/app_bar/common_app_bar.dart';
import '../widgets/common/scaffold/common_bottom_bar.dart';
import '../widgets/common/scaffold/common_screen.dart';

class StartScreen extends StatefulWidget {

  const StartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  final StartController _startController = Get.put(StartController());
  final HomeController _homeController = Get.put(HomeController());
  final UserController _userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();

    // screen orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _startController.init();
    _homeController.init();
    _userController.init();
  }

  static const basketLabel = '1';

  @override
  Widget build(BuildContext context) {
    return Obx(() => CommonScreen(
      appBar: CommonAppBar(
        user: _userController.curUser.value,
        basket: Basket(
            items: {basketLabel: 4}
        ),
        onLeadingPressed: () {
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: Constants.screenPaddingV),
        child: getBody(),
      ),
      ad: _startController.adverts.isNotEmpty ? AdBox(
          advert: _startController.adverts[0],
          onClose: () {
            _startController.removeAdvert();
          },
      ) : null,
      bottom: CommonBottomBar(
        selectedItem: _startController.selPage.value,
        items: const [
          PageItem(label: PageItem.home, icon: Icons.home_outlined),
          PageItem(label: PageItem.services, icon: Icons.padding),
          PageItem(label: PageItem.myOrders, icon: Icons.shopping_bag_outlined),
          PageItem(label: PageItem.myAccounts, icon: CupertinoIcons.person),
        ],
        onSelected: (value) {
          _startController.selPage.value = value;
        },
      ),
    ));
  }

  Widget getBody() {
    if (_startController.selPage.value == PageItem.home) {
      return HomeScreen(
        portfolios: _homeController.portfolios,
        category: _homeController.selCategory.value,
        onCategory: (value) {
          _homeController.selectCategory(value);
        },
        goods: _homeController.goods,
        searchKey: _homeController.dispSearchKey.value,
        onChangedSearchKey: (value, needUpdate) {
          if (needUpdate) {
            _homeController.dispSearchKey.value = value;
          }
          _homeController.searchKey = value;

        },
        onSearch: () {
          _homeController.searchKey = '';
          _homeController.dispSearchKey.value = '';
        },
      );
    } else {
      return Container();
    }
  }

}