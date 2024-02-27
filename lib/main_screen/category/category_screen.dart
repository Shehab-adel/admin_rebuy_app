import 'package:admin_rebuy_app/core/app_strings.dart';
import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_cubit.dart';
import 'package:admin_rebuy_app/routes/app_routes.dart';
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
        return GestureDetector(
          onTap: () {
            AddProductCubit.get(context).currentCollection(categoryList[index]);
            Navigator.pushNamed(context, AppRoutes.addProduct);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadiusStyle
                    .roundedBorder5), // Customize the item appearance
            alignment: Alignment.center,
            child:
                Text(categoryList[index], style: CustomTextStyle.textStyle20),
          ),
        );
      },
    );
  }

  static const List<String> categoryList = [
    AppStrings.menShirt,
    AppStrings.officeBage,
    AppStrings.dress,
    AppStrings.womenBag,
    AppStrings.pants,
    AppStrings.skirt,
    AppStrings.bag,
    AppStrings.heels,
    AppStrings.bikini
  ];
}
