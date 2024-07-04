import 'package:admin_rebuy_app/core/app_strings.dart';
import 'package:admin_rebuy_app/network/local/cache%20helper.dart';
import 'package:admin_rebuy_app/presentation/login/cubit/login_state.dart';
import 'package:admin_rebuy_app/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController passwordController = TextEditingController();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  loginWithFirebase() async {
    emit(LoadingLogin());
    await FirebaseFirestore.instance
        .collection(AppStrings.admin)
        .doc(AppStrings.adminLogin)
        .snapshots()
        .forEach((element) {
      if (element.data()?[AppStrings.password] == passwordController.text) {
        emit(SuccessfulLogin());
        CacheHelper.sharedPreferences.setBool(AppStrings.isLoggin, true);
      } else {
        emit(FailLogin());
        CacheHelper.sharedPreferences.setBool(AppStrings.isLoggin, false);
      }
    });
  }

  List<String> branchesList = [AppStrings.beniseuf, AppStrings.cairo];

  String dropdownValue = AppStrings.beniseuf;

  changeBrancheInDropdown(String? value) {
    dropdownValue = value ?? AppStrings.beniseuf;
    CacheHelper.sharedPreferences.setString(AppStrings.branch, dropdownValue);
    emit(ChangeBrancheInDropdown());
  }

  String startScreen() {
    return CacheHelper.isLoggin() == true
        ? AppRoutes.mainScreen
        : AppRoutes.loginScreen;
  }

  String logoutMess = 'logout';
  void logOut() async {
    emit(LoadingLogout());
    await CacheHelper.sharedPreferences
        .setBool(AppStrings.isLoggin, false)
        .then((value) {
      logoutMess = value.toString();
      emit(SuccessfulLogout());
    }).onError((error, stackTrace) {
      logoutMess = error.toString();
      emit(FailLogout());
    });
  }
}
