import 'package:flutter_ui_test/model/portfolio.dart';
import 'package:get/get.dart';

import '../const/constants.dart';
import '../model/good.dart';

class HomeController extends GetxController {

  /// portfolios
  var portfolios = <Portfolio>[].obs;

  /// goods
  var goods = <Good>[].obs;

  /// category
  var selCategory = ''.obs;

  /// search key
  var searchKey = '';

  /// display search key
  var dispSearchKey = ''.obs;

  /// init
  init() {
    portfolios.value = [
      const Portfolio(image: 'assets/images/portfolio1.jpg', comment1: 'RUN WITH US!', comment2: 'LIFE IN THE FAST LANE'),
      const Portfolio(image: 'assets/images/portfolio2.jpg', comment1: 'REFRESH YOUR FITNESS', comment2: 'LOOK GREAT'),
      const Portfolio(image: 'assets/images/portfolio3.jpg', comment1: 'NO PAIN, NO GAIN', comment2: 'LOOK MORE FIT'),
      const Portfolio(image: 'assets/images/portfolio4.jpg', comment1: 'STAY HAPPY, STAY FIT', comment2: 'FITNESS FOR EVERYONE'),
    ];

    _initGoodRide();

    selCategory.value = Constants.categoryRide;
  }

  /// for test
  _initGoodRide() {
    goods.value = [
      const Good(id: '', name: 'Economy', price: '', image: 'assets/images/car1.png', description: 'Select the vehicle size and price that fits your comfort level', ),
      const Good(id: '', name: 'Taxicab', price: '', image: 'assets/images/car2.png', description: 'Select the vehicle size and price that fits your comfort level', ),
      const Good(id: '', name: 'Luxury', price: '', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
      const Good(id: '', name: 'Luxury', price: '', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
      const Good(id: '', name: 'Luxury', price: '', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
      const Good(id: '', name: 'Luxury', price: '', image: 'assets/images/car3.png', description: 'Select the vehicle size and price that fits your comfort level', ),
    ];
  }

  /// for test
  _initGoodEat() {
    goods.value = [
      const Good(id: '', name: 'Sandwich1', price: '', image: 'assets/images/eat1.png', description: 'Select the sandwich size and price that fits your comfort level', ),
      const Good(id: '', name: 'Sandwich2', price: '', image: 'assets/images/eat2.png', description: 'Select the sandwich size and price that fits your comfort level', ),
      const Good(id: '', name: 'Sandwich3', price: '', image: 'assets/images/eat3.png', description: 'Select the sandwich size and price that fits your comfort level', ),
    ];
  }

  /// select good category
  selectCategory(String category) {
    selCategory.value = category;

    if (category == Constants.categoryRide) {
      _initGoodRide();
    } else if (category == Constants.categoryEat) {
      _initGoodEat();
    } else {
      goods.value = [];
    }
  }
}