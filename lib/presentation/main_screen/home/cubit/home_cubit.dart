import 'dart:async';
import 'package:admin_rebuy_app/core/app_strings.dart';
import 'package:admin_rebuy_app/network/local/cache%20helper.dart';
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
          .collection(CacheHelper.selectedBranch() ?? AppStrings.beniseuf)
          .get();
      print("${querySnapshot.docs.first.data()['description']}+++++++++++");
      querySnapshot.docs.map((doc) {
        final data = doc.data();
        // print("${data[categoryList[selectedCategory]]['title']}+++++++++++");
        final file = data['image'];
        print('${data['image']}iii+++++++');
        final ref = FirebaseStorage.instance.ref().child(file);
        final url = ref.getDownloadURL();
        dataList?.add(DataModel(
          image: url.toString(),
          title: data['title'],
          description: data['description'],
          price: data['price'],
          oldPrice: data['old_price'],
          disccountPrecentage: data['disccountPrecentage'],
        ));
      });

      emit(SuccessfulFetchCollection());
      print('${dataList?.length} ---------------ss******');
      print('Sucessful ---------------8******');
    } on FirebaseException catch (error) {
      print('${dataList} ---------------data******');

      message = error.toString();
      print('$message  Fail ---------------8******');
      emit(FailFetchCollection());
    } catch (error) {
      message = error.toString();
      print('$message  Fail ---------------******');
      emit(FailFetchCollection());
    }
  }
}
