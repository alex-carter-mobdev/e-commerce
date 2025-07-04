import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/features/categories/view/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CategoryListView extends StatelessWidget {
  // List<Map<String, String>>
  final dynamic list;
  final void Function(String id, String categoryName) onPressed;

  final String? categoryTitle;

  const CategoryListView({
    super.key,
    required this.list,
    required this.onPressed,
    this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryTitle ?? 'Shop by Categories',
              style: TextStyle(
                color: ThemeColor.black_100,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 14),
            ...list.asMap().entries.map((e) {
              String url =
                  "${dotenv.env['API_URL']!.replaceAll('/api', '')}/uploads/categories/${e.value['image']}";
              String name = e.value['name'] ?? 'SomeThing unexpected happend';

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CategoryTile(
                  name: name,
                  url: url,
                  onPressed: () {
                    onPressed.call(e.value['_id'] ?? '', name);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
