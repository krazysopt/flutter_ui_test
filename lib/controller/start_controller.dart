import 'package:get/get.dart';

import '../model/advert.dart';
import '../model/page_item.dart';

class StartController extends GetxController {

  /// selected page name
  var selPage = PageItem.home.obs;

  /// advert
  var adverts = <Advert>[].obs;

  /// init controller
  init() {
    selPage.value = PageItem.home;

    showAdvert();
  }

  /// show advert
  showAdvert() {
    adverts.value = [
      const Advert(
        msg1: 'Get 10% For 1ST ORDER',
        msg2: 'On All Stores'
      ),
    ];
  }

  removeAdvert() {
    adverts.value = [];
  }
}