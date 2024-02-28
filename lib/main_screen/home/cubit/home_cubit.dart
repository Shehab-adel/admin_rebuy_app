import 'package:admin_rebuy_app/core/app_strings.dart';
import 'package:admin_rebuy_app/main_screen/home/cubit/home_sate.dart';
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
}
