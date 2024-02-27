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
  TextEditingController discountTextEdController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? failCollectionMessage;
  Future<void> createAllProductsFirestoreCollection() async {
    emit(LoadingAddProductsCollection());
    final CollectionReference result =
        FirebaseFirestore.instance.collection(AppStrings.allProducts);
    await result
        .doc(selectedCollection)
        .set({'Type': selectedCollection}).then((value) {
      emit(SuccessfulAddProductsCollection());
    }).onError((error, stackTrace) {
      failCollectionMessage = error.toString();
      emit(FailAddProductsCollection());
    });
  }

  String? failInnerCollectionMessage;
  Future<void> createInnerCollection() async {
    emit(LoadingInnerCollection());
    FirebaseFirestore.instance
        .collection(AppStrings.allProducts)
        .doc(selectedCollection)
        .collection(AppStrings.products)
        .add({
      AppStrings.image: file!.path,
      AppStrings.title: titleTextEdController.text,
      AppStrings.description: descriptionTextEdController.text,
      AppStrings.price: priceTextEdController.text,
      AppStrings.discount: discountTextEdController.text,
    }).then((value) {
      emit(SuccessfulInnerCollection());
    }).onError((error, stackTrace) {
      failCollectionMessage = error.toString();
      emit(FailInnerCollection());
    });
    file = null;
    titleTextEdController.clear();
    descriptionTextEdController.clear();
    priceTextEdController.clear();
    discountTextEdController.clear();
  }

  currentCollection(selectedCollection) {
    this.selectedCollection = selectedCollection;
    emit(SelectedCollection());
  }

  void uploadImage() {
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
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Upload is $progress% complete. ***************");
          emit(UploadIamgeRunning());
          break;
        case TaskState.paused:
          print("Upload is paused.**********");
          emit(UploadIamgePaused());
          break;
        case TaskState.canceled:
          print("Upload was canceled ******");
          emit(UploadIamgeCanceled());
          break;
        case TaskState.error:
          print("Upload is error **********");
          emit(UploadIamgeError());
          break;
        case TaskState.success:
          print("Upload is success **********");
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
