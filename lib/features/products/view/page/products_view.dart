import 'package:e_commerce/core/widgets/image_asset.dart';
import 'package:e_commerce/features/products/view/widgets/product_button.dart';
import 'package:e_commerce/features/products/view/widgets/product_tile.dart';
import 'package:e_commerce/features/products/view/widgets/product_price.dart';
import 'package:e_commerce/features/products/view/widgets/product_title.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  final Map<String, dynamic>? productData;
  final void Function(String type) onTilePressed;
  final String? selectedSize;
  final String? selectedColor;
  final int? counter;
  final void Function() decrement;
  final void Function() increment;
  final void Function() onAddToBagPressed;

  const ProductsView({
    super.key,
    required this.productData,
    required this.onTilePressed,
    required this.selectedSize,
    required this.selectedColor,
    required this.counter,
    required this.decrement,
    required this.increment,
    required this.onAddToBagPressed,
  });

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          widget.productData != null
              ? Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 24,
                  bottom: 15,
                  right: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.productData?['url'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: index == 0 ? 0 : 10,
                                ),
                                child: ImageAsset(
                                  widget.productData?['url'][index],
                                  width: 161,
                                  height: 248,
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 24),
                        Column(
                          spacing: 15,
                          children: [
                            ProductTitle(widget.productData?["name"]),
                            ProductPrice("${widget.productData?["price"]}"),
                          ],
                        ),
                        SizedBox(height: 33),
                        Column(
                          spacing: 12,
                          children: [
                            ProductTile(
                              name: 'Size',
                              size: widget.selectedSize,
                              onPressed: () => widget.onTilePressed('size'),
                            ),
                            ProductTile(
                              name: 'Color',
                              color:
                                  widget.selectedColor == ''
                                      ? null
                                      : widget.selectedColor,
                              onPressed: () => widget.onTilePressed('color'),
                            ),
                            ProductTile(
                              name: "Quantity",
                              counter: widget.counter,
                              decrement: widget.decrement,
                              increment: widget.increment,
                            ),
                          ],
                        ),
                      ],
                    ),
                    ProductButton(
                      price: "${widget.productData?['price']}",
                      onPressed: widget.onAddToBagPressed,
                    ),
                  ],
                ),
              )
              : Center(child: Text('Loading')),
    );
  }
}
