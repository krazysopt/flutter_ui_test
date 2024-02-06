import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../../model/good.dart';
import '../../model/portfolio.dart';
import '../../widgets/common/text/common_auto_label.dart';
import '../../widgets/common/text_field/common_text_field_search.dart';
import 'widgets/PortfolioSlider.dart';
import 'widgets/category_button.dart';
import 'widgets/good_box.dart';

class HomeScreen extends StatelessWidget {

  final List<Portfolio> portfolios;

  /// selected category
  final String category;

  /// callback when selecting category
  final Function(String category)? onCategory;

  /// good list
  final List<Good> goods;

  /// search key
  final String searchKey;

  /// callback when changed search key
  final Function(String searchKey, bool needUpdate)? onChangedSearchKey;

  /// callback when press search
  final Function()? onSearch;

  const HomeScreen({
    super.key,
    required this.portfolios,
    required this.category,
    this.onCategory,
    required this.goods,
    required this.searchKey,
    this.onChangedSearchKey,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {

    final categories = [
      Constants.categoryRide,
      Constants.categoryEat,
      Constants.categoryGrocery,
      Constants.categoryShop,
    ];

    return Column(
      children: [
        // slider
        PortfolioSlider(items: portfolios,),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: Constants.screenPaddingH),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Constants.widgetSpaceV * 2,),
                // what would you like
                const CommonAutoLabel(
                  'What would you like to order today?',
                  color: Constants.fgPrimary,
                  fontSize: Constants.fntBigSize,
                ),
                const SizedBox(height: Constants.widgetSpaceV,),
                // category
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: categories.map((entry) {
                    return CategoryButton(
                      text: entry,
                      selected: isSelCategory(entry),
                      onPressed: () {
                        if (onCategory != null) {
                          onCategory!(entry);
                        }
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: Constants.widgetSpaceV,),
                // search
                CommonTextFieldSearch(
                  selValue: searchKey,
                  onChanged: onChangedSearchKey,
                  onSearch: onSearch,
                ),
                const SizedBox(height: Constants.widgetSpaceV,),
                // good list
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: goods.map((entry) {
                        return GoodBox(
                          good: entry,
                        );
                      }).toList(),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }

  /// check if category is checked or not
  bool isSelCategory(String item) {

    if (category == item) {
      return true;
    }

    return false;
  }

}