import 'package:admin_rebuy_app/presentation/login/cubit/login_cubit.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "LogOut",
              style: CustomTextStyle.textStyle20.copyWith(color: Colors.white),
            ),
            trailing: TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Branch",
              style: CustomTextStyle.textStyle20.copyWith(color: Colors.white),
            ),
            trailing: TextButton(
              onPressed: () {},
              child: DropdownButton(
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
          ),
        ],
      ),
    );
  }
}
