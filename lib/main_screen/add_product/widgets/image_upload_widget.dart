import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_cubit.dart';
import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_states.dart';
import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ImageUploadWidget extends StatelessWidget {
  const ImageUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductCubit addProductCubit = AddProductCubit.get(context);
    return BlocBuilder<AddProductCubit, AddProductState>(
        builder: (context, state) {
      return Stack(
        fit: StackFit.passthrough,
        children: [
          GestureDetector(
            onTap: () {
              addProductCubit.pickImage();
            },
            child: Container(
                height: 35.h,
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
          Positioned(
              top: 24.h,
              left: 60.w,
              child: SizedBox(
                width: 25.w,
                height: 13.h,
                child: Icon(
                  Icons.camera_alt,
                  color: CustomColor.green,
                  size: 30.sp,
                ),
              ))
        ],
      );
    });
  }
}
