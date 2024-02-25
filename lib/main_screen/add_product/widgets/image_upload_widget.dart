import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_cubit.dart';
import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_states.dart';
import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ImageUploadWidget extends StatelessWidget {
  const ImageUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductCubit addProductCubit = AddProductCubit.get(context);
    return BlocBuilder<AddProductCubit, AddProductState>(
        builder: (context, state) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              addProductCubit.pickGallaryImage();
            },
            child: Container(
                height: 35.h,
                width: 70.w,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: AppDecoration.outlineWhite,
                child: addProductCubit.file == null
                    ? Icon(
                        Icons.upload,
                        size: 30.sp,
                      )
                    : Image.file(
                        addProductCubit.file!,
                        fit: BoxFit.fill,
                      )),
          ),
          const SizedBox(
            height: 27,
          ),
          IconButton(
              onPressed: () {
                addProductCubit.pickCameraImage();
              },
              icon: Icon(
                Icons.camera_alt,
                color: CustomColor.whitecolor,
                size: 30.sp,
              ))
        ],
      );
    });
  }
}
