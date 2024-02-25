import 'package:admin_rebuy_app/main_screen/add_product/widgets/image_upload_widget.dart';
import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ImageUploadWidget()],
        ),
      ),
    );
  }
}
