import 'dart:async';
import 'package:admin_rebuy_app/core/app_strings.dart';
import 'package:admin_rebuy_app/presentation/main_screen/home/cubit/home_sate.dart';
import 'package:admin_rebuy_app/presentation/main_screen/home/models/data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<String> categoryList = [
    AppStrings.menShirt,
    AppStrings.officeBage,
    AppStrings.dress,
    AppStrings.womenBag,
    AppStrings.pants,
    AppStrings.skirt,
    AppStrings.bag,
    AppStrings.heels,
    AppStrings.bikini,
    AppStrings.flashSale,
    AppStrings.megaSale
  ];

  int selectedCategory = 0;

  void selectedCategoryColor(int index) {
    selectedCategory = index;
    emit(SelectedCategory());
  }

  String? message;
  List<DataModel>? dataList;
  Future<void> fetchDataFromFirestore() async {
    try {
      emit(LoadingFetchCollection());
      final querySnapshot = await FirebaseFirestore.instance
          .collection(categoryList[selectedCategory])
          .get();

      dataList = await Future.wait(querySnapshot.docs.map((doc) async {
        final data = doc.data();
        final file = data['image'];
        final ref = FirebaseStorage.instance.ref().child(file);
        final url = await ref.getDownloadURL();
        return DataModel(
          image: url.toString(),
          title: data['title'],
          description: data['description'],
          price: data['price'],
          oldPrice: data['old_price'],
          disccountPrecentage: data['disccountPrecentage'],
        );
      }).toList());
      emit(SuccessfulFetchCollection());
      print('${dataList?[0].sizeList?[0]} ---------------******');
      print('Sucessful ---------------******');
    } on FirebaseException catch (error) {
      message = error.toString();
      print('$message  Fail ---------------******');
      emit(FailFetchCollection());
    } catch (error) {
      message = error.toString();
      print('$message  Fail ---------------******');
      emit(FailFetchCollection());
    }
  }
}
