import 'package:admin_rebuy_app/core/functions.dart';
import 'package:admin_rebuy_app/presentation/login/cubit/login_cubit.dart';
import 'package:admin_rebuy_app/presentation/login/cubit/login_state.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({required this.loginCubit, super.key});
  final LoginCubit loginCubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is SuccessfulLogout) {
        customshowDialog(context, loginCubit.logoutMess, 'Is Done!');
      } else if (state is FailLogout) {
        customshowDialog(context, loginCubit.logoutMess, 'Try again!');
      }
    }, builder: (context, state) {
      return Container(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "LogOut",
                style:
                    CustomTextStyle.textStyle20.copyWith(color: Colors.white),
              ),
              trailing: TextButton(
                onPressed: () {
                  loginCubit.logOut();
                },
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Branch",
                style:
                    CustomTextStyle.textStyle20.copyWith(color: Colors.white),
              ),
              trailing: DropdownButton(
                dropdownColor: Colors.blueGrey,
                value: LoginCubit.get(context).dropdownValue,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                items: LoginCubit.get(context).branchesList.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item,
                        style: CustomTextStyle.textStyle16
                            .copyWith(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  LoginCubit.get(context).changeBrancheInDropdown(value);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
