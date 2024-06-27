import 'package:admin_rebuy_app/presentation/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController passwordController = TextEditingController();
}
