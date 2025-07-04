import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/core/widgets/input_search.dart';
import 'package:e_commerce/features/categories/model/categories_services.dart';
import 'package:e_commerce/features/search/view/page/search_view.dart';
import 'package:e_commerce/features/search/view/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _minKey = GlobalKey<FormBuilderFieldState>();
  final _maxKey = GlobalKey<FormBuilderFieldState>();
  final searchKey = GlobalKey<FormBuilderFieldState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  // List<Map<String, String>>
  List? categoryData = [];
  List? categoryCahcedData;
  Map modalSheetValue = {'sortBy': "", 'gender': "", 'price': []};

  @override
  void initState() {
    Toastify.init(context);
    getCategories();
    super.initState();
  }

  void getCategories() async {
    var res = await CategoriesServices().getCategoriesData();

    if (res.$1) {
      setState(() {
        categoryData = res.$3;
        categoryCahcedData = categoryData;
      });
    } else {
      Toastify.e(res.$2);
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedOptionsLength = 0;
    final user = BlocProvider.of<User>(context);
    String selectedGenderText =
        user.state.gender.isEmpty ? 'Gender' : user.state.gender;

    //! important: u can do in onchange or in onsubmitted, to do
    //! in submitted just replace all code in onchange to on submitted
    void onChanged(String? value) {
      if (value == '') {
        setState(() {
          categoryData = categoryCahcedData;
          filteredsearchResultData = [];
        });
      } else {
        setState(() {
          categoryData = null;
          filteredsearchResultData = filterSearchResults(
            value ?? '',
            searchResultData =
                searchResultData!
                    .map((e) => Map<String, dynamic>.from(e))
                    .toList(),
          );
        });
      }
    }

    void onSubmitted(value) {}
    void onProductClicked() {}
    void onCategoryTilePressed(String id, String categoryName) {
      context.push('${Routes.categories}/$id?categoryName=$categoryName');
    }

    void onFilterButtonPressed(String variant) {
      List<String> list = [];
      String title = '';
      bool isPrice = false;

      switch (variant) {
        case 'filter':
          setState(() {
            selectedOptionsLength = 0;
            modalSheetValue = {'sortBy': "", 'gender': "", 'price': []};
          });
          return;
        case 'onSale':
          return;
        case 'price':
          isPrice = true;
          title = 'Price';
          logger.i('price');
          break;
        case 'sortBy':
          title = 'Sort by';
          list = [
            'Recommended',
            'Newest',
            'Lowest - Highest Price',
            'Highest - Lowest Price',
          ];
          break;
        case 'gender':
          setState(() {
            list = ['Men', "Woman", "Unisex"];
            selectedGenderText = modalSheetValue['gender'];
          });
          break;
        default:
          break;
      }
      showModalBottomSheet(
        context: context,
        builder:
            (context) => StatefulBuilder(
              builder:
                  (context, setState) => BottomSheetWidget(
                    onClose: (value) {
                      setState(() {
                        selectedOptionsLength++;
                        value != null
                            ? modalSheetValue['price'] = (value.values.toList())
                            : null;
                      });
                    },
                    maxFieldKey: _maxKey,
                    minFieldKey: _minKey,
                    name: title,
                    filterList: list,

                    onSelected: (value) {
                      setState(() => modalSheetValue[variant] = value);
                      logger.i([value, modalSheetValue]);
                    },
                    isPrice: isPrice,
                    state: modalSheetValue[variant],
                    formKey: _formKey,
                  ),
            ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 5, top: 5, right: 5),
          child: Back(),
        ),
        title: Hero(
          tag: 'input_search',
          child: InputSearch(
            name: 'search',
            inputKey: searchKey,
            hintText: 'search, something',
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            suffixIcon:
                categoryData == null
                    ? IconButton(
                      onPressed: () {
                        searchKey.currentState?.reset();
                        setState(() => categoryData = categoryCahcedData);
                      },
                      icon: SizedBox(
                        height: 16,
                        width: 16,
                        child: SvgPicture.asset('icons/cross.svg'),
                      ),
                    )
                    : null,
          ),
        ),
      ),
      body: SearchView(
        onPressed: onCategoryTilePressed,
        categoryList: categoryData,
        searchResultData: filteredsearchResultData,
        onProductClicked: onProductClicked,
        onFilterButtonPressed: (variant) => onFilterButtonPressed(variant),
        selectedGenderText: selectedGenderText,
        selectedOptionsLength: selectedOptionsLength,
      ),
    );
  }

  List<Map<String, dynamic>> filterSearchResults(
    String query,
    List<Map<String, dynamic>> data,
  ) {
    if (query.trim().isEmpty) return [];
    final lowerQuery = query.toLowerCase();
    return data.where((item) {
      final name = item['name']?.toString().toLowerCase() ?? '';
      return name.contains(lowerQuery);
    }).toList();
  }

  static String localhost =
      "${dotenv.env['API_URL']!.replaceAll('/api', '')}/uploads/categories";
  static List<Map>? searchResultData = [
    {
      "_id": "683b202b075822c20b228fc4",
      "name": "T-Shirts",
      "url": "$localhost/t_shirts.jpg",
      "price": 104.99,
      "oldPrice": 204.99,
      "isLiked": true,
    },
    {
      "_id": "683b202b075822c20b228fc5",
      "name": "Jeans",
      "url": "$localhost/jeans.jpg",
      "price": 205.99,
      "isLiked": false,
    },
    {
      "_id": "683b202b075822c20b228fc6",
      "name": "Dresses",
      "url": "$localhost/dresses.jpg",
      "price": 206.99,
      "isLiked": false,
    },
    {
      "_id": "683b202b075822c20b228fc7",
      "name": "Jackets",
      "url": "$localhost/jackets.jpg",
      "price": 105.99,
      "oldPrice": 205.99,
      "isLiked": true,
    },
    {
      "_id": "683b202b075822c20b228fc8",
      "name": "Shirts",
      "url": "$localhost/shirts.jpg",
      "price": 54.99,
      "oldPrice": 104.99,
      "isLiked": true,
    },
    {
      "_id": "683b202b075822c20b228fc9",
      "name": "Sweaters",
      "url": "$localhost/sweaters.jpg",
      "price": 209.99,
      "isLiked": false,
    },
    {
      "_id": "683b202b075822c20b228fca",
      "name": "Shorts",
      "url": "$localhost/shorts.jpg",
      "price": 64.99,
      "oldPrice": 114.99,
      "isLiked": true,
    },
    {
      "_id": "683b202b075822c20b228fcb",
      "name": "Shoes",
      "url": "$localhost/shoes.jpg",
      "price": 211.99,
      "isLiked": true,
    },
  ];
  List? filteredsearchResultData = [];
}
