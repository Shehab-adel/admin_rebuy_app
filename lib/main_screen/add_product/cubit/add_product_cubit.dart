import 'dart:io';
import 'package:admin_rebuy_app/core/app_strings.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductIntialState());

  static AddProductCubit get(BuildContext context) => BlocProvider.of(context);
  File? file;

  String selectedCollection = AppStrings.menShirt;
  TextEditingController titleTextEdController = TextEditingController();
  TextEditingController descriptionTextEdController = TextEditingController();
  TextEditingController priceTextEdController = TextEditingController();
  TextEditingController oldPriceTextEdController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String failCollectionMessage = 'Failed to add the product,try later';
  Future<void> createFirestoreCollection() async {
    emit(LoadingAddProductCollection());
    double price = double.parse(priceTextEdController.text);
    double oldPrice = double.parse(oldPriceTextEdController.text);
    await FirebaseFirestore.instance.collection(selectedCollection).add({
      AppStrings.image: file!.path,
      AppStrings.title: titleTextEdController.text,
      AppStrings.description: descriptionTextEdController.text,
      AppStrings.price: price,
      AppStrings.oldPrice: oldPrice,
      AppStrings.disccountPrecentage: {((oldPrice - price) / oldPrice) * 100}
    }).then((value) {
      emit(SuccessfulAddProductCollection());
    }).onError((error, stackTrace) {
      failCollectionMessage = error.toString();
      emit(FailAddProductCollection());
    });
    file = null;
    titleTextEdController.clear();
    descriptionTextEdController.clear();
    priceTextEdController.clear();
    oldPriceTextEdController.clear();
  }

  currentCollection(String selectedCollection) {
    this.selectedCollection = selectedCollection;
    emit(SelectedCollection());
  }

  void uploadImage() async {
// Create the file metadata
    final metadata = SettableMetadata(contentType: "image/jpeg");

// Create a reference to the Firebase Storage bucket
    final storageRef = FirebaseStorage.instance.ref();

// Upload file and metadata to the path
    final uploadTask = storageRef.child(file!.path).putFile(file!, metadata);
// Listen for state changes, errors, and completion of the upload.
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          emit(UploadIamgeRunning());
          break;
        case TaskState.paused:
          emit(UploadIamgePaused());
          break;
        case TaskState.canceled:
          emit(UploadIamgeCanceled());
          break;
        case TaskState.error:
          emit(UploadIamgeError());
          break;
        case TaskState.success:
          emit(UploadIamgeSuccess());
          break;
      }
    });
  }

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

  void loginshowDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: CustomTextStyle.textStyle18),
          content: Text(content, style: CustomTextStyle.textStyle16),
          actions: <Widget>[
            TextButton(
                child: Text('Close', style: CustomTextStyle.textStyle18),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}
