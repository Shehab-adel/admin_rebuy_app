import 'package:admin_rebuy_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/custom_elevated_button.dart';
import '../core/theme/theme_helper.dart';
import '../main_screen/register_screen/cubit/register_cubit.dart';

class VerifyEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check your email'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'A verification email has been sent. Please check your inbox and click the link in the email to verify your account.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 80),
            CustomElevatedButton(
              text: 'Go to Home Screen',
              buttonStyle: theme.textTheme.bodyMedium,
              onPressed: () async {
                bool isVerify =
                    await RegisterCubit.get(context).isEmailVerified(context);
                if (isVerify == true) {
                  Navigator.pushNamed(context, AppRoutes.addProduct);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      RegisterCubit.get(context)
                          .snackBar('Please verify your email first.'));
                }
              },
              margin: EdgeInsets.symmetric(horizontal: 30.w),
            ),
          ],
        ),
      ),
    );
  }
}
