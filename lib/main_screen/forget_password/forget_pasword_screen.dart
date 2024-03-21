import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../core/app_strings.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_formfield_widget.dart';
import '../login_screen/cubit/login_cubit.dart';
import '../login_screen/cubit/login_states.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Forget password'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'If you want to recover your account, then please provide your email ID blew..',

                ),
                SizedBox(
                  height: 50.h,
                ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is SuccessfulForgetProcess) {
                      loginCubit.loginshowDialog(context, 'Check your email',
                          loginCubit.returnMessage!);
                    }
                    if (state is FailForgetProcess) {
                      loginCubit.loginshowDialog(
                          context, 'Failing ', loginCubit.returnMessage!);
                    }
                  },
                  builder: (context, state) => CustomTextFormField(
                    controller: loginCubit.forgetPasswordEmailController,
                    hintText: 'yourEmail',
                    imagePath:'',
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomElevatedButton(
                    onPressed: () {
                      loginCubit.resetPassword(context);
                    },
                    text: 'Send')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
