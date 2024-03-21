import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_cubit.dart';
import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_states.dart';
import 'package:admin_rebuy_app/main_screen/add_product/widgets/image_upload_widget.dart';
import 'package:admin_rebuy_app/main_screen/register_screen/cubit/register_cubit.dart';
import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:admin_rebuy_app/widgets/custom_text_formfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/custom_elevated_button.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AddProductCubit addProductCubit = AddProductCubit.get(context);
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
        title: Text(addProductCubit.selectedCollection,
            style: CustomTextStyle.textStyle18
                .copyWith(color: CustomColor.whitecolor)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        child: Form(
          key: addProductCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ImageUploadWidget(),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormField(
                  controller: addProductCubit.titleTextEdController,
                  height: 12.h,
                  hintText: 'Title',
                  hintStyle: CustomTextStyle.textStyle18,
                  textStyle: CustomTextStyle.textStyle18,
                  maxLines: 2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please add a product title';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormField(
                  controller: addProductCubit.descriptionTextEdController,
                  height: 40.h,
                  maxLines: 100,
                  hintText: 'Description',
                  hintStyle: CustomTextStyle.textStyle18,
                  textStyle: CustomTextStyle.textStyle18,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please add a product description';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextFormField(
                  controller: addProductCubit.priceTextEdController,
                  height: 10.h,
                  textInputType: TextInputType.number,
                  hintText: 'Price LE',
                  hintStyle: CustomTextStyle.textStyle18,
                  textStyle: CustomTextStyle.textStyle18,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please add a product price';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextFormField(
                  controller: addProductCubit.oldPriceTextEdController,
                  height: 10.h,
                  hintText: 'Old Price LE',
                  textInputType: TextInputType.number,
                  hintStyle: CustomTextStyle.textStyle18,
                  textStyle: CustomTextStyle.textStyle18,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please add a old price product ';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 5.h),
              BlocBuilder<AddProductCubit, AddProductState>(
                  builder: (context, state) {
                return Container(
                  padding: EdgeInsets.only(right: 30.w),
                  height: 30.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            addProductCubit.addNewTextField();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 9.w,
                      ),
                      addProductCubit.textFormFields.isEmpty
                          ? Expanded(
                              child: Text(
                                'Press on + to add sizes of products',
                                style: CustomTextStyle.textStyle18
                                    .copyWith(color: Colors.white),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return addProductCubit.textFormFields[index];
                                },
                                itemCount:
                                    addProductCubit.textFormFields.length,
                              ),
                            ),
                      SizedBox(
                        width: 9.w,
                      ),
                      IconButton(
                          onPressed: () {
                            addProductCubit.removeTextField();
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                    ],
                  ),
                );
              }),
              SizedBox(width: 3.w),
              BlocConsumer<AddProductCubit, AddProductState>(
                listener: (context, state) {
                  if (state is SuccessfulAddProductCollection) {
                    addProductCubit.loginshowDialog(context, 'Sucessfully',
                        'You already added a new product');
                  } else if (state is FailAddProductCollection) {
                    addProductCubit.loginshowDialog(
                        context, 'Fail', addProductCubit.failCollectionMessage);
                  }
                },
                builder: (context, state) {
                  print("$state ***************");
                  return state is LoadingAddProductCollection ||
                          state is UploadIamgeRunning
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.blue))
                      : CustomElevatedButton(
                          text: 'Save',
                          onPressed: () async {
                            if (addProductCubit.formKey.currentState!
                                    .validate()) {
                              addProductCubit.uploadImage();
                              addProductCubit.getSize();
                              await addProductCubit.createFirestoreCollection();
                            } else {
                              addProductCubit.loginshowDialog(
                                  context, 'Error', 'User does not found');
                            }
                          },
                          height: 7.h,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          textStyle: CustomTextStyle.textStyle18
                              .copyWith(color: CustomColor.balckcolor),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
