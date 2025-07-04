import 'package:e_commerce/features/categories/view/page/list/category_list_view.dart';
import 'package:e_commerce/features/search/view/widgets/search_results.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  final void Function(String id, String categoryName) onPressed;
  final List? categoryList;
  final List? searchResultData;
  final void Function() onProductClicked;
  final void Function(String) onFilterButtonPressed;
  final String selectedGenderText;
  final int selectedOptionsLength;

  const SearchView({
    super.key,
    required this.onPressed,
    required this.categoryList,
    required this.searchResultData,
    required this.onProductClicked,
    required this.onFilterButtonPressed,
    required this.selectedGenderText,
    required this.selectedOptionsLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          categoryList == null ? const EdgeInsets.all(24) : EdgeInsets.all(0),
      child: ListView(
        children: [
          categoryList != null
              ? CategoryListView(
                list: categoryList ?? [],
                onPressed: onPressed,
                categoryTitle: categoryList == null ? '' : null,
              )
              : searchResultData != null
              ? Column(
                children: [
                  SearchResults(
                    searchResultData: searchResultData!,
                    onTap: onProductClicked,
                    onFilterButtonPressed:
                        (variation) => onFilterButtonPressed(variation),
                    selectedOptionsLength: selectedOptionsLength,
                    selectedGenderText: selectedGenderText,
                  ),
                ],
              )
              : Column(children: [Text('not Found')]),
        ],
      ),
    );
  }
}
