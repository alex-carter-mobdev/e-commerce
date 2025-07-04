import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/features/products/view/widgets/bottom_sheet_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({
    super.key,
    required this.name,
    required this.list,
    required this.onSelected,
    required this.state,
  });

  final void Function(String) onSelected;
  final String name;
  final List<Map<String, dynamic>> list;
  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26, top: 19, right: 34),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Clear',
                  style: TextStyle(fontSize: 16, color: ThemeColor.black_100),
                ),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset('assets/icons/cross.svg'),
              ),
            ],
          ),
          SizedBox(height: 28),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,

              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                String color = list[index]['color'] ?? '';
                String title = list[index]['title'];
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: BottomSheetButton(
                    color: color,
                    name: title,
                    onPressed: () => onSelected(title),
                    isActive: color != '' ? color == state : title == state,
                    isColor: color != '',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




// your onpressed
  // void onPressed(isColor) {
  //   showModalBottomSheet(
  //     context: context,
      
  //     builder:
  //         (context) => StatefulBuilder(

  //           builder: (context, setState) {
  //             return ProductBottomSheet(

  //               name:
  //                   isColor
  //                       ? ProductOptionsEnum.color.visulText
  //                       : ProductOptionsEnum.size.visulText,
  //               list: !isColor ? colorList : sizeList,
  //               onSelected: (value) {
  //                 logger.i(value);
  //                 setState(() => state = value);
  //               },
  //               state: state,
  //             );
  //           },
  //         ),
  //   );
  // }



// paste this line to the materialApp
// scrollBehavior: AppScrollBehavior(),

// paste this class whereever u want
// class AppScrollBehavior extends MaterialScrollBehavior {
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//     PointerDeviceKind.touch,
//     PointerDeviceKind.mouse,
//     PointerDeviceKind.trackpad,
//   };
// }


//  this list normal for passing to the list param
  // List<Map<String, String>> sizeList = [
  //   {'title': "S"},
  //   {'title': "M"},
  //   {'title': "L"},
  //   {'title': "XL"},
  //   {'title': "2XL"},
  // ];
  // List<Map<String, String>> colorList = [
  //   {'title': "Orange", 'color': "EC6D26"},
  //   {'title': "Black", 'color': "272727"},
  //   {'title': "Red", 'color': "FA3636"},
  //   {'title': "Yellow", 'color': "F4BD2F"},
  //   {'title': "Blue", 'color': "4468E5"},
  // ];