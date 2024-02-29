import 'package:admin_rebuy_app/main_screen/home/cubit/home_cubit.dart';
import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryDetailsWidget extends StatelessWidget {
  const CategoryDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.fetchDataFromFirestore();
    return SizedBox(
      width: 141.h,
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlue.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              homeCubit.dataList?[0].image ?? '',
              height: 30.h,
              width: 30.w,
            ),
            SizedBox(height: 7.h),
            SizedBox(
              width: 105.h,
              child: Text(homeCubit.dataList?[0].title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.textStyle17),
            ),
            SizedBox(height: 11.h),
            Text(
              "299,43",
              style: CustomTextStyle.textStyle16,
            ),
            SizedBox(height: 9.h),
            Row(
              children: [
                Text(
                  homeCubit.dataList?[0].price ?? '',
                  style: CustomTextStyle.textStyle16.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "24% Off",
                    style: CustomTextStyle.textStyle16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
