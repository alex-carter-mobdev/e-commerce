import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/widgets/product_card.dart';
import 'package:e_commerce/features/search/view/widgets/search_filter_button.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  final List searchResultData;
  final void Function() onTap;
  final void Function(String) onFilterButtonPressed;
  final int selectedOptionsLength;
  final String selectedGenderText;

  const SearchResults({
    super.key,
    required this.searchResultData,
    required this.onTap,
    required this.onFilterButtonPressed,
    required this.selectedOptionsLength,
    required this.selectedGenderText,
  });

  @override
  Widget build(BuildContext context) {
    logger.i(selectedOptionsLength);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 17,
      children: [
        SizedBox(
          height: 30,
          width: double.infinity,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              SearchFilterButton(
                onPressed: () => onFilterButtonPressed('filter'),
                isFilter: true,
                showDropDownIcon: false,
                isColorPrimary: true,
                value: '$selectedOptionsLength',
              ),
              SearchFilterButton(
                onPressed: () => onFilterButtonPressed('onSale'),
                isFilter: false,
                showDropDownIcon: false,
                isColorPrimary: false,
                value: 'On Sale',
              ),
              SearchFilterButton(
                onPressed: () => onFilterButtonPressed('price'),
                isFilter: false,
                showDropDownIcon: true,
                isColorPrimary: true,
                value: 'Price',
              ),
              SearchFilterButton(
                onPressed: () => onFilterButtonPressed('sortBy'),
                isFilter: false,
                showDropDownIcon: true,
                isColorPrimary: false,
                value: 'Sort by',
              ),
              SearchFilterButton(
                onPressed: () => onFilterButtonPressed('gender'),
                isFilter: false,
                showDropDownIcon: true,
                isColorPrimary: true,
                value: selectedGenderText,
              ),
            ],
          ),
        ),
        Text('${searchResultData.length} Results Found'),
        GridView.builder(
          itemCount: searchResultData.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
          itemBuilder: (context, index) {
            String name = searchResultData[index]['name'];
            String url = searchResultData[index]['url'];
            double price = searchResultData[index]['price'];
            bool isLiked = searchResultData[index]['isLiked'];
            double? oldPrice = searchResultData[index]['oldPrice'] ?? null;
            return ProductCard(
              name: name,
              url: url,
              price: price,
              onTap: onTap,
              width: 161,
              height: 250,
              isLiked: isLiked,
              oldPrice: oldPrice,
            );
          },
        ),
      ],
    );
  }
}
