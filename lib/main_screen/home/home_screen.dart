import 'package:admin_rebuy_app/main_screen/home/cubit/home_cubit.dart';
import 'package:admin_rebuy_app/main_screen/home/cubit/home_sate.dart';
import 'package:admin_rebuy_app/main_screen/home/widgets/category_details_widget.dart';
import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 20.h,
              margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 8.h),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        homeCubit.selectedCategoryColor(index);
                      },
                      child: Container(
                        width: 40.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                            color: homeCubit.selectedCategory == index
                                ? Colors.red
                                : Colors.grey.shade300,
                            borderRadius: BorderRadiusStyle
                                .roundedBorder5), // Customize the item appearance
                        alignment: Alignment.center,
                        child: Text(homeCubit.categoryList[index],
                            style: CustomTextStyle.textStyle20),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: homeCubit.categoryList.length),
            ),
            SizedBox(height: 3.h),
            const Divider(
              height: 3,
              thickness: 2,
              color: Colors.white,
            ),
            const SingleChildScrollView(child: CategoryDetailsWidget())
          ],
        );
      },
    );
  }
}
