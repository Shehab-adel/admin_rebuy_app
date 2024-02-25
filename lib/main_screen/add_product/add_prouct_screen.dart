import 'package:admin_rebuy_app/main_screen/add_product/widgets/image_upload_widget.dart';
import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:admin_rebuy_app/widgets/custom_text_formfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_elevated_button.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: CustomColor.whitecolor,
            )),
        title: Text('Adding Product',
            style: CustomTextStyle.textStyle18
                .copyWith(color: CustomColor.whitecolor)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ImageUploadWidget(),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextFormField(
                height: 70,
                width: 20,
                hintText: 'Title',
                hintStyle: CustomTextStyle.textStyle18,
                textStyle: CustomTextStyle.textStyle18,
              ),
            ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextFormField(
                height: 40.h,
                maxLines: 100,
                hintText: 'Description',
                hintStyle: CustomTextStyle.textStyle18,
                textStyle: CustomTextStyle.textStyle18,
              ),
            ),
            const SizedBox(height: 27),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: CustomTextFormField(
                height: 70,
                width: 20,
                textInputType: TextInputType.number,
                hintText: 'Price LE',
                hintStyle: CustomTextStyle.textStyle18,
                textStyle: CustomTextStyle.textStyle18,
              ),
            ),
            const SizedBox(height: 27),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: CustomTextFormField(
                  height: 70,
                  hintText: 'Discount LE',
                  textInputType: TextInputType.number,
                  hintStyle: CustomTextStyle.textStyle18,
                  textStyle: CustomTextStyle.textStyle18),
            ),
            const SizedBox(height: 27),
            CustomElevatedButton(
              text: 'Save',
              onPressed: () async {},
              height: 7.h,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              decoration: BoxDecoration(shape: BoxShape.rectangle),
              textStyle: CustomTextStyle.textStyle18
                  .copyWith(color: CustomColor.balckcolor),
            ),
          ],
        ),
      ),
    );
  }
}
