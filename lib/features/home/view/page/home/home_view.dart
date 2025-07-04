import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/features/home/view/widget/category_item.dart';
import 'package:e_commerce/features/home/view/widget/item_card.dart';
import 'package:e_commerce/features/home/view/widget/link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  final void Function() onInputTap;
  final void Function(String id, String categoryName) onCategoryItemTap;
  final void Function() onCategoryTap;
  final void Function() onTopSellingItemTap;
  final void Function() onNewInTap;
  final void Function() onTopSellingTap;
  final void Function() onNewInItemTap;
  final List<Map>? category;
  final List<Map>? topSelling;
  final List<Map>? newIn;
  final Map<String, List>? likes;

  const HomeView({
    super.key,
    required this.onInputTap,
    required this.category,
    required this.onCategoryItemTap,
    required this.onCategoryTap,
    required this.topSelling,
    required this.onTopSellingItemTap,
    required this.newIn,
    required this.onNewInTap,
    required this.onTopSellingTap,
    required this.likes,
    required this.onNewInItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return category != null && topSelling != null && newIn != null
        ? Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
          child: ListView(
            children: [
              Hero(
                tag: 'input_search',
                child: InkWell(
                  onTap: onInputTap,
                  child: SizedBox(
                    height: 45,
                    child: SvgPicture.asset(
                      'icons/home_input.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Column(
                spacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Link('See All', onTap: onCategoryTap),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 81,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category!.length,
                      itemBuilder: (BuildContext context, int index) {
                        String localhost =
                            "${dotenv.env['API_URL']!.replaceAll('/api', '')}/uploads/categories/${category![index]['image']}";
                        String name = category![index]['name'];
                        String id = category![index]['_id'];

                        return Padding(
                          padding: EdgeInsets.only(
                            left: index != 0 ? 13.25 : 0,
                          ),
                          child: CategoryItem(
                            value: category![index]['name'],
                            url: localhost,
                            onTap: () => onCategoryItemTap(id, name),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Column(
                spacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Selling',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Link('See All', onTap: onTopSellingTap),
                    ],
                  ),
                  GridView.builder(
                    itemCount: topSelling!.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      String name = topSelling![index]['name'];
                      String url = topSelling![index]['url'];
                      double price = topSelling![index]['price'];
                      double? oldPrice = topSelling![index]['oldPrice'];
                      bool tl = likes?['topSellingsLikes']?[index] ?? false;
                      return Padding(
                        padding: EdgeInsets.only(left: index != 0 ? 13.25 : 0),
                        child: ItemCard(
                          name: name,
                          url: url,
                          price: price,
                          oldPrice: oldPrice,
                          onTap: onTopSellingItemTap,
                          isActive: tl,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              Column(
                spacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ThemeColor.primary,
                        ),
                      ),
                      Link('See All', onTap: onNewInTap),
                    ],
                  ),
                  GridView.builder(
                    itemCount: newIn!.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index != 0 ? 13.25 : 0),
                        child: ItemCard(
                          name: newIn![index]['name'],
                          url: newIn![index]['url'],
                          price: newIn![index]['price'],
                          onTap: onNewInItemTap,

                          isActive: likes?['newInLikes']?[index] ?? false,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        )
        : Center(
          child: Row(
            children: [Text('Loading....'), CircularProgressIndicator()],
          ),
        );
  }
}
