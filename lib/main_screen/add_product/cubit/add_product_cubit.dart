import 'dart:io';

import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductIntialState());

  static AddProductCubit get(BuildContext context) => BlocProvider.of(context);
  File? file;
  Future<void> pickGallaryImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      emit(SuccessfulPickImage());
    } else {
      emit(FailPickImage());
      return;
    }
  }

  Future<void> pickCameraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      file = File(image.path);
      emit(SuccessfulPickImage());
    } else {
      emit(FailPickImage());
      return;
    }
  }
}
