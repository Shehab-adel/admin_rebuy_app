import 'package:admin_rebuy_app/presentation/login/cubit/login_state.dart';
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
        .collection("admin")
        .doc("adminLogin")
        .snapshots()
        .forEach((element) {
      if (element.data()?['password'] == passwordController.text) {
        emit(SuccessfulLogin());
      } else {
        emit(FailLogin());
      }
    });
  }
}
