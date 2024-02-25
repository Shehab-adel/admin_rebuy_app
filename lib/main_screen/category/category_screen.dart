import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categoryList.length, // Number of items
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadiusStyle
                  .roundedBorder5), // Customize the item appearance
          alignment: Alignment.center,
          child: Text(categoryList[index], style: CustomTextStyle.textStyle20),
        );
      },
    );
  }

  static const List<String> categoryList = [
    'Men Shirt',
    'Office Bage',
    'Dress',
    'Women Bag',
    'Pants',
    'skirt',
    'Bag',
    'Heels',
    'Bikini'
  ];
}
