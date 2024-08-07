import 'package:admin_rebuy_app/core/functions.dart';
import 'package:admin_rebuy_app/presentation/main_screen/home/cubit/home_cubit.dart';
import 'package:admin_rebuy_app/presentation/main_screen/home/cubit/home_sate.dart';
import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:admin_rebuy_app/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CategoryDetailsWidget extends StatelessWidget {
  const CategoryDetailsWidget({super.key, required this.homeCubit});
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SuccessfulFetchCollection) {
          if (homeCubit.dataList!.isEmpty) {
            customshowDialog(context, 'Empty!',
                'There is no products here.Try to add products first');
          }
        }
      },
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 3.h),
            itemCount: homeCubit.dataList?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                height: 60.h,
                decoration: AppDecoration.outlineBlue.copyWith(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: double.infinity,
                      child: CustomImageView(
                        height: 40.h,
                        imagePath: homeCubit.dataList?[index].image ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(homeCubit.dataList?[index].title ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyle.textStyle17),
                          SizedBox(height: 1.h),
                          Text(
                            homeCubit.dataList?[index].description ?? '0',
                            style: CustomTextStyle.textStyle16
                                .copyWith(color: Colors.grey.shade500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          SizedBox(height: 2.h),
                          Text("${homeCubit.dataList?[index].price ?? 0}",
                              style: CustomTextStyle.textStyle18
                                  .copyWith(color: Colors.blue)),
                          SizedBox(height: 1.h),
                          Row(
                            children: [
                              Text(
                                "${homeCubit.dataList?[index].oldPrice ?? 0}",
                                style: CustomTextStyle.textStyle16.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey),
                              ),
                              SizedBox(width: 16.w),
                              Text(
                                '${homeCubit.dataList?[index].disccountPrecentage} %',
                                style: CustomTextStyle.textStyle16
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
