import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/categories/model/categories_services.dart';
import 'package:e_commerce/features/categories/view/page/list/category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  // List<Map<String, String>>
  var data = [];
  @override
  void initState() {
    Toastify.init(context);
    getCategories();
    super.initState();
  }

  void getCategories() async {
    var res = await CategoriesServices().getCategoriesData();

    if (res.$1) {
      setState(() => data = res.$3);
    } else {
      Toastify.e(res.$2);
    }
  }

  @override
  Widget build(BuildContext context) {
    void onPressed(String id, String categoryName) {
      context.push('${Routes.categories}/$id?categoryName=$categoryName');
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 5, top: 5),
          child: Back(),
        ),
      ),
      body: CategoryListView(list: data, onPressed: onPressed),
    );
  }
}
