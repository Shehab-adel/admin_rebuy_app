import 'package:admin_rebuy_app/main_screen/home/cubit/home_cubit.dart';
import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Container(
      height: 18.h,
      margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 8.h),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 40.w,
              height: 18.h,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadiusStyle
                      .roundedBorder5), // Customize the item appearance
              alignment: Alignment.center,
              child: Text(homeCubit.categoryList[index],
                  style: CustomTextStyle.textStyle20),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 9),
    );
  }
}
