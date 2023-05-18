import 'package:caraslate_cara_app/common/colors.dart';
import 'package:caraslate_cara_app/common/const_strings.dart';
import 'package:caraslate_cara_app/common/routes.dart';
import 'package:caraslate_cara_app/controller/login_controller.dart';
import 'package:caraslate_cara_app/gen/assets.gen.dart';
import 'package:caraslate_cara_app/services/shared_pref_service.dart';
import 'package:caraslate_cara_app/widgets/text_form_field_widget.dart';
import 'package:caraslate_cara_app/widgets/text_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> formKey = GlobalKey();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.loginLogoImage.image(width: 40.0.h),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.loginTopBorderColor,
                      width: 10.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    left: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    right: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextItemWidget(
                      title: signInAccount,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 2.0.w,
                    ),
                    _loginTextFields(
                        usernameHint, userNameController, Icons.person),
                    _loginTextFields(
                        passwordHint, passwordController, Icons.lock),
                    Container(
                      margin: EdgeInsets.only(top: 2.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Obx(
                                  () => Transform.scale(
                                      scale: 1.7,
                                      child: Checkbox(
                                          value:
                                              loginController.rememberMe.value,
                                          onChanged: (value) {
                                            loginController.rememberMe.value =
                                                !loginController
                                                    .rememberMe.value;
                                          })),
                                ),
                                SizedBox(
                                  width: 1.0.w,
                                ),
                                TextItemWidget(
                                    title: rememberMeTitle, fontSize: 8.0.sp)
                              ],
                            ),
                          ),
                          _signInBtnWidget()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loginTextFields(
      String hint, TextEditingController controller, IconData iconName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0.w),
      decoration: const BoxDecoration(
          border: Border(
        left: BorderSide(
          color: AppColors
              .loginTopBorderColor, // Replace with your desired border color
          width: 3.0, // Replace with your desired border width
        ),
      )),
      child: TextFormFieldWidget(
        hintText: hint,
        controller: controller,
        prefixWidget: Icon(iconName),
        borderColor: AppColors.editTextBorderColor,
      ),
    );
  }

  _signInBtnWidget() {
    return GestureDetector(
      onTap: () {
        if (userNameController.text.isEmpty ||
            passwordController.text.isEmpty) {
          Get.showSnackbar(const GetSnackBar(
            title: 'Username or password required',
            message: 'Username or password required',
          ));
        } else {
          SharedPrefs.setBool('isLogin', true);
          Get.offAllNamed(AppRoutes.home);
        }
      },
      child: Container(
        height: 5.0.h,
        width: 20.0.w,
        color: AppColors.loginBtnColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextItemWidget(
              title: signIn,
              fontSize: 10.0.sp,
              textColor: Colors.white,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 6.0.sp,
            )
          ],
        ),
      ),
    );
  }
}
